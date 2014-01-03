<%@page import="com.verudix.lockit.service.GroupsServiceImpl"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.verudix.lockit.util.LockitConstants"%>
<%@page import="com.verudix.lockit.dao.ContactsDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
<%
	String logged_user = (String)session.getAttribute("user_name");
	String logged_user_mail = (String)session.getAttribute("user_mail");
	String Photourl = (String)request.getAttribute("Photourl");
	String username,groupid;	
	GroupsServiceImpl groupsServiceImpl = (GroupsServiceImpl)config.getServletContext().getAttribute("groupsServiceImpl");	
	String msg = (String)request.getAttribute("message") ;
	String msg1 = (String)request.getAttribute("message1") ;
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Lockit - Groups</title>

        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
            
       <!--  new css -->
        <link href="css/inner.css" rel="stylesheet" type="text/css" />
        <link href="css/popup.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="images/favicon1.ico">
        
        <!-- elusive webicons -->
            <link rel="stylesheet" href="css/elusive/css/elusive-webfont.css" />
            
        <!-- custom fonts -->
            <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300&amp;subset=latin,latin-ext' rel='stylesheet'>
            <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />          
        <!-- custom assets -->
        <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="Scripts/datepicker.css"/>       
        <link href="css/styles.css" rel="stylesheet" type="text/css" />
                
        <script src="js/jquery-1.4.3.min.js" type="text/javascript"></script>
        <script  src="Scripts/prototype-1.js"  type="text/javascript"></script>
		<script src="Scripts/prototype-base-extensions.js"  type="text/javascript"></script>
		<script  src="Scripts/prototype-date-extensions.js"  type="text/javascript"></script>
		<script src="Scripts/behaviour.js"  type="text/javascript"></script>
		<script src="Scripts/datepicker.js"  type="text/javascript"></script>
        <script  src="Scripts/behaviors.js"  type="text/javascript"></script>
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
			 
			<%--.level1
			{
			  border-width: 1px;
			  margin: 0px;
			  padding: 0px;
			  background-color: #99FF66;
			  font-family: Arial, Helvetica, sans-serif;
			  color: #FF0000;
			  height: 20px;
			  font-size: 12px;
			  line-height: 20px;
			  text-align: center;
			  width: 300px;
			 }--%>
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
        .web_dialog
        {
            display: none;
            position: fixed;
           width: 500px; 
            height: 600px;
            top: 20%;
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
           /* overflow-y:scroll;*/
            
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

		function delete_group(user,id){			
			username = user;
			groupid = id;
			ShowDialog1(true);			   	 
		}
		function editGroup(groupname,id){	
			 document.getElementById("editgroupname").value = groupname;
			 document.getElementById("editgroupid").value = id;			 				
			 var f=document.form1;
        	 f.method="post";
        	 f.action='displayeditgroup.do';
        	 f.submit();
		}
		
	</script>
 
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
        $("#btnShowModal_addGroup").click(function (e)
            {
                ShowDialog(true);
                e.preventDefault();
            });
          
         $("#btnCreateNewGroup").click(function (e)
            {    
	        	if (document.form1.txt_GroupName.value == ""){
	        		document.getElementById("rfv1").innerHTML ="This field is required";
	        		document.form1.txt_GroupName.focus();
	        		return false;
	        	}
	        	else{        		
	        		var message = "";
					   //For each checkbox see if it has been checked, record the value.
					   for (var i = 0; i < form1.chkheader_editgroup.length; i++)
					   {						 
					      if (form1.chkheader_editgroup[i].checked){
					         message = message + form1.chkheader_editgroup[i].value + ","
					      }
					   }
					
					 if(message.length>0){	
						 document.getElementById("selectedcontact_ids").value = message;						
					 }        		
					 var f=document.form1;
		        	 f.method="post";
		        	 f.action='addgroup.do';
		        	 f.submit();
					 HideDialog();
	                 e.preventDefault();
				}
	                
            });
            
            $("#btnCancelNewGroup").click(function (e)
             {
                 HideDialog();
                 e.preventDefault();
             });
                  
            $("#btnDelGroup").click(function (e)
            {
                    	
               	document.getElementById("deletegroupid").value = groupid;
                var f=document.form1;
                f.method="post";
                f.action='deletegroup.do'; 
                f.submit();
                   		 
                HideDialog1();
                e.preventDefault();
             });
             $("#btnCancelDelGroup").click(function (e)
             {
                  HideDialog1();
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
                    HideDialog1();
                });
            }
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

