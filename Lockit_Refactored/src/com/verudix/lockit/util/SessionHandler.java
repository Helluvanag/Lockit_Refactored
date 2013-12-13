package com.verudix.lockit.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionHandler extends HandlerInterceptorAdapter implements HttpSessionListener  {	
	  private static int totalActiveSessions;
	  
	  public static int getTotalActiveSession(){
		return totalActiveSessions;
	  }
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
    throws Exception {
		
		String user_mail = (String)request.getSession().getAttribute("user_mail");
			
		if(user_mail != null){
			return true;
		}else{
			 String errorMsg = "YOUR SESSION HAS EXPIRED AND YOU NEED TO RE-LOGIN!";
			 redirect(request, response, "/login.do?errorMsg="+errorMsg);
		return false;
	}
	}
		
	

@Override
public void sessionDestroyed(HttpSessionEvent arg0) {
	totalActiveSessions--;
		
}
@Override
public void sessionCreated(HttpSessionEvent arg0) {
	// TODO Auto-generated method stub
	totalActiveSessions++;
	
}	
private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException {
  try {
	    response.sendRedirect(request.getContextPath() + path);
  }catch (java.io.IOException e) {
	throw new ServletException(e);
  }
}

}
