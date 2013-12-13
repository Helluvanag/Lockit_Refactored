<%@page import="com.verudix.lockit.flexpaperviewer.uploadify" %>
<%
System.out.println("here");
uploadify u = new uploadify();
u.upload(request);
%>