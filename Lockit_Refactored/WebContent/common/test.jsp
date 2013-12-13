<html>
<head>
<script>
function newWindow(doc){
	window.open('../common/simple_document.jsp?doc='+doc+'\'','open_window','menubar,toolbar,location,directories,status,scrollbars,resizable,dependent,width=640,height=480,left=0,top=0');
}
</script>
</head>
<%
 String doc= (String)request.getParameter("doc");
 System.out.println("The doc in test.jsp is---"+doc);
%>
<body onload="javascript:newWindow('<%=doc%>');"></body>
</html>