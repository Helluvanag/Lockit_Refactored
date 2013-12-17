<%@page import="com.verudix.lockit.service.DashboardServiceImpl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector,java.util.Collection"%>
<%@page import="com.verudix.lockit.util.LockitConstants"%>
<%@page import="java.io.File"%>
<%@page import="com.verudix.lockit.flexpaperviewer.Config"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
    
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
	String[] strArrName = (String[])session.getAttribute("strArrName");
	String[] strArrPath = (String[])session.getAttribute("strArrPath");
	String[] strArrFileId = (String[])session.getAttribute("strArrFileId");
	String[] strArrIsExpiry = (String[])session.getAttribute("strArrIsExpiry");
	int[] intCounter = (int[])session.getAttribute("intCounter");	
	String fileShareid,isfolder,createdby,str_file_id,str_file_name,str_file_path,str_is_folder,str_is_secure,str_delete_file,str_is_expiry;
 	String fileid = (String) request.getAttribute("Clickfileid1");
 	String shareUpdate = (String) request.getAttribute("shareUpdate");	
 	String strFolderName=(String) request.getAttribute("strFolderName");
 	String strFileId=(String) request.getAttribute("strFileId");
 	String strIsExpiry=(String) request.getAttribute("strIsExpiry");
 	String msg = (String)request.getAttribute("message") ;
	String errmsg = (String)request.getAttribute("error_message") ;
	String logged_user = (String)session.getAttribute("user_name");
	String logged_user_mail = (String)session.getAttribute("user_mail");
	String rootpath = getServletContext().getRealPath("/")+"Userfiles"+File.separator+logged_user_mail+File.separator+ "My Files"+"/";
	DashboardServiceImpl dashboardServiceImpl=(DashboardServiceImpl)config.getServletContext().getAttribute("dashboardServiceImpl");
	String dropdown = (String) request.getAttribute("dropdown");
	dropdown = dropdown==null? "" : dropdown;
	
	String strf2path = (String) request.getAttribute("f2path");
	String strCntInc = (String) request.getAttribute("strCntInc");
	int add;
	strCntInc = strCntInc==null? "0" : strCntInc;
	strf2path = strf2path==null? "" : strf2path;	
	int intCount=0;  
	
	if(!strf2path.equals("")){
		 add = Integer.parseInt(strCntInc);	
		 intCount= intCount + add +1;
		 strArrName[intCount] = strFolderName;
		 strArrPath[intCount] = strf2path;
		 strArrFileId[intCount] = strFileId;
		 strArrIsExpiry[intCount] = strIsExpiry;
		 intCounter[intCount] = intCount;
	}  else{
		 System.out.println("INside f2path null ");
		 strArrName[intCount] = "";
		 strArrPath[intCount] = "";
		 strArrFileId[intCount] = "";
		 strArrIsExpiry[intCount] = "";
		 intCounter[intCount] = intCount;
	} 
	
	if(dropdown.length() == 0 || dropdown == ""){
		dropdown = "All";		
	}
	ArrayList<HashMap<String, Object>> mydata =(ArrayList<HashMap<String, Object>>)request.getAttribute("mydata");
	String Photourl = (String)request.getAttribute("Photourl");
	
%>  
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Lockit - Dashboard</title>

        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
            
        <!--  new css -->
        <link href="css/inner.css" rel="stylesheet" type="text/css" />
        <link href="css/popup.css" rel="stylesheet" type="text/css" />
        
       
        
        <!-- elusive webicons -->
            <link rel="stylesheet" href="css/elusive/css/elusive-webfont.css"/>
        <!-- custom fonts -->
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300&amp;subset=latin,latin-ext' rel='stylesheet'/>
        <!-- custom assets -->
        <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
  		
        <script  src="Scripts/prototype-1.js"  type="text/javascript"></script>
		<script src="Scripts/prototype-base-extensions.js"  type="text/javascript"></script>
		<script  src="Scripts/prototype-date-extensions.js"  type="text/javascript"></script>
		<script src="Scripts/behaviour.js"  type="text/javascript"></script>
		<script src="Scripts/datepicker.js"  type="text/javascript"></script>
        <script  src="Scripts/behaviors.js"  type="text/javascript"></script>		
		<link rel="stylesheet" href="Scripts/datepicker.css"/>		
		<script src="js/jquery.min.js" type="text/javascript"></script>
		
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
		</style>
		
		
