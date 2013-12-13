package com.verudix.lockit.flexpaperviewer;


import java.io.File;
import javax.servlet.http.*;

public class pdf2swf extends common{

	HttpServletRequest request = null;

	private String pdfpath;
	private String swfpath;
	public pdf2swf(HttpServletRequest request, String pdfpath, String swfpath){
		this.request = request;
		this.pdfpath = pdfpath;
		this.swfpath = swfpath;		
	}

	public String convert(String doc, String page) {
		
		String pdfFilePath	= pdfpath + doc;
		String swfFilePath	= swfpath + doc + page + ".swf";
		String command		= "\"pdf2swf.exe\" \"{path.pdf}{pdffile}\" -o \"{path.swf}{pdffile}.swf\" -f -T 9 -t -s storeallcharacters -s linknameurl";//getConfig("cmd.conversion.singledoc", "");
		if("true".equals(getConfig("splitmode", "")))
			command = "\"pdf2swf.exe\" \"{path.pdf}{pdffile}\" -o \"{path.swf}{pdffile}_%.swf\" -f -T 9 -t -s storeallcharacters -s linknameurl";//getConfig("cmd.conversion.splitpages", "");

		command = command.replace("{path.pdf}", pdfpath);
		command = command.replace("{path.swf}", swfpath);
		command = command.replace("{pdffile}", doc);

		try {
			if (!isNotConverted(pdfFilePath ,swfFilePath)) {
				return "[Converted]";
			}
		} catch (Exception ex) {
			return "Error," + ex.toString();
		}

		boolean return_var = false;

		if("true".equals(getConfig("splitmode", ""))){
			String pagecmd = command.replace("%", page);
			pagecmd = pagecmd + " -p " + page;
			return_var = exec(pagecmd);
			int hash = getStringHashCode(command);
			HttpSession session = request.getSession(true);
			String constr = "CONVERSION_" + hash;
			String conversion = (String) session.getAttribute(constr);
            if(conversion == null){
                exec(command);
                session.setAttribute(constr, "true");
            }
		}else
			return_var = exec(command);
		String s = "Error converting document, make sure the conversion tool is installed and that correct user permissions are applied to the SWF Path directory" + 
					getDocUrl();
		if(return_var) {
			s="[Converted]";
		}
		return s;
	}

	public boolean isNotConverted(String pdfFilePath,String swfFilePath) throws Exception {
		File f = new File(pdfFilePath);
		if (!f.exists()) {
			throw new Exception("Document does not exist");
		}
		if (swfFilePath == null) {
			throw new Exception("Document output file name not set");
		} else {
			File s = new File(swfFilePath);
			if (!s.exists()) {
				return true;
			} else {
				if(f.lastModified() > s.lastModified()) return true;
			}
		}
		return false;
	}
}