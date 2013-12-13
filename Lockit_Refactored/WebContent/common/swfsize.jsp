<% String doc = request.getParameter("doc");
String callback = request.getParameter("callback");
if(callback == null){callback = "";}
com.verudix.lockit.flexpaperviewer.swfsizequery ss = new com.verudix.lockit.flexpaperviewer.swfsizequery();
response.setContentType("application/json");
String outs = "({\"height\":" + ss.getSize(doc,request.getParameter("page"),"height");
outs += ",\"width\":" + ss.getSize(doc,request.getParameter("page"),"width");
%>
<%=callback + outs + ")}" %>