<!--      ADDED FOR MODAL POP-UP           -->

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
           .web_dialog3
        {
            
            position: fixed;
        	  width: 760px; 
        height: 420px;
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
            overflow-y:scroll;display:none;
            
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
 
 	<script type="text/javascript">
        $(document).ready(function ()
        {    
        	$("#kwd_search").keyup(function(){
        		
        		   // When value of the input is not blank
        		   if( $(this).val() != "")
        		   {
        		    // Show only matching TR, hide rest of them
        		    $("#my-table tbody>tr").hide();
        		    $("#my-table td:contains-ci('" + $(this).val() + "')").parent("tr").show(); 
        		   }
        		   else
        		   {
        		    // When there is no input or clean again, show everything back
        		    $("#my-table tbody>tr").show();
        		   }
        	});
        	 $.extend($.expr[":"], 
        			 {
        			     "contains-ci": function(elem, i, match, array) 
        			  {
        			   return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
        			 }
        	});
            $("#btnShowModal_FileUpload").click(function (e)
            {
                ShowDialog(true);
                e.preventDefault();
            });            
            $("#btnShowModal_FolderUpload").click(function (e)
                    {
                        ShowDialog1(true);
                        e.preventDefault();
                    });

      	   $("#btnUploadFile").click(function (e)
            {    			
				 var f=document.form1;
				 f.f1fileid.value="<%=strFileId%>";
				 f.f1filename.value="<%=strFolderName%>";
				 f.f1isexpiry.value="<%=strIsExpiry%>";
				 f.f1cntinc.value="<%=strCntInc%>";
				
	        	 f.method="post";	        	
	        	 f.action='uploadfile.do';
	        	 f.submit();				
				 HideDialog();
                 e.preventDefault();			
            });
            
          $("#btnCancelFile").click(function (e)
            {        		        				
        		HideDialog();
                e.preventDefault();
        			
            });
            
          $("#btnUploadFolder").click(function (e)
             {
        		var f=document.form1;
        		f.f1fileid.value="<%=strFileId%>";
				f.f1filename.value="<%=strFolderName%>";
				f.f1isexpiry.value="<%=strIsExpiry%>";
				f.f1cntinc.value="<%=strCntInc%>";
        	    f.method="post";
        	    f.action='createFolder.do';
        	    f.submit();				
        		HideDialog();
                e.preventDefault();			
             });
                    
          $("#btnCancelFolder").click(function (e)
              {        		        				
                HideDialog1();
                e.preventDefault();
                			
             });
          $("#btnDelFileFolder").click(function (e)
                {          		
        	 	var f=document.form2;
            	f.file_id.value=str_file_id;
    		    f.file_name.value=str_file_name;
    		    f.file_path.value=str_file_path;
    		    f.is_folder.value=str_is_folder;
    		    f.is_secure.value=str_is_secure;
    		    f.functionality.value=str_delete_file;
    		   
        	    f.method="post";        	    
        	    f.action="deleteFile.do";
        	    f.submit(); 
        	    HideDialog3();
                e.preventDefault();
                });
          $("#btnCancelDelFileFolder").click(function (e)
                {
                     HideDialog3();
                     e.preventDefault();
                });      
                  
          }); 
        function ShowDialog(modal)
        {
            $("#overlay").show();
            $("#dialog").fadeIn(300);

            if (modal)
            {
                $("#overlay").unbind("click");
            }
            else
            {
                $("#overlay").click(function (e)
                {
                    HideDialog();
                });
            }
        }
        function ShowDialog1(modal)
        {
            $("#overlay1").show();
            $("#dialog1").fadeIn(300);

            if (modal)
            {
                $("#overlay1").unbind("click");
            }
            else
            {
                $("#overlay1").click(function (e)
                {
                    HideDialog();
                });
            }
        }
        function ShowDialog3(modal)
        {
            $("#overlay3").show();
            $("#dialog3").fadeIn(300);

            if (modal)
            {
                $("#overlay3").unbind("click");
            }
            else
            {
                $("#overlay3").click(function (e)
                {
                    HideDialog3();
                });
            }
        }
        function HideDialog3()
        {
            $("#overlay3").hide();
            $("#dialog3").fadeOut(300);
        } 
        function HideDialog()
        {
            $("#overlay").hide();
            $("#dialog").fadeOut(300);
        }
        function HideDialog1()
        {
            $("#overlay1").hide();
            $("#dialog1").fadeOut(300);
        }   
        function get_selection(input) {
        	var f=document.form2;
    		document.getElementById("selection").value = input;      		
    		f.method="post";
    	    f.action='dashboard.do';
    	    f.submit();
    	}
        function open_file_folder(id,name,path,isfolder,issecure,openfile,ownerid,isexpiry){ 
        		
        			var f=document.form2;
        			f.method="post";
        		    f.file_id.value=id;
        		    f.file_name.value=name;
        		    f.file_path.value=path;
        		    f.is_folder.value=isfolder;
        		    f.is_secure.value=issecure;
        		    f.functionality.value=openfile;
        		    f.owner_id.value=ownerid;
        		    f.is_expiry.value=isexpiry;
        		    if(isfolder==0){
        		    	f.action="openFile.do";
        		    }else{
        		    	var f2path = document.getElementById("f2path");
        		    	var f1path = document.getElementById("f1path");
        		    	document.getElementById("cntInc").value = "<%=intCount%>";        		   		
        		    	f1path.value = path+name+'/';
        		    	f2path.value = path+name+'/';
        		       	f.action="openFolder.do";
        		    }
        		   	f.submit();
        }        
        function download_file(id,name,path,isfolder,issecure,downloadfile){       	
    	    var f=document.form2;
    	    f.method="post";
    	    f.file_id.value=id;
		    f.file_name.value=name;
		    f.file_path.value=path;
		    f.is_folder.value=isfolder;
		    f.is_secure.value=issecure;
		    f.functionality.value=downloadfile;
    	    f.action="downloadFile.do";
    		f.submit();
    	}
        function delete_file(id,name,path,isfolder,issecure,deletefile){
        	str_file_id=id;
		    str_file_name=name;
		    str_file_path=path;
		    str_is_folder=isfolder;
		    str_is_secure=issecure;
		    str_delete_file=deletefile;
        	ShowDialog3(true);        	
        }        
        function sharefile(id,filename,userid,isfolder1,createdby1,ownerid){
            document.form2.file_txt_id.value=id;
            document.form2.file_txt_filename.value= filename;
          	document.form2.file_txt_isfolder.value=isfolder1;       	 
          	var f=document.form2;
            f.method="post";
            f.action='sharefile.do';
            f.submit();
          }
      
		function newWindow(doc){
			window.open('common/simple_document.jsp?doc='+doc,'open_window','menubar,toolbar,location,directories,status,scrollbars,resizable,dependent,width=640,height=480,left=0,top=0');
		}
        function getSelected(){        	
        	var sel = document.getElementById("select");
       		var selection = document.getElementById("selection").value;
       		var index = sel.options[0].selected;
    		var len = sel.length;
    		for(var i=0;i<=len;i++){
    			 var selectValue=sel.options[i].value;
    			 if(selectValue == selection){
    				 select.options[i].selected=true;
        			 break;
        		 	} 
    		}
        } 
        function openFolderHierarchy(folpath,fid,folexpiry,intCounter,folname){   	        	
        	var f=document.form2;
        	f.file_id.value=fid;
 		    f.file_path.value=folpath;
 		    f.is_expiry.value=folexpiry;        	
			f.f2path.value=folpath;	
			f.file_name.value=folname;			
			if(intCounter != 0){
				f.cntInc.value=intCounter-1;
			}else{
				f.cntInc.value=intCounter;
			}			   	
	       	f.action="openFolder.do";
	       	f.method="post";
			f.submit();
        }
     </script>
</head>


 <%
	String strBool = (String)request.getAttribute("bool");
	if(strBool.length() > 0){
	if(!strBool.equals("null")){	
		String strExpiry = (String)request.getAttribute("strExpiredDateTime");
		String strPrint = (String)request.getAttribute("strPrint");
		String strExpMsg = (String)request.getAttribute("strExpMsg");	
		 session.setAttribute("sessiondoc", strBool);
		 session.setAttribute("sessionexpiryDate", strExpiry);
		 session.setAttribute("sessionstrExpMsg", strExpMsg);
		 session.setAttribute("sessionstrPrint", strPrint); 
    %>
<body onload="newWindow('<%= strBool%>')" style="background:#e5e9ec;">
<%
	}} else{
%>
<body onload="getSelected()" style="background:#e5e9ec;">
<% }%>

<form name="form1" method="post" id="form1" enctype="multipart/form-data">
<input type="hidden" id="f1path" name="f1path" value="<%=strf2path%>">
<input type="hidden" id="f1fileid" name="f1fileid" value="">
<input type="hidden" id="f1filename" name="f1filename" value="">
<input type="hidden" id="f1isexpiry" name="f1isexpiry" value="">
<input type="hidden" id="f1cntinc" name="f1cntinc" value="">


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
                	<li><a href="#">Dashboard</a></li>
                </ul>
            </div>
          	<div class="Body-Title fl">
				<div class="Title fl">
                	<a><img class="fl" src="images/Dashboard-icon.png" /></a>
                	<h1>Dashboard</h1>
                </div>
                <div class="btn-search fr">
                	<ul>
                    	<li>
                    		<a class="login-btn" id="go" rel="leanModal" name="upload" href="#upload-file"><img src="images/uploada.png" /></a>
                    	</li>
                    	<li>
                    		<a class="login-btn" id="go" rel="leanModal" name="create" href="#create-folder"><img src="images/create-folder.png" /></a>
                    	</li>
                    	
                    	<li><input class="name small-txt" id="kwd_search" type="text" placeholder="Search"/><!-- <button> <i class="icon-search"></i>--><!-- </button> --></li>
                    </ul>
                </div>
            </div>
            
            <!-- table data -->
            <div class="navigation-path-main fl">
            	<ul>
            	<li><a class="tooltip-hover" href="dashboard.do"><img  id="ImageButton1" src="images/floder-icon.png" />
            		<!-- <div class="tooltip">You Cannot share this file</div> -->
    				</a></li>
                	<li>
						<%    
							 for(int j=0;j<=intCount;j++){
						if(!strArrName[j].equals("")){  			
						%>
						<span class="arrow-devide"></span><a href="#" onclick="openFolderHierarchy('<%=strArrPath[j] %>','<%=strArrFileId[j] %>','<%=strArrIsExpiry[j] %>','<%=intCounter[j] %>','<%=strArrName[j] %>')"><%=strArrName[j] %></a>
						<%	}
						}
						%>
                	</li>
                </ul>
            </div>
			<div class="cl"></div>
			<!--  validations -->
						<% if(errmsg!=null){%>                    
             				 <div class="alert alert-error" id="error-holder"><%= errmsg %></div>
       					 <%} %><br> 
       					 <% if(msg!=null){%>              
             				 <div class="alert alert-success" id="error-holder"><b><%= msg %></b></div>
       					 <%}
       					 String success =(String)request.getAttribute("message1");
										if (success !=null) {
								 %>
									<div class="alert alert-error" id="L_Message"><b><%=success%></b></div>

										<% }%>                                
		
   <div class="lockit-data-tables wd fl">
   
		 <div id="lockit-events-data"><!--Data-table-Starts-->
				<table id="my-table" class="table th-font-color">
					<thead>	
					<tr class="th-font-weight">
						<th class="img-align-left">File Name </th>
						<th class="img-align-center">Share</th>
						<th class="img-align-center">Download</th>
						<th class="img-align-center">
			<%
			if(strf2path.length() == 0 || strf2path == ""){
			%>
						<select class="dropdown-grid" id="select" name="select" onchange="get_selection(this.value)" id="DDSort" style="font: bolder;text-align: center;font-weight: bolder;">
							<option value="All" id="all" selected>All</option>
							<option value="Owned by me" id="own">Owned by me</option>
							<option value="Shared with me" id="share">Shared with me</option>
						</select>
			<%
				}else{
			%>Owner
			<%} %>
						</th>
						<th class="img-align-center">Delete</th>
					</tr></thead>
				<tbody>
	    <%  
		if(dropdown== null || dropdown.equals("All")){   
			
			 if(mydata!=null && mydata.size()>0){                                    
				for(int i=0;i<mydata.size();i++){ 
	    %>
				<tr style="border-bottom:1px solid #cecece;">
					<td ><img src='<%=mydata.get(i).get("fileImage") %>'/>&nbsp;<a class="position"  href="#"  onclick="open_file_folder('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("FilePath")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%= "open"%>','<%=mydata.get(i).get("OwnerID")%>','<%=mydata.get(i).get("IsExpiry")%>')" ><%=mydata.get(i).get("FileName")%></a></td>
					
			  		<%  ArrayList<HashMap<String, Object>> shareStatus=(ArrayList<HashMap<String, Object>>)dashboardServiceImpl.fileOptions(logged_user_mail,mydata.get(i).get("FileID").toString());	
	     			if(shareStatus.size()>0){
	     				%>
	     			<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/share-icon-green.png"  style="cursor:not-allowed;"/><%}else{ if(mydata.get(i).get("sharing").equals("true")){ %><a href="#"><img src="images/share-icon-green.png" onclick="sharefile('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("UserID")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%=mydata.get(i).get("OwnerID")%>','<%=mydata.get(i).get("CreatedBy")%>')"/></a><%}else{ %><img src="images/share-icon-green.png"  style="cursor:not-allowed;"/><%}}%></td>
			  	<%
	     			}else{		
	     				%>
	     			
	     				<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/share-grey.png"  style="cursor:not-allowed;"/><%}else{ if(mydata.get(i).get("sharing").equals("true")){ %><a href="#"><img src="images/share-grey.png" onclick="sharefile('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("UserID")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%=mydata.get(i).get("OwnerID")%>','<%=mydata.get(i).get("CreatedBy")%>')"/></a><%}else{ %><img src="images/share-grey.png"  style="cursor:not-allowed;"/><%}}%></td>
				  		
		<%	 } 	%>
			  		<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/download.png"  style="cursor:not-allowed;"/><%}else{ if(mydata.get(i).get("Download").equals("true")){ %><a href="#"><img src="images/download.png" onclick="download_file('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("FilePath")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%= "download"%>')"/></a><%}else { %><img src="images/download.png"  style="cursor:not-allowed;"/><%}}%></td>
			  		<td style="font: bolder;text-align: center;"><%=mydata.get(i).get("Owner")%></td>
			  		<%
			  			String strUser = (String)mydata.get(i).get("UserID");
			  			String strOwner = (String)mydata.get(i).get("OwnerID");			  			
			  			if((strUser).equals(strOwner)){
			  		%>
					<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/del.png"  style="cursor:not-allowed;"/><%}else{ %><a href="#"><img src="images/del.png" onclick="delete_file('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("FilePath")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%= "delete"%>')"/></a><%} %></td>
					<%}else{ %>
					<td style="font: bolder;text-align: center;"><img src="images/del.png" style="cursor:not-allowed;"/></td>
					<%	 } 	%>
				</tr>
				
	<% 
		}
	    }
		} 
		else if(dropdown.equals("Owned by me")){
			 if(mydata!=null && mydata.size()>0){                                                 
				for(int i=0;i<mydata.size();i++){                                                 	
	 %>
			<tr style="border-bottom:1px solid #cecece;">
					<td ><img src='<%=mydata.get(i).get("fileImage") %>'/>&nbsp;<a class="position"  href="#"  onclick="open_file_folder('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("FilePath")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%= "open"%>','<%=mydata.get(i).get("OwnerID")%>','<%=mydata.get(i).get("IsExpiry")%>')" ><%=mydata.get(i).get("FileName")%></a></td>
				<%  ArrayList<HashMap<String, Object>> shareStatus=(ArrayList<HashMap<String, Object>>)dashboardServiceImpl.fileOptions(logged_user_mail,mydata.get(i).get("FileID").toString());	
	     			if(shareStatus.size()>0){
	     				%>	
					<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/share-icon-green.png" "cursor:not-allowed;"/><%}else{ if(mydata.get(i).get("sharing").equals("true")){ %><a href="#"><img src="images/share-icon-green.png" onclick="sharefile('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("UserID")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%=mydata.get(i).get("OwnerID")%>','<%=mydata.get(i).get("CreatedBy")%>')"/></a><%}else{ %><img src="images/share-icon-green.png" "cursor:not-allowed;"/><%}}%></td>
			  		<%
	     			}else{		
	     				%>
	     				<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/share-grey.png" "cursor:not-allowed;"/><%}else{ if(mydata.get(i).get("sharing").equals("true")){ %><a href="#"><img src="images/share-grey.png" onclick="sharefile('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("UserID")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%=mydata.get(i).get("OwnerID")%>','<%=mydata.get(i).get("CreatedBy")%>')"/></a><%}else{ %><img src="images/share-grey.png" "cursor:not-allowed;"/><%}}%></td>
	     				
	     				<%	 } 	%>
			  		<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/download.png" "cursor:not-allowed;"/><%}else{ if(mydata.get(i).get("Download").equals("true")){ %><a href="#"><img src="images/download.png" onclick="download_file('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("FilePath")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%= "download"%>')"/></a><%}else { %><img src="images/download.png" "cursor:not-allowed;"/><%}}%></td>
					<td style="font: bolder;text-align: center;"><%=mydata.get(i).get("Owner")%></td>
					<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/del.png" "cursor:not-allowed;"/><%}else{ %><a href="#"><img src="images/del.png" onclick="delete_file('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("FilePath")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%= "delete"%>')"/></a><%} %></td>
				</tr>
	<%
			 }
			 }
		     }
		 else if(dropdown.equals("Shared with me")){
			 if(mydata!=null && mydata.size()>0){                                                 
				for(int i=0;i<mydata.size();i++){                                                 	
	 %>
				<tr style="border-bottom:1px solid #cecece;">
					<td ><img src='<%=mydata.get(i).get("fileImage") %>'/>&nbsp;<a class="position"  href="#"  onclick="open_file_folder('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("FilePath")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%= "open"%>','<%=mydata.get(i).get("OwnerID")%>','<%=mydata.get(i).get("IsExpiry")%>')" ><%=mydata.get(i).get("FileName")%></a></td>
				<%  ArrayList<HashMap<String, Object>> shareStatus=(ArrayList<HashMap<String, Object>>)dashboardServiceImpl.fileOptions(logged_user_mail,mydata.get(i).get("FileID").toString());	
	     			if(shareStatus.size()>0){
	     				%>		
					<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/share-icon-green.png" style="cursor:not-allowed;"/><%}else{ if(mydata.get(i).get("sharing").equals("true")){ %><a href="#"><img src="images/share-icon-green.png" onclick="sharefile('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("UserID")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%=mydata.get(i).get("OwnerID")%>','<%=mydata.get(i).get("CreatedBy")%>')"/></a><%}else{ %><img src="images/share-icon-green.png" "cursor:not-allowed;"/><%}}%></td>
			  	<%
	     			}else{		
	     				%>		<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/share-grey.png" style="cursor:not-allowed;"/><%}else{ if(mydata.get(i).get("sharing").equals("true")){ %><a href="#"><img src="images/share-grey.png" onclick="sharefile('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("UserID")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%=mydata.get(i).get("OwnerID")%>','<%=mydata.get(i).get("CreatedBy")%>')"/></a><%}else{ %><img src="images/share-grey.png" "cursor:not-allowed;"/><%}}%></td>
				<%	 } 	%>
			  		<td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/download.png" style="cursor:not-allowed;"><%}else{ if(mydata.get(i).get("Download").equals("true")){ %><a href="#"><img src="images/download.png" onclick="download_file('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("FilePath")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%= "download"%>')"/></a><%}else { %><img src="images/download.png" "cursor:not-allowed;"/><%}}%></td>
					<td style="font: bolder;text-align: center;"><%=mydata.get(i).get("Owner")%></td>
					<%-- <td style="font: bolder;text-align: center;"><%if(mydata.get(i).get("IsExpiry").equals("1")){%><img src="images/del.png" style="cursor:not-allowed;"/><%}else{ %><a href="#"><img src="images/del.png" onclick="delete_file('<%=mydata.get(i).get("FileID")%>','<%=mydata.get(i).get("FileName")%>','<%=mydata.get(i).get("FilePath")%>','<%=mydata.get(i).get("IsFolder")%>','<%=mydata.get(i).get("IsSecure")%>','<%= "delete"%>')"/></a><%} %></td> --%>
					<td style="font: bolder;text-align: center;"><img src="images/del.png" style="cursor:not-allowed;"/></td>
				</tr>
	<%
			 }
			 }
		     }
	 %>                                     
					<tbody>	</table>
						
			</div><!--Data-table-Ends-->
	<!--datatable-nav-content- Ends -->
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
		Powered by: Verudix Solutions
      </div>
    </div>
</div>
<!--Lockit-Inner-footer- Ends -->

</div>	
<!-- end page -->


<!-- popups -->
<div id="upload-file">
			<div id="upload-file-ct">
				<div id="upload-file-header">
					<h2>Upload File</h2>
					<a class="modal_close" href="#"></a>
				</div>
				<span id="lblMessage" style="color:Red;"></span>
				<div class="txt-fld">
					<input name="file_type" type="radio" id="file_type" value="secure" checked="checked"/>Secure
            <input name="file_type" type="radio" id="file_type" value="non-secure" />Non-Secure
				</div>
				<div class="txt-fld">
					<input name="Choose File" type="file" id="Choose File" value="Choose File" />
				</div>
				<div class="btn-fld">
					<input type="button" name="btnUploadFile" value="Upload" id="btnUploadFile" class="btn btn-primary" />
				</div>
			</div>
		</div>
		<!-- Create folder -->
		<div id="create-folder">
			<div id="create-folder-ct">
				<div id="create-folder-header">
					<h2>Create New Folder</h2>
					<a class="modal_close" href="#"></a>
				</div>
				<span id="lblMessage" style="color:Red;"></span>
				<div class="txt-fld">
					Folder Name: <input type="text" id="foldername" name="foldername" value=""/>
				</div>
				<div class="btn-fld">
					<input type="button" name="btnUploadFolder" value="Create" id="btnUploadFolder" class="btn btn-primary" />
				</div>
			</div>
		</div>
		<!-- Delete File/folder -->
		<div id="del-folder">
			<div id="del-folder-ct">
				<div id="del-folder-header">
					<h2>Delete File / Folder</h2>
					<a class="modal_close" href="#"></a>
				</div>
				<p>
					Are you sure to delete this File/Folder?
				</p>
				<div class="btn-fld">
					button
				</div>
			</div>
		</div>
<!-- popup scripts -->
		
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
		<script type="text/javascript">
			$(function() {
    			$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });		
			});
		</script>

