<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
<% 	String logged_user = (String)session.getAttribute("user_name");
	String logged_user_mail = (String)session.getAttribute("user_mail");
	ArrayList<HashMap<String, Object>> ShareProperties=(ArrayList<HashMap<String, Object>>)request.getAttribute("shareFileData");
	String filename = (String)request.getAttribute("file_txt_filename");
	String FileOwnerEmaiId = (String)request.getAttribute("ownerEmaiId");
	String isfolder = (String)request.getAttribute("isfolder");
	String fileShareid = (String)request.getAttribute("fileShareid");
	String Photourl = (String)request.getAttribute("Photourl");	
	String msg = (String)request.getAttribute("message") ;
	String strIntCnt = (String)request.getAttribute("strIntCnt") ;
	String strIsExpiry = (String)request.getAttribute("strIsExpiry") ;
	String strf2path = (String)request.getAttribute("strf2path") ;
	String strFileId = (String)request.getAttribute("strFileId") ;
	String strFolderName = (String)request.getAttribute("strFolderName") ;
	String strFolderExpiry = (String)request.getAttribute("strFolderExpiry") ;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>LockIt :DashBoard</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        
    	<link href="css/inner.css" rel="stylesheet" type="text/css" />
    	<link rel="shortcut icon" href="images/favicon1.ico">
	    <!--Requirement jQuery-->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<!--Load Script and Stylesheet -->
		<script type="text/javascript" src="Scripts/jquery.simple-dtpicker.js"></script>
		<link type="text/css" href="css/jquery.simple-dtpicker.css" rel="stylesheet" />
		<!---->
	
            <link rel="stylesheet" href="css/elusive/css/elusive-webfont.css"/>
            <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300&amp;subset=latin,latin-ext' rel='stylesheet'/>
        <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
  		
  		<link rel="stylesheet" href="Scripts/datepicker.css"/>	
        <script  src="Scripts/prototype-1.js"  type="text/javascript"></script>
		<script src="Scripts/prototype-base-extensions.js"  type="text/javascript"></script>
		<script  src="Scripts/prototype-date-extensions.js"  type="text/javascript"></script>
		<script src="Scripts/behaviour.js"  type="text/javascript"></script>
		<script src="Scripts/datepicker.js"  type="text/javascript"></script>
        <script  src="Scripts/behaviors.js"  type="text/javascript"></script>		
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
 		<script src="js/jquery.autocomplete.js"></script>  
 		<script src="js/datetimepicker_css.js"></script>
  		<script>
			 jQuery(function(){ 
  					$("#txt_email").autocomplete("common/list.jsp");
			 });
   		</script>
		<style type="text/css">
			   .modalBackground
			   {
			   background-color: #fff;
			   filter: alpha(opacity=80);
			   opacity: 0.8;
			   z-index: 10000;
			   }
			   .RadioClass
			   {
			   width:600px;
			   }
			   .ac_results {
			 padding: 0px;
			 border: 1px solid #84a10b;
			 background-color: #E6AFAF;
			 overflow: hidden;
			}
			
			.ac_results ul {
			 width: 100%;
			 list-style-position: inherit;
			 list-style: inside;
			 padding: 0;
			 margin: 0;
			}
			
			.ac_results li {
			 margin: 0px;
			 padding: 1px 1px;
			 cursor: default;
			 display: block;
			 color: #fff;
			 font-family:verdana;
			 
			 if width will be 100% horizontal scrollbar will apear 
			 when scroll mode will be used
			 
			 width: 100%;
			 font-size: 12px;
			 
			 it is very important, if line-height not setted or setted 
			 in relative units scroll will be broken in firefox
			 
			 line-height: 16px;
			 overflow: hidden;
			
			}
			
			.ac_loading {
			 background: white url('../images/indicator.gif') right center no-repeat;
			}
			
			.ac_odd {
			 background-color: #14B9D6;
			 color: #ffffff;
			}
			
			.ac_over {
			 background-color: gray;
			 color: #ffffff;
			}
			
			
			.input_text{
			 font-family:Arial, Helvetica, sans-serif;
			 font-size:12px;
			 border:1px solid #0000;
			 padding:1px;
			 width:200px;
			 color:blue;
			 background:white url(../images/search.png) no-repeat 3px 2px;
			 padding-left:17px;
			} 
  </style>
		<script type="text/javascript">
		function updatesharedFile(fileid,emailid,download,sharing,print,expiredate){
		var vardownload=document.getElementById(download).checked;
	   	var varshare=document.getElementById(sharing).checked;
	   	var varprint=document.getElementById(print).checked; 
	   	var varexpiredate=document.getElementById(expiredate).value;
	   	if(vardownload==true){ vardownload="1"; }else{  vardownload="0";}
	   	if(varshare==true){ varshare="1"; }else{  varshare="0";}
	   	if(varprint==true){ varprint="1"; }else{  varprint="0";}
		document.getElementById("sharedemailid").value=emailid;
		document.getElementById("sharedfileid").value=fileid;
	   	document.getElementById("downloadprop").value=vardownload;
	   	document.getElementById("sharingprop").value=varshare;
	   	document.getElementById("printprop").value=varprint;
	  	document.getElementById("expiredate").value=varexpiredate;
		var f=document.form2;
	     f.method="post";
    	 f.action='sharefile_prpUpdate.do';
    	 f.submit();
		}
		
	function shareFile_Folder(){
		var message = "";
		var i;
		   
		   for (i = 0; i < form1.selector.length; i++)
		   {
		      if (form1.selector[i].checked){
		         message = message + form1.selector[i].value + ",";
		      }
		   }
	       var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  		if (document.form1.txt_email.value == ""){
  		document.getElementById("Lbl_MSGS").innerHTML = "Enter Email ID";
  		document.form1.txt_email.focus();
  		return false;
  		}
  	   	else{
			document.getElementById("file_options").value=message;
			document.getElementById("file_txt_email").value=document.form1.txt_email.value;
			document.getElementById("file_txt_edays").value=document.form1.TxT_Days.value;
			document.getElementById("file_txt_ehours").value=document.form1.TxT_Hrs.value;
			document.getElementById("file_txt_eminuts").value=document.form1.TxT_Mins.value;
			document.form2.file_txt_id.value=document.form1.fileShareid.value;
			document.form2.file_txt_isfolder.value=document.form1.isfolder.value;
			document.form2.file_txt_createdby.value=document.form1.FileOwnerEmaiId.value;
			document.form2.file_txt_name.value='<%=filename%>';
			document.form2.cntInc.value =  "<%=strIntCnt%>";
			document.form2.f2path.value = "<%=strf2path%>";
		   	document.form2.is_expiry.value = "<%=strIsExpiry%>";
		   	document.form2.folderId.value = "<%=strFileId%>";
		   	document.form2.folderName.value = "<%=strFolderName%>";
		   	document.form2.folderExpiry.value = "<%=strFolderExpiry%>";
	        var f=document.form2;
            f.method="post";
      	    f.action='sharefile_folder.do';
      	    f.submit();
     	}
     	
	}
	function cancelPage(){		
		document.form2.cntInc.value =  "<%=strIntCnt%>";
		document.form2.f2path.value = "<%=strf2path%>";
	   	document.form2.is_expiry.value = "<%=strIsExpiry%>";
	   	document.form2.folderId.value = "<%=strFileId%>";
	   	document.form2.folderName.value = "";//Set foldername to empty otherwise it is printed twice in the folder hierarchy
	   	document.form2.folderExpiry.value = "<%=strFolderExpiry%>";
        var f=document.form2;
        f.method="post";
        if("<%=strf2path%>".length != 0){        
  	    	f.action='openFolder.do';
        }else{        
        	f.action='dashboard.do';	
        }
  	    f.submit();
	}
	</script>
	<script type="text/javascript">
	$(function(){
		$('*[name=ExpiryDatetime]').appendDtpicker();
	});
