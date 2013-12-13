<!doctype html>
<%@page import=" com.verudix.lockit.flexpaperviewer.Config" %>
<%
	Config conf = new Config();
	if(conf.getConfig("password") == null){
		response.sendRedirect("../index.jsp");
	}
	String doc = request.getParameter("doc");
	String strExpiry = request.getParameter("expiryDate");
	String strExpMsg = request.getParameter("strExpMsg");
	String strPrint = request.getParameter("strPrint");
	System.out.println("doc...."+doc+"------strExpiry...."+strExpiry+"-----strExpMsg:"+strExpMsg+"-----strPrint:"+strPrint);	
	
	if(doc == null)
		doc = "Paper.pdf";
	String dir = "../";
	if(strExpMsg == ""){ 
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <title>Lockit Document Viewer</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1,width=device-width" />
        <style type="text/css" media="screen">
			html, body	{ height:100%; }
			body { margin:0; padding:0; overflow:auto; }
			#flashContent { display:none; }
        </style>
	   <link rel="stylesheet" type="text/css" href="<%=dir %>css/flexpaper.css" />
		<script type="text/javascript" src="<%=dir %>js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=dir %>js/jquery.extensions.min.js"></script>
		
	<% 	if(strPrint.equals("1")) {%>		
		<script type="text/javascript" src="<%=dir %>js/flexpaper.js"></script>
		<script type="text/javascript" src="<%=dir %>js/flexpaper_handlers.js"></script>
		<%}else { %>
		<script type="text/javascript" src="<%=dir %>js/flexpaper_cRO.js"></script>
		<script type="text/javascript" src="<%=dir %>js/flexpaper_handlers_cRO.js"></script>
		<%} %>
    </head>
    <body>
      <%if(strExpiry != ""){
    	if(strExpiry.equals("1969-01-01 00:00:00.0") || strExpiry == "1969-01-01 00:00:00.0"){ 
    		
    	%>
    	<span id="message" style="display: block; margin: 0px auto; text-align: center;color:red"></span>
    	<%}else{ %>
    	<span id="message" style="display: block; margin: 0px auto; text-align: center;color:red">File Expiry Date : <%=strExpiry%></span><br />
    	<%} %>
		<div id="documentViewer" class="flexpaper_viewer" style="position:absolute;left:10px;top:20px;width:770px;height:500px"></div>
		 
		<script type="text/javascript">
			function getDocumentUrl(document){
				return "view.jsp?doc={doc}&format={format}&page={page}".replace("{doc}",document);     
			}
			function getDocQueryServiceUrl(document){
				return "swfsize.jsp?doc={doc}&page={page}".replace("{doc}",document);
			}
			var startDocument = "<%=doc%>";

			function append_log(msg){
				$('#txt_eventlog').val(msg+'\n'+$('#txt_eventlog').val());
			}

			String.format = function() {
				var s = arguments[0];
				for (var i = 0; i < arguments.length - 1; i++) {
					var reg = new RegExp("\\{" + i + "\\}", "gm");
					s = s.replace(reg, arguments[i + 1]);
				}
			
				return s;
			};
	
			$('#documentViewer').FlexPaperViewer({		
			
				 config : {
					 DOC : escape(getDocumentUrl(startDocument)),
					 Scale : 1, 
					 ZoomTransition : 'easeOut',
					 ZoomTime : 0.5, 
					 ZoomInterval : 0.2,
					 FitPageOnLoad : true,
					 FitWidthOnLoad : false, 
					 FullScreenAsMaxWindow : true,
					 ProgressiveLoading : false,
					 MinZoomSize : 0.2,
					 MaxZoomSize : 5,
					
					 SearchMatchAll : true,
					 RenderingOrder : '<%=(conf.getConfig("renderingorder.primary", "") + "," +	conf.getConfig("renderingorder.secondary", "")) %>',

					 ViewModeToolsVisible : true,
					 ZoomToolsVisible : true,
					 NavToolsVisible : true,
					 CursorToolsVisible : true,
					 SearchToolsVisible : true,
					 
					 DocSizeQueryService : "swfsize.jsp?doc=" + startDocument,
					 jsDirectory : '<%=dir%>js/',
					 localeDirectory : '<%=dir %>locale/',

					 JSONDataType : 'jsonp',
					 key : '<%=conf.getConfig("licensekey", "") %>',

					 WMode : 'window',
					 localeChain: 'en_US'
					 }
			});
					</script>
   </body>
</html>
<%}}else{out.write("THE DOCUMENT GOT EXPIRED!");}%>