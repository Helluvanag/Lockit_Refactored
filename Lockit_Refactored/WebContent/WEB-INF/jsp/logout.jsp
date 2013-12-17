<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lockit - Logout Page</title>
</head>
<body>

<jsp:include page="login.jsp"></jsp:include>
<%
Cookie cookie = null;
Cookie[] cookies = null;
// Get an array of Cookies associated with this domain
cookies = request.getCookies();

if( cookies != null ){
    
    for (int i = 0; i < cookies.length; i++){
       cookie = cookies[i];
       System.out.println("Name : " + cookie.getName( ) + ",  ");
       System.out.println("Value: " + cookie.getValue( )+" <br/>");
    }}else{
    	System.out.println("<h2>No cookies founds</h2>");
          }
%>
</body>
</html>