<body style="background:#e5e9ec;">

<form name="form1" method="post" id="form1">

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
                	<li><a href="groups.do">Groups</a></li>
                </ul>
            </div>
          	<div class="Body-Title fl">
				<div class="Title4 fl">
                	<a><img class="fl" src="images/Title_Groups.png" /></a>
                	<h1>Groups</h1>
                </div>
                <div class="btn-search fr">
                	<ul>
                		<li><a class="login-btn" href="importactivedirectory.do"><img src="images/ImportA-Directry-btn.png" /></a></li>
                    	<li><a class="login-btn" href="addgroup.do"><img src="images/addgroup-btn.png" /></a></li>
                    	<li><input class="name small-txt" type="text" id="kwd_search" value="" placeholder="Search"/>
                                <!-- <button> <i class="icon-search"></i> -->
                                   <!--  </button> -->
                        </li>
                    </ul>
                </div>
            </div>
            
            <!-- table data -->
			 	<div class="lockit-data-tables wd fl">
			 	 		<div id="lockit-events-data"><!--Data-table-Starts-->
			 	 		<p><% if(msg!=null){%>              
             				 <div id="error-holder" class="alert alert-success"><%= msg %></div>
       					 <%} 
       					 
       					  if(msg1!=null){%>              
        				<%--  <span id="error-holder"  style="color:red;"><%= msg1%></span> --%>
        				  <div class="alert alert-error" id="error-holder"><%= msg1 %></div>  
  					 <%} %></p>
				</div>
		 	</div>
		 	<div class="lockit-data-tables wd fl">
		 		<table id="NavigationMenu" class="level1" cellpadding="0" cellspacing="0" border="0" style="width:100%;">
	
						<tr>
							<td onmouseover="Menu_HoverRoot(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="All" id="NavigationMenun0">
							
							
							<table cellpadding="0" cellspacing="0" border="0" width="100%" style="background-color:LightBlue;border-color:Black;border-width:0px;border-style:Solid;">
								<tr>
									<td style="white-space:nowrap;"><a href="groups.do" style="text-decoration:none;">All</a></td>
								</tr>
							</table>
					
							</td>
							
							<td style="width:3px;"></td>
							
							<td onmouseover="Menu_HoverRoot(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Active Directory" id="NavigationMenun1">
							
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								
									<tr>
										<td style="white-space:nowrap;"><a href="#"  style="text-decoration:none;">Active Directory</a></td>
									</tr>
								</table>
							</td>
							
						<!--	<td style="width:3px;"></td>
							
						 	<td onmouseover="Menu_HoverRoot(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" id="NavigationMenun2">
							
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									
									<tr>
										
										<td style="white-space:nowrap;"><a href="javascript:__doPostBack(&#39;NavigationMenu&#39;,&#39;Engineering&#39;)" style="text-decoration:none;">Engineering</a></td>
									
									</tr>
								</table>
							</td>   -->
							
							<% 
							  ArrayList<HashMap<String, Object>> mydata1 = (ArrayList<HashMap<String, Object>>)request.getAttribute("groups_data");
					          
					          if(mydata1!=null || mydata1.size()>0){
					          
					          	for(int i=0;i<mydata1.size();i++){
							%>
							<td style="width:3px;"></td>
							
							<td onmouseover="Menu_HoverRoot(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" id="NavigationMenun3">
							
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<tr>
										<td style="white-space:nowrap;"><a href="#" onclick="editGroup('<%=mydata1.get(i).get("groupname")%>','<%=mydata1.get(i).get("groupid")%>');" style="text-decoration:none;"><%=mydata1.get(i).get("groupname")%></a></td>
									</tr>
								</table>
							</td>
							<%
					          	}
					          }
							%>
						</tr>
					</table>
		 	</div>
		 	<div class="lockit-data-tables wd fl">
		 		<table id="my-table" class="table th-font-color">
									
							      <div class="row-fluid">   
 								<% 
									String error =(String)request.getAttribute("success_message");
									if (error !=null) {
									%>
										<span id="error-holder" style="color:Green;"><%=error%></span>

									<% 
									}
								%>	
								</div>
									
											<thead>	
												<tr class="th-font-weight">
											    	<th class="img-align-left">Group </th>
													<th class="img-align-left">Edit </th>
													<th class="img-align-center">Delete </th>
												</tr>
											</thead>
											<tbody>
						 <%
          ArrayList<HashMap<String, Object>> mydata = (ArrayList<HashMap<String, Object>>)request.getAttribute("groups_data");
        
          if(mydata!=null && mydata.size()>0){
          
          	for(int i=0;i<mydata.size();i++){
          	
          	%>
			
				<tr>													
				<%-- <td onclick="editGroup('<%=mydata.get(i).get("groupname")%>','<%=mydata.get(i).get("groupid")%>');"><a href="#"><%=mydata.get(i).get("groupname")%></a></td>
				<td onclick="editGroup('<%=mydata.get(i).get("groupname")%>','<%=mydata.get(i).get("groupid")%>');"><a href="#"><img src="images/edit.png" /></a></td> --%>
				<td><a href="#" onclick="editGroup('<%=mydata.get(i).get("groupname")%>','<%=mydata.get(i).get("groupid")%>');"><%=mydata.get(i).get("groupname")%></a></td>
				<td><a href="#" onclick="editGroup('<%=mydata.get(i).get("groupname")%>','<%=mydata.get(i).get("groupid")%>');"><img src="images/edit.png" /></a></td>
			    <td  class="img-align-center"><a href="#"><img src="images/del.png" onclick="delete_group('<%=logged_user_mail%>','<%=mydata.get(i).get("groupid")%>')"/></a></td>
			
				 </tr>
				
			<%
          }
          }else{         
          %>
          <B>No Data Found.</B>	
          <%} %>												
							                                                                             
								</tbody>		                                             
											</table>
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


