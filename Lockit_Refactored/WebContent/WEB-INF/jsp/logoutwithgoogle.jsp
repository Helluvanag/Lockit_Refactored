<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%> 
 <%@page import="java.net.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function newWindow(){
	window.open('common/logout_from_google.jsp','open_window','menubar,toolbar,location,directories,status,scrollbars,resizable,dependent,width=640,height=480,left=0,top=0');
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lockit - Logout Page</title>
</head>

<body onload="javascript:newWindow();">
<jsp:include page="login.jsp"></jsp:include>
</body>
</html>