</script>

<!--  tooltop script -->
<script>
$("#myform :input").tooltip({
	 
    // place tooltip on the right edge
    position: "center right",

    // a little tweaking of the position
    offset: [-2, 10],

    // use the built-in fadeIn/fadeOut effect
    effect: "fade",

    // custom opacity setting
    opacity: 0.7

    });

</script>

  <style type="text/css">
        .web_dialog_overlay
        {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            background: #000000;
            opacity: .15;
            filter: alpha(opacity=15);
            -moz-opacity: .15;
            z-index: 101;
            display: none;
        }
        .web_dialog_overlay1
        {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            background: #000000;
            opacity: .15;
            filter: alpha(opacity=15);
            -moz-opacity: .15;
            z-index: 101;
            display: none;
        }
        .web_dialog
        {
            display: none;
            position: fixed;
          /* width: 680px; */
            height: 320px;
            top: 50%;
            left: 50%;
        	 margin-left: -190px;
            margin-top: -100px;
            background-color: #ffffff;
        /*    border: 2px solid #336699;*/
            padding: 0px;
   			border: 1px solid #257dab;
            z-index: 102;
            font-family: Verdana;
            font-size: 10pt;
            
        }
        .web_dialog1
        {
            display: none;
            position: fixed;
        	  width: 400px; 
         /*   height: 320px;*/
            top: 50%;
            left: 50%;
        	 margin-left: -190px;
            margin-top: -100px;
            background-color: #ffffff;
        /*    border: 2px solid #336699;*/
            padding: 0px;
   			border: 1px solid #257dab;
            z-index: 102;
            font-family: Verdana;
            font-size: 10pt;
            
        }
         .web_dialog_overlay3
        {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            background: #000000;
            opacity: .15;
            filter: alpha(opacity=15);
            -moz-opacity: .15;
            z-index: 101;
            display: none;
          
        
        }
        .web_dialog3
        {
            display: none;
            position:fixed; 
            width: 680px; 
            height: 720px;
            top: 20%;
            left: 40%;
        	margin-left: -190px;
            margin-top: -100px;
            background-color: #ffffff;
        /*    border: 2px solid #336699;*/
            padding: 0px;
   			border: 1px solid #257dab;
            z-index: 102;
            font-family: Verdana;
            font-size: 10pt;
            overflow-y:scroll;
            
        }
        .web_dialog_title
        {
            border-bottom: solid 2px #336699;
            background-color: #336699;
            padding: 4px;
            color: White;
            font-weight:bold;
        }
        .web_dialog_title a
        {
            color: White;
            text-decoration: none;
        }
        .align_right
        {
            text-align: right;
        }
       
    </style>
 
 
