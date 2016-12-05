package gov.cms.qrda.schematron.merge;
/*
Copyright (c) 2016+, ESAC, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this 
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, 
   this list of conditions and the following disclaimer in the documentation 
   and/or other materials provided with the distribution.
 * Neither the name of HL7 nor the names of its contributors may be used to 
   endorse or promote products derived from this software without specific 
   prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE.

*/

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.io.FileUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import gov.cms.qrda.schematron.validate.MergeProperties;
import gov.cms.qrda.schematron.validate.TestFile;
import gov.cms.qrda.schematron.validate.Validator;


public class MergeInstructions extends MergeProperties{

	private Document xmlDoc;
	private String sourceFile;
	private ArrayList<SchematronTemplate> schematrons = new ArrayList<SchematronTemplate>();
	
	private boolean globalStop = false;  // This may get set to true if processing needs to stop due to a detected error somewhere.
	
	public final static String INDENT1 = "    ";
	public final static String INDENT2 = "        ";
	public final static String INDENT3 = "            ";
	public final static String INDENT4 = "                ";
	
	public MergeInstructions() {
		super();
		validator = new Validator(this);
	}
	
	public ArrayList<SchematronTemplate> getSchematrons() {
		return schematrons;
	}

	public void setXmlDoc(Document val) {
		xmlDoc = val;
	}
	
	public Document getXmlDoc() {
		return xmlDoc;
	}
	
	public void setSourceFile(String val) {
		sourceFile = val;
	}
	
	public String getSourceFile() {
		return sourceFile;
	}

	public boolean getGlobalStop() {
		return globalStop;
	}
	
	public void setGlobalStop(boolean val) {
		globalStop = val;
	}
	
