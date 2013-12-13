package com.verudix.lockit.flexpaperviewer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Flex extends HttpServlet {

	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
	
		System.out.println("Flex servlet invoked.....");
		
		req.setAttribute("doc", "bitmap.pdf");
		req.getRequestDispatcher("/admin/index.jsp").forward(req, res);
	//	window.open('../common/simple_document.jsp?doc='+ $('input:first', this).val(),'open_window','menubar, toolbar, location, directories, status, scrollbars, resizable, dependent, width=640, height=480, left=0, top=0');
		
	}
	
}