</head>

<body >

 <form name="form1" method="post" id="form1" enctype="multipart/form-data" action="sharefile.do">
<!-- share -->
<div id="Lockit-inner-wrapper">

<!--Lockit-Inner-Header-->
<div id="Lockit-inner-header-wrapper">
    <div class="Lockit-inner-header-container">
      <div class="Lockit-inner-header wd fl">
        	<div class="Lockit-logo fl">
            	<a href="#"><img src="images/lockit-inn-logo.png" /></a>
            </div>
          <div class="UserName-photo fr">
            <div class="profile-pic">
                <img  class="fl" src='<%=Photourl%>' width="60" height="60"/>
            </div>
			<div class="user-details fl">
            	<div class="username">
	            	<a class="txt-wt-clr" href="editprofile1.do">Welcome:&nbsp;&nbsp;<%=logged_user%></a>
                </div>
            </div>
          </div>
      </div>
    </div>
</div>
<!--Lockit-Inner-Header- Ends -->

<!--Lockit-Inner-body-->
<div id="Lockit-inner-body-wrapper">
    <div class="Lockit-inner-body-container">
      <div class="Lockit-inner-body wd fl">
          <div class="Lockit-Side-Navi fl">
          	<ul>
            	<li class="active"><a href="dashboard.do">Dashboard</a></li>
		            <li><a href="groups.do">Groups</a></li>
		            <li><a href="contacts.do">Contacts</a></li>
		            <li><a href="editprofile1.do">Profile</a></li>
		            <li><a href="help-faqs.do">Help</a></li>
		            <li><a href="loadChPassword.do">Change Password</a></li>
		            <li><a href="logout.do">Logout</a></li>
            </ul>
          </div>
          <div class="Lockit-main-content fl">
          	<div class="navigation-path fl">
            	<ul>
                	<li><a href="dashboard.do"><img src="images/navigation-path-hm-icn.png" /></a></li>
                	<li><img src="images/navigation-path-divlin-icn.png" /></li>
                	<li><a href="dashboard.do">Dashboard</a></li>
                </ul>
            </div>
          	<div class="Body-Title fl">
				<div class="Title3 fl">
                	<a><img class="fl" src="images/Dashboard-icon.png" /></a>
                	<h1>Dash board - Share file/folder</h1>
                </div>
            </div>
            
            <!-- table data -->
           	<div class="share_table fl"><!--SHARE- Ends -->

                <div class="Share-doc-headng fl">Share Document</div>
				<div style="margin-top:10px;" class="Filename-OwnerName fl shr-padding">
				<% if(isfolder.equals("1")){ %>
					<b>Folder Name:</b>
					<%}else{ %>
					<b>File Name:</b><%} %>
					<span id="sharelbl_filename" style="color:blue;"><%= filename %> </span>
	         		<input type="hidden" name="FileOwnerEmaiId" id="FileOwnerEmaiId" value='<%=FileOwnerEmaiId %>'>
  			 		<input type="hidden" name="isfolder" id="isfolder" value='<%=isfolder %>'>
   					<input type="hidden" name="fileShareid" id="fileShareid" value='<%=fileShareid %>'>
				</div>
				<div class="Filename-OwnerName fl shr-padding"><b>Owner Email :</b> <span id="lblFileOwnerEmail"  style="color:blue;"> <%= FileOwnerEmaiId %></span> </div>
                
               <div class="lockit-data-tables wd fl"  style="overflow-y:scroll;height:150px;background-color: #D1DADE;"><!--lockit-data-tables -->
                	<span id="Lbl_MSGS" style="color:red;"></span>
                    <table class="table th-font-color" id="gvSharedUsersSettings">
					<thead> 
                        <tr class="th-font-weight">
						<th class="img-align-left">User name</th>
						<th class="img-align-left">Email</th>
						<th class="img-align-left">Save</th>
						<th class="img-align-center">Share</th>
						<th class="img-align-left">Print</th>
						<th class="img-align-center">Expiry Date Time</th>
						<th class="img-align-center">Update</th>
					</tr>
					</thead>
		
		
		 <%
		
		try{
		if(ShareProperties!=null && ShareProperties.size()>0){                                    
		for(int i=0;i<ShareProperties.size();i++){ 

              System.out.println("Userid:"+ShareProperties.get(i).get("UserID") + "||Download:"+ShareProperties.get(i).get("Download")+ "||Share:" +ShareProperties.get(i).get("Sharing")+"||Print:"+ShareProperties.get(i).get("Print")+" ||ExpireDatetime:"/* +ShareProperties.get(i).get("ExpireDatetime") */);
               %>	
              
             
            <input type="hidden" name="useridhidden" id="useridhidden" value="<%=ShareProperties.get(i).get("UserID") %>"/>
               
			<tr>
			
			<% 
			
			String email=(String)ShareProperties.get(i).get("UserID");
			
			int index =email.indexOf('@');
			String userId = null;
			if (index!= -1)
			{
			userId = email.substring(0,index);
			} 
			String Download=(String)ShareProperties.get(i).get("Download");
			String Sharing=(String)ShareProperties.get(i).get("Sharing");
			String Print=(String)ShareProperties.get(i).get("Print");
			String fileid=(String)ShareProperties.get(i).get("FileID");
			String expireDate=(String)ShareProperties.get(i).get("ExpiredDatetime");
			
			String chk_download="chk_download_";
			String chk_sharing="chk_sharing_";
			String chk_print="chk_print_";
			String modifyexpireDate="expireDate_";
			
			
			%>
				<td colspan=""><%=userId %> </td>
				<td colspan="" ><%=ShareProperties.get(i).get("UserID") %>   </td>				
				<td colspan=""> 
				<%
				if(Download.equals("1")){					
					chk_download=chk_download+i; %> 					
			   <input id=<%= "chk_download_" +i %> type="checkbox" name="box"  checked="checked" />			   
			   <%  }else if(Download.equals("0")){ chk_download=chk_download+i;  %>			   
			   <input id=<%= "chk_download_" +i %> type="checkbox"   value="0"/> 							    
				<%} %>
				 </td>
				<td colspan=""> <%if(Sharing.equals("1")){ 					
					chk_sharing=chk_sharing+i;					
					%>  <input id=<%= "chk_sharing_" +i %> type="checkbox" name="box"   checked="checked" value="share"/>  <% }else if(Sharing.equals("0")){ chk_sharing=chk_sharing+i; %> <input id=<%= "chk_sharing_" +i %> type="checkbox"  value="0"/>    <%   } %> </td>
				<td colspan=""> <%if(Print.equals("1")){ 				
					chk_print=chk_print+i;
					%> 
					    <input id=<%= "chk_print_"+i %> type="checkbox" name="box"   checked="checked" value="print"/>  <% }else if(Print.equals("0")){ chk_print=chk_print+i; %>  <input id=<%= "chk_print_" +i %> type="checkbox"   value="0"/>   <%   } %> </td>
				
			<%-- 	<td colspan="">  <% modifyexpireDate=modifyexpireDate+i; %><input   id=<%= "expireDate_" +i %> name="ExpiryDatetime"  type="text" value="<%=ShareProperties.get(i).get("ExpiredDatetime") %>"  style="width:118px"/> <img src="images/cal.gif" onclick="javascript:NewCssCal ('<%= "expireDate_" +i %>','yyyyMMdd','arrow',true,'24',true)"  style="cursor:pointer"/></td> --%>
				<td colspan="">
    		<% 
    				if(ShareProperties.get(i).get("ExpiredDatetime").equals("1969-01-01 00:00:00.0")){     
     				 modifyexpireDate=modifyexpireDate+i;
     		 %>
    				 <input   id=<%= "expireDate_" +i %> name="ExpiryDatetime"  type="text" value=""  style="width:118px"/><img src="images/cal.gif" onclick="javascript:NewCssCal ('<%= "expireDate_" +i %>','yyyyMMdd','arrow',true,'24',true)"  style="cursor:pointer"/>
     
     		<%}else {  modifyexpireDate=modifyexpireDate+i; %>
     				 <input   id=<%= "expireDate_" +i %> name="ExpiryDatetime"  type="text" value="<%=ShareProperties.get(i).get("ExpiredDatetime") %>"  style="width:118px"/> <img src="images/cal.gif" onclick="javascript:NewCssCal ('<%= "expireDate_" +i %>','yyyyMMdd','arrow',true,'24',true)"  style="cursor:pointer"/>  <%} %></td>
				<td colspan=""><a href="#"><img  src="images/edit.png" style="border-width:0px;" onclick ="updatesharedFile('<%=fileid%>','<%=email%>','<%=chk_download%>','<%=chk_sharing%>','<%=chk_print%>','<%= modifyexpireDate%>')"/> </a></td>  
			</tr>		
		
		 	 <%  }
				}else{			
			 %>
				<B>No Data Found.</B>			
			<%
				}
				}catch(Exception e){}
		 	 %>
		</table>
                </div><!--lockit-data-tables ENDS -->
                <div class="cl"></div>
                <div class="invitefriends-content"><!--invitefriends-content -->
                    <div class="Invite-People-headng fl">Invite People</div>
                    <div class="recp-email_id fl">
                    
                        Recipient Email ID/Group Name: <input name="txt_email" type="text" id="txt_email" placeholder=""/>
                    </div>
                    <!--  validation control -->
                    <div class="Filename-OwnerName fl shr-padding">
					<span id="Lbl_MSGS" style="color:red;"></span>
     				<span id="Lbl_MSGS" style="color:red;"></span>
     			</div>
     			<div>        
        				 <% if(msg!=null){%>              
             				 <span id="error-holder"  style="color:Blue;"><%= msg %></span>
       					 <%} %>                                
       			</div>
       			<!-- end validation -->
       			
                    <div id="ListDivisor"></div>
                    
                    <div style="margin:0px;" class="save-share-print-checkbox fl" id="chkl_accessrights" name="chkl_accessrights"">
                        <ul>
                            <li>
                                <input id="chkl_accessrights_0" type="checkbox" name="selector"  value="save"/>
                                <label for="chkl_accessrights_0">Save</label>
                            </li>
                            <li>
                                <input id="chkl_accessrights_1" type="checkbox" name="selector" value="share"/>
                                <label for="chkl_accessrights_1">Share</label>
                            </li>
                            <li>
                                <input id="chkl_accessrights_2" type="checkbox" name="selector" value="print"/>
                                <label for="chkl_accessrights_2">Print</label>
                            </li>
                        </ul>
                    </div>
      
                    <div class="document_Expiry fl">   
                          Expiry:
                        <input name="TxT_Days" type="text" id="TxT_Days" style="width:50px;">
                          Days 
                        <input name="TxT_Hrs" type="text" id="TxT_Hrs" style="width:50px;">
                          Hours 
                        <input name="TxT_Mins" type="text" id="TxT_Mins" style="width:50px;">
                          Mins
                    </div>
                    <div class="document_Expiry fl">
                    <input type="button" name="btnShare" value="Share" id="btnShare"  onclick="shareFile_Folder()" class="btn login-btn" />
      				<!-- <a href="dashboard.do"> --><input type="button" name="btnShareCancel" onclick="cancelPage()" value="Cancel" id="btnShareCancel" class="btn login-btn" /></a>
                    </div>
                    
                
               </div><!--invitefriends-content ENDS -->
                
            </div>
            <!--  end table data -->
          </div>
      </div>
    </div>