<!--   UPLOAD FILE    -->
 
<!--   UPLOAD FILE    -->
 
 <div id="overlay" class="web_dialog_overlay1"></div>
   
<!--   UPLOAD FOLDER    -->
 
 <div id="overlay1" class="web_dialog_overlay"></div>

<!--   DELETE File/Folder   -->
   
   <div id="overlay3" class="web_dialog_overlay"></div>
 	<div id="dialog3" class="web_dialog1">
        <div class="modal-header">Are you sure to delete this File/Folder?</div>
        <div class="modal-item">
            
            <input type="submit" name="btnDelFileFolder" value="Yes" id="btnDelFileFolder" class="btn btn-primary" />&nbsp;
            <input type="submit" name="btnCancelDelFileFolder" value="No" id="btnCancelDelFileFolder" class="btn btn-primary" />
        </div>
    </div>
 
</form>
<form name="form2" method="post" id="form2">
	<input type="hidden" name="is_folder" value="">
	<input type="hidden" name="file_name" value="<%= strFolderName%>">
	<input type="hidden" name="file_id" value="<%= strFileId%>">
	<input type="hidden" name="file_path" value="">
	<input type="hidden" name="is_secure" value="">
	<input type="hidden" name="functionality" value="">
	<input type="hidden" name="owner_id" value="">
	<input type="hidden" name="is_expiry" value="<%= strIsExpiry%>">
	<input type="hidden" id="selection" name="selection" value="<%= dropdown%>">
	<input type="hidden" id="f2path" name="f2path" value="<%= strf2path%>" >

   <input type="hidden" name="file_options" id="file_options" value="">
   <input type="hidden" name="file_txt_email" id="file_txt_email" value="">
   <input type="hidden" name="file_txt_edays" id="file_txt_edays" value="">
   <input type="hidden" name="file_txt_ehours" id="file_txt_ehours" value="">
   <input type="hidden" name="file_txt_eminuts" id="file_txt_eminuts" value="">
   <input type="hidden" name="file_txt_id" id="file_txt_id" value="">
   <input type="hidden" name="file_txt_isfolder" id="file_txt_isfolder" value="">
   <input type="hidden" name="file_txt_createdby" id="file_txt_createdby" value="">
   <input type="hidden" name="file_txt_filename" id="file_txt_filename" value="">
   <input type="hidden" name="cntInc" id="cntInc" value="">	
</form>
</body>
</html>