	// Reads a mergeInstructions xml file, populates the data, begins collecting status result strings.
	public Document open(String filename) {
		globalStop = false;
		sourceFile = filename;
		addResult(" ");
		addResult("************************************************************************************************************");
		addResult(" MERGE REPORT: " + filename);
		addResult("************************************************************************************************************");
		addResult(INDENT1+"Instructions file: " + filename);
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db;
		try {
			db = dbf.newDocumentBuilder();
			Document doc = db.parse(new File(filename));
			setXmlDoc(doc);
			Element mergeProfile = doc.getDocumentElement();
			setVerbose("true".equalsIgnoreCase(mergeProfile.getAttribute("verboseDebug")));
			setDoValidation("true".equalsIgnoreCase(mergeProfile.getAttribute("doValidation")));
			setStopOnError("true".equalsIgnoreCase(mergeProfile.getAttribute("stopOnError")));
			setStopOnWarning("true".equalsIgnoreCase(mergeProfile.getAttribute("stopOnWarning"))); // deprecated
			setMergeFilename(getNodeValue(mergeProfile,"generatedFilename"));
			setFinalTestFilename(getNodeValue(mergeProfile,"finalTestFilename"));
			setMainSourceDirectory(getNodeValue(mergeProfile,"sourceMainDirectory"));
			setTitle(getNodeValue(mergeProfile,"title"));
			setFileHeader(getNodeValue(mergeProfile,"fileHeader"));
			setMergeReportFilename(getNodeValue(mergeProfile,"mergeReportFilename"));
			System.out.println(INDENT1+  "See merge report in: " + getMergeReportFilename());
			if (getMergeReportFilename() == null || getMergeReportFilename().isEmpty()) {
				useSystemOut = true;;
				System.out.println(INDENT2 + "Merge Report filename not specified. Results will output to console.");
			}
			System.out.println(INDENT1+ "Verbose debugging is : " + ((getVerbose())?"on":"off"));
			
			addResult(INDENT1 + "Title: " + getTitle());
			addResult(INDENT1 + "Generated on " + new Date());
			addResult(INDENT1 + "Verbose Reporting is turned " + ((getVerbose())?"on":"off"));
			addResult(INDENT1 + "Merged file: " + getMergeFilename());
			addResult(INDENT1 + "Merge report file located at: " + getMergeReportFilename());
			//addResult(INDENT1 + "File header: " + getFileHeader());
			
			addResult(INDENT1 + "Validation is turned " + ((getDoValidation())?"on":"off"));
			if (!globalStop && getDoValidation()) {
				addResult(INDENT2 + "Validate final merged file using: " + getFinalTestFilename());
				addResult(String.format(INDENT2 + "Merge Process will %sstop when validation inconsistencies are encountered in the template schematrons", (getStopOnError() ?"":"not ")));
				maybeCopyVocabFile(getNodeValue(mergeProfile,"vocabFilename"));
			}


			addResult(INDENT1 + "Collect schematron template information from source directories...");
			NodeList nodes = mergeProfile.getElementsByTagName("sourceDirectory");
			for (int i = 0; i < nodes.getLength(); i++) {
				if (getGlobalStop()) {
					break;
				}
				Element node = (Element)nodes.item(i);
				String selector = node.getAttribute("selector");
				schematrons = this.appendLists(schematrons, this.getSourceDirectoryFiles(node, selector));
			}
			if (!globalStop) {
				addSchematronListToResults();
			}
		}
		catch (ParserConfigurationException e) {
				globalStop = true;
				addResult("Parser Configuration Exception: " + e.getLocalizedMessage());
				addResult(INDENT1 + "Process HALTED");
				if (getVerbose()) e.printStackTrace();
		} catch (SAXException e) {
			globalStop = true;
			addResult("SAXException: " + e.getLocalizedMessage());
			addResult(INDENT1 + "Process HALTED");
			if (getVerbose()) e.printStackTrace();
		} catch (FileNotFoundException e) {
			globalStop = true;
			addResult("FileNotFoundException: " + e.getLocalizedMessage());
			addResult(INDENT1 + "Process HALTED");
			if (getVerbose()) e.printStackTrace();
		} catch (IOException e) {
			globalStop = true;
			addResult("IOException: " + e.getLocalizedMessage());
			addResult(INDENT1 + "Process HALTED");
			if (getVerbose()) e.printStackTrace();
		} 
		if (globalStop) {
			String msg = INDENT1 + "An error was encountered during setup causing processing to stop";
			System.err.println(msg);
			addResult(msg);
		}

		addResult(INDENT1+"Merge Setup Complete");
		return xmlDoc;
	}
	

	// Returns the text content of the first occurrence of the given node name under the given start node.
	private String getNodeValue(Element startNode, String nodeName) {
		String res = null;
		if (xmlDoc != null) {
			NodeList nodes = startNode.getElementsByTagName(nodeName);
			if (nodes != null && nodes.getLength() > 0) {
				res = nodes.item(0).getTextContent().trim();
			}
			else {
				addResult(INDENT2 + "Failed to locate node: " + nodeName);
			}
		}
		return res;
	}
	
	// Return a list of strings corresponding to the values of child nodes of a given name of the given start node.
	private ArrayList<String> getSubnodeValues(Element startNode, String nodeName) {
		ArrayList<String> res = new ArrayList<String>();
		if (xmlDoc != null) {
			NodeList nodes = startNode.getElementsByTagName(nodeName);
			for (int i = 0; i < nodes.getLength(); i++) {
				Node node = nodes.item(i);
				res.add(node.getTextContent().trim());
			}
		}
		return res;
	}
	
