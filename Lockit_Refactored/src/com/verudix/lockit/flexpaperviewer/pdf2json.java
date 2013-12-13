package com.verudix.lockit.flexpaperviewer;


public class pdf2json extends common {

	/**
	* Method:render page as image
	*/
	private String pdfpath;
	private String swfpath;
	public pdf2json(String pdfpath, String swfpath){		
		this.pdfpath = pdfpath;
		this.swfpath = swfpath;		
	}
	public String convert(String pdfdoc, String jsondoc, String page)
	{
		try {
			String command = "";
		    if("true".equals(getConfig("splitmode", ""))){
			    command = "\"pdf2json.exe\" \"{path.pdf}{pdffile}\" -enc UTF-8 -compress -split 10 \"{path.swf}{pdffile}_%.js\"";//getConfig("cmd.conversion.splitjsonfile");
			}else{
			    command = "\"pdf2json.exe\" \"{path.pdf}{pdffile}\" -enc UTF-8 -compress \"{path.swf}{pdffile}.js\"";//getConfig("cmd.conversion.jsonfile");
			}
			command = command.replace("{path.pdf}", pdfpath);
			command = command.replace("{path.swf}", swfpath);			
			command = command.replace("{pdffile}", pdfdoc);
			command = command.replace("{jsonfile}", jsondoc);

			if(exec(command)){
				return "[OK]";
			}else{
				return "[Error converting PDF to JSON, please check your directory permissions and configuration]";
			}
		} catch (Exception ex) {
			return "[" + ex.toString() + "]";
		}
	}
}