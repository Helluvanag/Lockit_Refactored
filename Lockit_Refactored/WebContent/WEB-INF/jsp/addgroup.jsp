<%@page import="java.util.List"%>
<%@page import="com.verudix.lockit.service.GroupsServiceImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.HashMap"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
    
    <%
	String logged_user = (String)session.getAttribute("user_name");
	String logged_user_mail = (String)session.getAttribute("user_mail");
	String Photourl = (String)request.getAttribute("Photourl");		

	%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Lockit - Add Group</title>

        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
            
        <!--  new css -->
        <link href="css/inner.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="images/favicon1.ico">
        <!-- elusive webicons -->
            <link rel="stylesheet" href="css/elusive/css/elusive-webfont.css" />
            
        <!-- custom fonts -->
            <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />          
            <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300&amp;subset=latin,latin-ext' rel='stylesheet'>
        <!-- custom assets -->
        <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        
        <link href="css/styles.css" rel="stylesheet" type="text/css" />

<script src="js/jquery-1.4.3.min.js" type="text/javascript"></script>

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
		
		.level1
		{
		  border:1px solid #a8a6a6;
		  
		  margin:0px;
		  padding: 5px;
		  background-color: #cecece;
		  font:bold 13px Arial, Helvetica, sans-serif;
		  color: #000000;
		  height: 30px;
		  line-height: 25px;
		  text-align: center;
		  width:500px;
		 }
		 
		.level1 a:hover
		{
		 color:#fff;       }
		 
		 .level1 a
		{
		 color:#000;       } 
		 

	</style>
<script type="text/javascript" src="js/pagination.js"></script>	
<script type="text/javascript" src="js/jquery.min.js"></script>	
<script type="text/javascript" src="js/jquery.pages.js"></script>	
	 <style type="text/css">   
            .pg-normal {
                color: black;
                font-weight: normal;
                text-decoration: none;   
                cursor: pointer;   
            }
            .pg-selected {
                color: black;
                font-weight: bold;       
                text-decoration: underline;
                cursor: pointer;
            }
        </style>
<script type="text/javascript">

function addgroup(){
	if (document.form1.txt_GroupName.value == ""){
		document.getElementById("rfv1").innerHTML ="Group Name is Mandatory.";
		document.form1.txt_GroupName.focus();
		return false;
	}else{

		var message = "";
		var message1 = "";
		
		   for (i = 0; i < $(".chkheader_editgroup").length; i++)
		   {
			   
		      if ($(".chkheader_editgroup")[i].checked){
		    	  message = message + $(".chkheader_editgroup")[i].value + ","
		      }else{
		    	  message1 = message1 + $(".chkheader_editgroup")[i].value + "," 		    	  
		      }
		   }
		
		 if(message.length>0){
			 document.getElementById("rfv1").innerHTML ="";
			 document.getElementById("selectedcontact_ids").value = message;			
		 }else{
			 document.getElementById("rfv1").innerHTML ="Add some/all contacts to group.";
			 return false;
		 }
		
		 var f=document.form1;
    	 f.method="post";
    	 f.action='addnewgroup.do';
    	 f.submit();
		 
	}
}

/* function pagination(pagenumber){	
	 document.getElementById("pageNumber").value = pagenumber;	
	 var f=document.form1;
	 f.method="post";
	 f.action='addgroup.do';
	 f.submit();
	 
} */
</script>
<script type="text/javascript">
		$(function(){
		 
		    // add multiple select / deselect functionality
		    $("#selectall").click(function () {
		          $('.chkheader_editgroup').attr('checked', this.checked);
		    });
		 
		    // if all checkbox are selected, check the selectall checkbox
		    // and viceversa
		    $(".chkheader_editgroup").click(function(){
		 		
		        if($(".chkheader_editgroup").length == $(".chkheader_editgroup:checked").length) {
		            $("#selectall").attr("checked", "checked");
		        } else {
		            $("#selectall").removeAttr("checked");
		        }
		 
		    });
		});
	</script>
</head>
<body>
<form id="form1" method="post" name="form1" action="addgroup.do">

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
            	<li><a href="dashboard.do">Dashboard</a></li>
		            <li class="active"><a href="groups.do">Groups</a></li>
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
                	<li><a href="groups.do">Groups > Add Group</a></li>
                </ul>
            </div>
          	<div class="Body-Title fl">
				<div class="Title4 fl">
                	<a><img class="fl" src="images/Title_Groups.png" /></a>
                	<h1>Add Group</h1>
                </div>
            </div>
            
            <!-- table data -->
		 	<div class="lockit-data-tables wd fl">
		 		Group Name: <input name="txt_GroupName" type="text" id="txt_GroupName" /> <span id="rfv1" style="color:Red;"></span>
		 	</div>
		 	<div class="lockit-data-tables wd fl">
		 		<p  style="text-align:left;"><span id="L_Message">Select users to be included in a group</span></p>
		 	</div>
		 	<div class="lockit-data-tables wd fl" style="height:320px; overflow-y:scroll;">
		 		<table class="table th-font-color" id="datatable1">
				<thead>
					<tr class="th-font-weight">
						<th  class="tooltip-hover" class="img-align-left" scope="col"><div class="tooltip">Select all users from all pages.</div><input id="selectall" type="checkbox"/></th>
					   	<th class="img-align-left" scope="col"><a href="javascript:__doPostBack(&#39;gv_editgroup&#39;,&#39;Sort$displayname&#39;)">Name</a></th>
					   	<th class="img-align-left" scope="col"><a href="javascript:__doPostBack(&#39;gv_editgroup&#39;,&#39;Sort$UserID&#39;)">Email ID</a></th>
					</tr>
				</thead>
				
				<tbody>
										
				 <%
				 
                     try{                    	 
                    	 ArrayList<HashMap<String, Object>> data =  (ArrayList<HashMap<String, Object>>) request.getAttribute("allusercontacts");
                     	 
                    	
                    	  if(data!=null){
    				          
  				          	for(int i=0;i<data.size();i++){
											          	
						   	%>
							 <tr>
								<td><input class="chkheader_editgroup" name="chkheader_editgroup" type="checkbox" value='<%=data.get(i).get("userID")%>'/></td>
								<td><%=data.get(i).get("displayname")%></td>
								<td><%=data.get(i).get("userID")%></td>
							</tr> 
							
							
						   <%
						   
  				          	}
                    	  }
                 		
                        }catch(Exception e){
                        	
                                        	   
                        }
       			  %>			
				</tbody>
						
   					<%-- <tr class="pgr">
						<td colspan="3">
							<table border="0">
								<tr>
									<td>
									<%
									try{
										List pageNumbers = null;
										//  pageNumbers = (List) session.getAttribute("pages");
										pageNumbers = (List) request.getAttribute("pages");
								for (int i = 0; i <pageNumbers.size(); i++) {
								%>
							<a class="pagination-sty" href="javascript:__doPostBack(&#39;gv_editgroup&#39;,&#39;Page$1&#39;)" onclick="pagination('<%=pageNumbers.get(i)%>')"><%=pageNumbers.get(i)%></a>
				
								<%
								}
									}catch(Exception e){
										
									}
								%>
									</td>
								</tr>	
							</table>
						</td>
					</tr>		 --%>
			
			</table>
			<div id="pageNavPosition"></div>
			<script type="text/javascript">			
 			var pager = new Pager('datatable1', 10);
	        pager.init();
	        pager.showPageNav('pager', 'pageNavPosition');
	        pager.showPage(1);
        </script>
		 	</div>
		 	<div class="lockit-data-tables wd fl">
		 		<input type="button" name="btnCreateNewGroup" value="Add" id="btnCreateNewGroup" class="btn btn-primary" onclick="addgroup();"/>
           <a href="groups.do"> <input type="button" name="btnCancelNewGroup" value="Cancel" id="btnCancelNewGroup" class="btn btn-primary" />
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
<!--  end add groups -->

     
       <input type="hidden" name="selectedcontact_ids" value="" id="selectedcontact_ids"/>  
        <input type="hidden" name="pageNumber" value="" id="pageNumber"/>    
       
        </form>
</body>
</html>