	// Give a sourceDirectory element from the directions file, return a list where
	// each element of the list item corresponding to each subdirectory of the source directory. 
	// Each list item is a list of file names, the first of which is the schematron (.sch) located in the subdirectory,
	// and the remaining file names are the .xml test files also in the subdirectory.
	private ArrayList<SchematronTemplate> getSourceDirectoryFiles(Element parentNode, String selector) {
		ArrayList<SchematronTemplate> fileList = new ArrayList<SchematronTemplate>();
		ArrayList<String> dirNames;
		ArrayList<String> exceptions;
		String relativePath = getNodeValue(parentNode,"directoryName");
		String fullPath = this.getMainSourceDirectory() + relativePath;

		if ("all".equalsIgnoreCase(selector)) {
			exceptions = getSubnodeValues(parentNode,"exclude");
		}
		else  {
			exceptions = getSubnodeValues(parentNode,"include");
		}
		fileList = this.getSchematrons(fullPath, exceptions, selector);
		return fileList;
	}
	
	// Given a directory, returns a list of filenames from that directory. The first item in the list is the schematron file (ext .sch)
	// and the rest of the filenames in the list are the test files (.xml) from the directory.
	private SchematronTemplate getFilesFromDirectory(String fullDirPath) {
		SchematronTemplate template = new SchematronTemplate(fullDirPath);
		File dir = new File(fullDirPath);
		if (dir== null || !dir.exists()) {
			this.addResult(INDENT3 + "Unable to locate directory: " + fullDirPath);
		}

		if (dir.isDirectory()) {
			boolean schFound = false;
			File[] files = dir.listFiles();
			for (File file : files) {
				if (file.getName().endsWith(".sch")) {
					schFound = true;
					template.setSchematronPath(file.getAbsolutePath());
					if (verbose) {
						results.add(INDENT3 + "Located schematron file: " + file.getName());
				}
					break;
				}
			}
			if (!schFound) {
				results.add(INDENT3 + "Could not find a schematron file in template directory: " + fullDirPath);
				return null;
			}
			else {
				for (File file : files) {
					if (file.getName().endsWith(".xml")) {
						template.addTestFile(file.getAbsolutePath());
					}
				}
			}
		}
		return template;
		
	}
	
	// Given a pathname to a directory, return a list of items corresponding to the subdirectories under the given parent directory.
	// Each item is iteself a list of filenames found under the subdirectory. The first filename is a schematron file, the remaining
	// are xml files.
	private ArrayList<SchematronTemplate> getSchematrons(String parentDirPath, List<String> exceptions, String selector) {
		results.add(INDENT2 + "Processing template directory: " + parentDirPath + ", selector: " + selector);
		boolean doAll= ("all".equalsIgnoreCase(selector));
		ArrayList<SchematronTemplate> fileList = new ArrayList<SchematronTemplate>();
		File dir = new File(parentDirPath);
		if (dir== null || !dir.exists()) {
			this.addResult(INDENT3 + "Unable to locate schematron directory: " + parentDirPath);
			this.addResult(INDENT3 + "   Process HALTED");
			globalStop = true;
		}
		else {
			int foundCount = 0;
			int exceptionsSize=exceptions.size(); // Remember original size, since the list will shrink during processing.
			int expectedSize = 0;
			File[] dirFiles = dir.listFiles();
			for (File subdir : dirFiles) {
				// Only look at subDirectories...
				if (subdir.isDirectory()) {
					if (doAll) {
						// We are processing all the subDirs in the source folder, with the exception of those listed in the exceptions list...
						if (!exceptions.contains(subdir.getName())) {
							foundCount++;
							SchematronTemplate files = getFilesFromDirectory(subdir.getAbsolutePath());
							if (files != null) {
								fileList.add(files);
							}
						}
						else {
							exceptions.remove(subdir.getName()); // This subdir was, indeed, found in the exceptions list, so remove it.
						}
					}
					else if (exceptions.contains(subdir.getName())) {
						// We are only processing some subDirs in the source folder, so see if this one is in the include (aka exceptions) list...
						exceptions.remove(subdir.getName()); // It is in the list, so remove it.
						foundCount++;
						SchematronTemplate files = getFilesFromDirectory(subdir.getAbsolutePath());
						if (files != null) {
							fileList.add(files);
						}
					}
				}
			}
			// Now we need to see if the exceptions list is empty (it should be, because we've been removing found subdirs from the list.)
			if (doAll) {
				expectedSize = foundCount = exceptionsSize; // Note what were expecting in the case where we process all subdirs.
				if (verbose) {
					this.addResult(INDENT3 + "Processed " + foundCount + " (" + expectedSize + " expected) schematron folders.");
				}
				if (exceptions.size() > 0) {
					//globalStop = stopOnError; // Only halt processing when an excluded subdir is missing if stopOnError is true;
					globalStop = true;  // 
					this.addResult(INDENT3 + "The following schematron folders to be excluded were not found in " + parentDirPath);
					for (String subdir : exceptions) {
						this.addResult(INDENT4 + "'"+subdir+"'");
					}
					if (globalStop) {
						this.addResult(INDENT3 + "PROCESS HALTED");
					}
					else {
						// This will never get printed as long as we set globalStop=true above.
						this.addResult(INDENT3 + "(Set stopOnError=true to halt processing when folders in the exclude lists are not found.)");
					}
				}
			}
			else {
				expectedSize = exceptionsSize; // Note what were expecting in the case where we process only some subdirs
				if (verbose){
					this.addResult(INDENT3 + "Processed " + foundCount + " (" + expectedSize + " expected) schematron folders.");
				}
				if (exceptions.size() > 0) {
					globalStop = true; // Always halt processing if an included subdir is missing
					this.addResult(INDENT3 + "The following schematron folders were expected but not found in " + parentDirPath);
					for (String subdir : exceptions) {
						this.addResult(INDENT4 + "'"+subdir+"'");
					}
					this.addResult(INDENT3 + "PROCESS HALTED");
				}
			}
		}
		return fileList;
	}
	
