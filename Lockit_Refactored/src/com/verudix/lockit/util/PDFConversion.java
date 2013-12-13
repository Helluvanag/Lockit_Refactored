package com.verudix.lockit.util;

import java.io.File;
import java.io.FileOutputStream;

import org.apache.log4j.Logger;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.verudix.lockit.flexpaperviewer.Config;

public class PDFConversion
{
	Logger logger = Logger.getLogger(PDFConversion.class);
	
	public String convert2pdf(String pdffilepath, String swffilepath){
		String strCommand2 = "java -jar C:/Lockit_Java/jodconverter-2.2.2/lib/jodconverter-cli-2.2.2.jar" + "  \"" + pdffilepath.replace("\\", "/") + "\"   \"" + swffilepath.replace("\\", "/") +"\"";
		logger.debug("The strCommand is---"+strCommand2);
		Config config = new Config();
		try {
			//Runtime.getRuntime().exec(strCommand2);
			boolean bool = config.exec(strCommand2);
			if(bool)
			return "Success";
			else
			return "Failed";
		} catch (Exception e) {					
			logger.error("IOException in convert2pdf() is----"+e.toString());	
			return "Failed";
		}
		
	}
/**
* This method is used to convert the given file to a PDF format
* @param inputFile - Name and the path of the file
* @param outputFile - Name and the path where the PDF file to be saved
* @param isPictureFile
*/
	public void createPdf(String inputFile, String outputFile, boolean isPictureFile)
	{
		/**
		 * Create a new instance for Document class
		 */
		Document pdfDocument = new Document();
		String pdfFilePath = outputFile;
		try
		{
			FileOutputStream fileOutputStream = new FileOutputStream(pdfFilePath);
			PdfWriter writer = null;
			writer = PdfWriter.getInstance(pdfDocument, fileOutputStream);
			writer.open();
			pdfDocument.open();
			/**
			 * Proceed if the file given is a picture file
			 */
			if (isPictureFile)
			{
				pdfDocument.add(com.itextpdf.text.Image.getInstance(inputFile));
			}
			/**
			 * Proceed if the file given is (.txt,.html,.doc etc)
			 */
			else
			{
				File file = new File(inputFile);
				pdfDocument.add(new Paragraph(org.apache.commons.io.FileUtils.readFileToString(file)));
			}
			pdfDocument.close();
			writer.close();
			}
			catch (Exception exception)
			{
				logger.error("Document Exception!" + exception);
			}
		}

}