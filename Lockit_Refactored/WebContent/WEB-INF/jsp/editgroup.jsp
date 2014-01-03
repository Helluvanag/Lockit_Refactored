<%@page import="java.util.List"%>

<%@page import="java.util.Vector"%>
<%@page import="com.verudix.lockit.service.EditGroupServiceImpl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
    
    <%
		String logged_user = (String)session.getAttribute("user_name");
		String logged_user_mail = (String)session.getAttribute("user_mail");
		String gname = (String)session.getAttribute("groupname");
		String gid = (String)session.getAttribute("groupid");
		String Photourl = (String)request.getAttribute("Photourl");	
		String msg = (String)request.getAttribute("message") ;
		
	%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Lockit - Edit Group</title>

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

<script type="text/javascript">


/* function pagination(pagenumber){
	 document.getElementById("pageNumber").value = pagenumber;	
	 var f=document.form1;
	 f.method="post";
	 f.action='editgroup.do';
	 f.submit();
	 
} */


	function update_group(id){		
		var message = "";
		var message1 = "";
		   //For each checkbox see if it has been checked, record the value.
	
		   for (i = 0; i < $(".chkheader_editgroup").length; i++)
		   {
			 
		      if ($(".chkheader_editgroup")[i].checked){
		    
		         message = message + $(".chkheader_editgroup")[i].value + ","
		      }else{
		    	  message1 = message1 + $(".chkheader_editgroup")[i].value + "," 		    	  
		      }
		   }
		
		 if(message.length>0){
			 document.getElementById("selection").value = message;
			 document.getElementById("unselected").value = message1;
			 document.getElementById("groupid").value = id;
			 var f=document.form1;
	 		 f.method="post";
	 		 f.action='updategroup.do';
	 		 f.submit();
			
		 } else{			
			 document.getElementById("error-holder1").innerHTML = "Please select contact(s) to update group.";
		 }	
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
<body>
<form id="form1" method="post" name="form1" action="editgroup.do">
<div id="Lockit-inner-wrapper">

<!--Lockit-Inner-Header-->
<div id="Lockit-inner-header-wrapper">
    <div class="Lockit-inner-header-container">
      <div class="Lockit-inner-header wd fl">
        	<div class="Lockit-logo fl">
            	<a href="#"><img src="images/lockit-inn-logo.png" /></a>
            </div>
          <div class="UserName-photo fr">
           	  <a href="editprofile1.do">   
				<img  class="fl" src='<%=Photourl%>' width="40" height="40"/>
				<span style="color:#ffffff;">Welcome:&nbsp;&nbsp;<%=logged_user%>
	           		</span>
             </a> 
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
                	<li><a href="dashboard.do">Dashboard</a></li>
                </ul>
            </div>
          	<div class="Body-Title fl">
				<div class="Title4 fl">
                	<a><img class="fl" src="images/edit-group.png" /></a>
                	<h1>Edit Group</h1>
                </div>
            </div>
            
            <!-- table data -->
		 	<div class="lockit-data-tables wd fl">
		 		<p style="text-align:left;"><span id="L_Message">Select / Deselect users to update the group : <%=gname %></span> </p> <span id="error-holder1" style="color:red;"></span>
		 	</div>
		 	<div class="lockit-data-tables wd fl" style="height:320px; overflow-y:scroll;">
		 		<table class="table th-font-color" id="datatable1">
				<thead>
					<tr class="th-font-weight">
						<th class="tooltip-hover" class="img-align-left" scope="col"><div class="tooltip">Select all users from all pages.</div><input id="selectall" type="checkbox"/></th>
					   	<th class="img-align-left" scope="col"><a href="javascript:__doPostBack(&#39;gv_editgroup&#39;,&#39;Sort$displayname&#39;)">Name</a></th>
					   	<th class="img-align-left" scope="col"><a href="javascript:__doPostBack(&#39;gv_editgroup&#39;,&#39;Sort$UserID&#39;)">UserID</a></th>
					</tr>
				</thead>
				
				<tbody>
			 <%
				 	try{				 		
				 		 Vector<String> user_id = new  Vector<String>();
			 			 Vector<String> is_active = new  Vector<String>();
				 		 ArrayList<HashMap<String, Object>> mydata2 =(ArrayList<HashMap<String, Object>>) request.getAttribute("groupUserContacts");
						
				 		if(mydata2!=null && mydata2.size()>0){				 			
				 			for(int i=0;i<mydata2.size();i++){	          			 
				 				user_id.add(i,mydata2.get(i).get("UserID").toString());
				 				is_active.add(i,mydata2.get(i).get("IsActive").toString());
				 			}
				 		}				 	
                    	 
            		 ArrayList<HashMap<String, Object>> mydata1 =  (ArrayList<HashMap<String, Object>>)session.getAttribute("editgroupallusercontacts");                	                		 
           	 
				          if(mydata1!=null && mydata1.size()>0){				          
				          	for(int i=0;i<mydata1.size();i++){	
				          		String userID = (String)mydata1.get(i).get("userID");				          		
				          		if(user_id.contains(userID)){				          			
					          		%>
									 <tr>
										<td><input class="chkheader_editgroup" name="chkheader_editgroup" type="checkbox" value='<%=mydata1.get(i).get("userID")%>' checked="checked"/></td>
										<td><%=mydata1.get(i).get("displayname")%></td>
										<td><%=mydata1.get(i).get("userID")%></td>
									</tr> 
								   <%
				          		}else{
				          			%>
									 <tr>
										<td><input class="chkheader_editgroup" name="chkheader_editgroup" type="checkbox" value='<%=mydata1.get(i).get("userID")%>'/></td>
										<td><%=mydata1.get(i).get("displayname")%></td>
										<td><%=mydata1.get(i).get("userID")%></td>
									</tr> 
								   <%
				          		}
				          }
				          	
				        }
						}catch(Exception e){
						    System.out.println("error1 in edit groups..."+e.toString()); 
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
										pageNumbers = (List) session.getAttribute("editgrouppages");
							if(pageNumbers != null){
								for (int i = 0; i <pageNumbers.size(); i++) {
								%>
							<a class="pagination-sty" href="javascript:__doPostBack(&#39;gv_editgroup&#39;,&#39;Page$1&#39;)" onclick="pagination('<%=pageNumbers.get(i)%>')"><%=pageNumbers.get(i)%></a>
				
								<%
								}
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
		 		<input type="button" name="Btn_Save" value="Update" id="Btn_Save" class="btn btn-primary" onclick="update_group('<%=gid %>');" />  &nbsp; &nbsp;
		  
			<a href="groups.do"><input type="button" name="Btn_Cancel" value="Back to List" id="Btn_Cancel" class="btn btn-primary" /></a>
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
<!--  end edit groups -->
         <input type="hidden" name="selection" value="" id="selection"/> 
         <input type="hidden" name="unselected" value="" id="unselected"/> 
           <input type="hidden" name="groupid" value="" id="groupid"/>      
         <input type="hidden" name="pageNumber" value="" id="pageNumber"/>  
   
        </form>
</body>
</html>