	// Adds the elements of the additions list param to the currentList param
	private ArrayList<SchematronTemplate> appendLists(ArrayList<SchematronTemplate> currentList, ArrayList<SchematronTemplate> additions) {
		for (SchematronTemplate item : additions) {
			currentList.add(item);
		}
		return currentList;
	}
	
	// Returns the filenames of the schematrons found in the list of schematron template objects
	public ArrayList<String> getSchematronsOnly() {
		ArrayList<String> filenames = new ArrayList<String>();
		for (SchematronTemplate schematron : schematrons) {
			filenames.add(schematron.getSchematronPath());
		}
		return filenames;
	}
	
	// Static method to read a file containing a list of mergeInstruction filenames.
	// Lines beginning with "#" are ignored.
	public static ArrayList<String> getInstructionFiles(String instructionFileListFilename) {
		ArrayList<String> mergeInstructionFiles = new ArrayList<String>();
		try {
			File file = new File(instructionFileListFilename);
			FileInputStream source = new FileInputStream(file);
			BufferedReader br = new BufferedReader(new InputStreamReader(source));
			String strLine = null;
			while((strLine = br.readLine()) != null ) {
				strLine = strLine.trim();
				if (!strLine.isEmpty() && !strLine.startsWith("#")) {
					mergeInstructionFiles.add(strLine.trim());
				}
			}
			br.close();
		}
		catch (IOException e) {
			System.out.println("Error reading merge instruction master file: "+instructionFileListFilename + ", " + e.getMessage());
		}
		return mergeInstructionFiles;
	}

	public String getHeaderText() {
		return String.format("\n   %s \n   %s\n   %s \n", getTitle(), getFileHeader(),new Date());
	}
	