</div>
<!--Lockit-Inner-body- Ends -->

<!--Lockit-Inner-footer-->
<div id="Lockit-inner-footer-wrapper">
    <div class="Lockit-inner-footer-container">
      <div class="Lockit-inner-footer fl">
		<a>Powered by: Verudix Solutions</a>
      </div>
    </div>
</div>
<!--Lockit-Inner-footer- Ends -->

</div>	
<!-- end share -->

</form>


<form name="form2" method="post" id="form2">
  <input type="hidden" name="file_options" id="file_options" value="">
   <input type="hidden" name="file_txt_email" id="file_txt_email" value="">
   <input type="hidden" name="file_txt_edays" id="file_txt_edays" value="">
   <input type="hidden" name="file_txt_ehours" id="file_txt_ehours" value="">
   <input type="hidden" name="file_txt_eminuts" id="file_txt_eminuts" value="">
   <input type="hidden" name="file_txt_id" id="file_txt_id" value="">
   <input type="hidden" name="file_txt_isfolder" id="file_txt_isfolder" value="">
   <input type="hidden" name="file_txt_createdby" id="file_txt_createdby" value="">
   <input type="hidden" name="expiredate" id="expiredate" value="">
   <input type="hidden" name="downloadprop" id="downloadprop" value="">  
   <input type="hidden" name="sharingprop" id="sharingprop" value="">  
   <input type="hidden" name="printprop" id="printprop" value="">  
   <input type="hidden" name="sharedemailid" id="sharedemailid" value=""> 
   <input type="hidden" name="sharedfileid" id="sharedfileid" value=""> 
   <input type="hidden" name="file_txt_name" id="file_txt_name" value=""> 
   <input type="hidden" name="cntInc" id="cntInc" value="">
   <input type="hidden" name="is_expiry" id="is_expiry" value="">
   <input type="hidden" name="f2path" id="f2path" value="">
   <input type="hidden" name="folderId" id="folderId" value="">
   <input type="hidden" name="folderName" id="folderName" value="">
   <input type="hidden" name="folderExpiry" id="folderExpiry" value="">
</form>
</body>
</html>