<!-- end groups -->





<!--   ADD GROUP   -->
   
  <%--  <div id="overlay" class="web_dialog_overlay"></div>
 	<div id="dialog" class="web_dialog">
 	
        <div class="modal-header">Add Group</div>
        <div class="modal-item"></div>
        <div class="modal-item">
            Group Name: <input name="txt_GroupName" type="text" id="txt_GroupName" />
			<span id="rfv1" style="color:Red;"></span>
        </div>
        <div class="modal-header-sub">Select users to be included in a group</div>
        <div class="modal-item">
            
				
			<table class="gridview" cellspacing="1" cellpadding="5" border="0">
				<thead>
					<tr>
						<th scope="col"><input id="selectall" type="checkbox"/></th>
					   	<th>Name</th>
					   	<th>UserID</th>
					</tr>
				</thead>
				
				<tbody>
										
				 <%
                     try{
                    	/*   ArrayList<HashMap<String, Object>> data = groupsServiceImpl.getAllUserContacts(logged_user_mail); */ 
                     ArrayList<HashMap<String, Object>> data =(ArrayList<HashMap<String, Object>>)request.getAttribute("userContacts"); 
                    	 System.out.println("user contacts in jsp"+data);
  				       
                    	  if(mydata1!=null && mydata1.size()>0){
    				          
  				          	for(int i=0;i<mydata1.size();i++){
											          	
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
														
			</table>
			
        </div>
        <div class="modal-item">
            <input type="submit" name="btnCreateNewGroup" value="Add" id="btnCreateNewGroup" class="btn btn-primary" />
            <input type="submit" name="btnCancelNewGroup" value="Cancel" id="btnCancelNewGroup" class="btn btn-primary" />
        </div>
</div>
 --%>
 
   <!--   DELETE GROUP   -->
   
   <div id="overlay1" class="web_dialog_overlay"></div>
 	<div id="dialog1" class="web_dialog1">
        <div class="modal-header">Are you sure to delete this group?</div>
        <div class="modal-item">
        
            <input type="submit" name="btnDelGroup" value="Yes" id="btnDelGroup" class="btn btn-primary" />&nbsp;
            <input type="submit" name="btnCancelDelGroup" value="No" id="btnCancelDelGroup" class="btn btn-primary" />
            
        </div>
    </div>


     	<input type="hidden" name="selectedcontact_ids" value="" id="selectedcontact_ids"/>
        <input type="hidden" name="editgroupname" value="" id="editgroupname"/>
        <input type="hidden" name="editgroupid" value="" id="editgroupid"/>
        <input type="hidden" name="deletegroupid" value="" id="deletegroupid"/>
        
        
        
</form>
</body>
</html>