	// Copies the file found at filename to the application's main directory with the name "voc.xml"
	private void maybeCopyVocabFile(String filename) {
		if (getDoValidation()) {  // No need for vocab file if we aren't doing validation.
			if (filename != null && !filename.isEmpty()) {
				setVocabFilename(filename);	
				File source = new File(filename);
				File dest = new File("voc.xml");
				try {
				    FileUtils.copyFile(source, dest);
				    if (getVerbose()) {
				    	addResult(INDENT2+"Copied vocabulary file: " + filename + " into project space as 'voc.xml'");
				    }
				} catch (IOException e) {
				    if (getVerbose()) {
				    	System.err.println(INDENT1 + "IOException Error copying vocabulary from " + source.getAbsolutePath() + " to " + dest.getAbsolutePath());
				    	e.printStackTrace();
				    }
				    addResult(INDENT2+"IOException Error copying vocabulary file from " + filename + ": " + e.getMessage());
				}
			}
		}
	}
	
	// Add a listing of the schematron templates to the results list, The nature of the listing depends on the
	// verbose and validation settings.
	private void addSchematronListToResults() {
		addResult(String.format("%s%d schematron templates identified for merging", INDENT2,schematrons.size()));
		if (getVerbose()) {
			addResult(INDENT1+"Schematron files gleaned from merge instructions: ");
			if (getVerbose() && getDoValidation()) {
				for (SchematronTemplate schematron : schematrons) {
					addResult(INDENT2+"------------------------------------");
					addResult(INDENT2 + "Template Directory: " + schematron.getParentPath());
					addResult(INDENT2 + "Schematron: " + schematron.getSchematronPath());
					addResult(INDENT2 + "Test File(s): ");
					for (String filename : schematron.getTestFiles()) {
						addResult(INDENT3 + filename);
					}
				}
			}
			else {
				for (SchematronTemplate schematron : schematrons) {
					addResult(INDENT2 + schematron.getSchematronPath());
				}	
			}
			addResult(INDENT2+"-------------- end schematron file list-------------------");
		}
	}
	
	// Writes the results string array to a file indicated by the value of mergeReportFilename
	public void writeResults() {
		if (mergeReportFilename == null || mergeReportFilename.isEmpty()) {
			System.err.println("Error writing to report filename: Merge instructions had no mergeReportFilename set.");
		}
		else {
			File file = new File(mergeReportFilename);
			try {
				FileOutputStream fos = new FileOutputStream(file);
				 
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));
			 
				for (String line : getResults()) {
					bw.write(line);
					bw.newLine();
				}
			 
				bw.close();
			}
			catch (Exception e) {
				System.err.println("Error writing results to file " + mergeReportFilename + ": " + e.getMessage());
				e.printStackTrace();
			}
		}
	}

	// Opens the given file and attempts to read the expectedErrors and expectedWarnings line from the file.
	public TestFile findExpectedErrorText(String path) {
		final Integer MAXLINE = 100; // Search only the first 100 lines.
		try {
			File file = new File(path);
			FileInputStream source = new FileInputStream(file);
			BufferedReader br = new BufferedReader(new InputStreamReader(source));
			String strLine = null;
			Integer lineNum = 0;
			TestFile spec = new TestFile();
			boolean errTxtFound = false;
			boolean warnTxtFound = false;
			// Search each line of the first MAXLINEs in the file, and search for token error and/or warning text. If found, set value in give FileSpec object
			while((strLine = br.readLine()) != null && lineNum < MAXLINE) {
				lineNum++;
				
				strLine = strLine.toLowerCase();
				if (!errTxtFound && strLine.contains("total errors expected")) {
					String[] split = strLine.trim().split(" ");
					spec.setExpectedErrors(Integer.valueOf(split[split.length-1]));
					errTxtFound = true;;
				}
				if (!warnTxtFound && strLine.contains("total warnings expected")) {
					String[] split = strLine.trim().split(" ");
					spec.setExpectedWarnings(Integer.valueOf(split[split.length-1]));
					warnTxtFound = true;
				}
			}
			br.close();
			return spec;
		}
		catch (IOException e) {
			if (getVerbose()) addResult(INDENT3+"IOError reading expected error/warning count from file: " + path + ", " + e.getMessage());
		}
		return null;
	}
	

 }
