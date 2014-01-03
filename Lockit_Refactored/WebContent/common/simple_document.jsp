<!doctype html>
<%@page import=" com.verudix.lockit.flexpaperviewer.Config" %>
<%
	Config conf = new Config();
	if(conf.getConfig("password") == null){
		response.sendRedirect("../index.jsp");
	}
	String doc = (String)session.getAttribute("sessiondoc");
	String strExpiry = (String)session.getAttribute("sessionexpiryDate");
	String strExpMsg = (String)session.getAttribute("sessionstrExpMsg");
	String strPrint = (String)session.getAttribute("sessionstrPrint");
	System.out.println("doc...."+doc+"------strExpiry...."+strExpiry+"-----strExpMsg:"+strExpMsg+"-----strPrint:"+strPrint);	
	
	if(doc == null)
		doc = "Paper.pdf";
	String dir = "../";
	if(strExpMsg == ""){ 
%>
<html>
    <head>
       <title>Lockit Document Viewer</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <% 	if(strPrint.equals("1")) {%>
		<link href="<%=dir %>css/inner.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="<%=dir %>css/flexpaper.css" />
		<script type="text/javascript" src="<%=dir %>js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=dir %>js/jquery.extensions.min.js"></script>
		<script type="text/javascript" src="<%=dir %>js/flexpaper.js"></script>
		<script type="text/javascript" src="<%=dir %>js/flexpaper_handlers.js"></script>
		<%}else { %>
		<link href="<%=dir %>css/inner.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="<%=dir %>css/flexpaper.css" />
		<script type="text/javascript" src="<%=dir %>js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=dir %>js/jquery.extensions.min.js"></script>
		<script type="text/javascript" src="<%=dir %>js/flexpaper_cRO.js"></script>
		<script type="text/javascript" src="<%=dir %>js/flexpaper_handlers_cRO.js"></script>
		<%} %>    </head>
  <body>
    <div id="Lockit-inner-wrapper">
<!--Lockit-Inner-Header-->
<div id="Lockit-inner-header-wrapper">
    <div class="Lockit-inner-header-container">
      <div class="Lockit-inner-header wd fl">
        	<div class="Lockit-logo fl">
            	<a href="#"><img src="<%=dir %>images/lockit-inn-logo.png" /></a>
            </div>
      </div>
    </div>
</div>
<!--Lockit-Inner-Header- Ends -->
<div class="cl"></div>
<!--Lockit-Inner-body-->
<div id="Lockit-inner-body-wrapper">
    <div class="Lockit-inner-body-container">
      <div class="Lockit-inner-body wd fl">
        <div class="Lockit-main-content fl">
          	<!-- viewer -->
      <%if(strExpiry != ""){
    	if(strExpiry.equals("1969-01-01 00:00:00.0") || strExpiry == "1969-01-01 00:00:00.0"){ 
    	%>
    	<span id="message" style="display: block; margin: 0px auto; text-align: center;color:red"></span>
    	<%}else{ %>
    	<span id="message" style="display: block; margin: 0px auto; text-align: center;color:red">File Expiry Date : <%=strExpiry%></span>
    	<%} %>
		<div id="documentViewer" class="flexpaper_viewer" style="position:relative;left:0px;top:20px;width:980px;height:990px"></div>
		 
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
					 ZoomInterval : 0.1,
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
					 key : '$3eb4364ab4c4961cf0a',

					 WMode : 'window',
					 localeChain: 'en_US'
					 }
			});
			</script>
		   <!--  end viewer-->
           </div>
      </div>
    </div>
</div>
<!--Lockit-Inner-body- Ends -->
<div class="cl"></div><br><br><br>
<!--Lockit-Inner-footer-->
<div id="Lockit-inner-footer-wrapper">
    <div class="Lockit-inner-footer-container">
      <div class="Lockit-inner-footer fl">
		Powered by: Verudix Solutions
      </div>
    </div>
</div>
<!--Lockit-Inner-footer- Ends -->

</div>	
    <!-- end page -->
     
   </body>
</html>
<%}}else{out.write("THE DOCUMENT GOT EXPIRED!");}%>