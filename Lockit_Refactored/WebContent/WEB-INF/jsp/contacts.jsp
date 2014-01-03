<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
	
	<%
		String logged_user = (String)session.getAttribute("user_name");
		String logged_user_mail = (String)session.getAttribute("user_mail");		
		String contactid,contactemail,contactfirstname,contactlastname,checkedrows;
		String Photourl = (String)request.getAttribute("Photourl");
		String msg = (String)request.getAttribute("message") ;
		String errmsg = (String)request.getAttribute("error_message") ;
	%>       
    
    
<!DOCTYPE html>
<html lang="en">
    <head>
       
        <meta charset="utf-8" />
        
        <title>Lockit - Contacts</title>

        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        
        <!--  new css -->
        <link href="css/inner.css" rel="stylesheet" type="text/css" />
        <link href="css/popup.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="images/favicon1.ico" />

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

	function editContact(id,email,firstname,lastname){
		 
		contactid = id;
    	document.getElementById("txt_EmailEdit").value= email;
    	document.getElementById("txt_FirstnameEdit").value= firstname;
    	document.getElementById("txt_LastnameEdit").value= lastname;    	
		ShowDialog2(true);
	}
	
	function deleteContact(id){		
    	 contactid = id;
    	 ShowDialog1(true);
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
    <script type="text/javascript">

        $(document).ready(function ()
        {
        	  // Write on keyup event of keyword input element
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
        //	 });
        	 // jQuery expression for case-insensitive filter
        	 $.extend($.expr[":"], 
        	 {
        	     "contains-ci": function(elem, i, match, array) 
        	  {
        	   return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
        	  }
        	 });
            $("#btnShowModal").click(function (e)
            {
                ShowDialog(true);
                e.preventDefault();
            });
            
            $("#editmodal").click(function (e)
            {
                ShowDialog2(true);
                e.preventDefault();
            });
            $("#deletemodal").click(function (e)
            {
                ShowDialog1(true);
                e.preventDefault();
            });
			
            $("#btnSubmit").click(function (e)
            {
                         	    
        	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        	
        	if (document.form1.txt_Emailid.value == ""){
        		document.getElementById("lblMessage").innerHTML = "Enter Email ID";
        		document.form1.txt_Emailid.focus();
        		return false;
        	}
        	else if(document.form1.txt_Firstname.value == ""){
        		document.getElementById("lblMessage").innerHTML = "Enter First Name";
        		document.form1.txt_Firstname.focus();
        		return false;
        	}
			else if(document.form1.txt_Lastname.value == ""){
				document.getElementById("lblMessage").innerHTML = "Enter Last Name";
				document.form1.txt_Lastname.focus();
				return false;
        	}
			else if (!filter.test(document.form1.txt_Emailid.value)){ 
				document.getElementById("lblMessage").innerHTML = "Invalid Email Format.";
				document.form1.txt_Lastname.focus();
				return false;
			}
			else{
				 var f=document.form1;
	        	 f.method="post";
	        	 f.action='addcontact.do';
	        	 f.submit();
				
				HideDialog();
                e.preventDefault();
			}
                
            });
            
            $("#btnCancel").click(function (e)
             {
                 HideDialog();
                 e.preventDefault();
             });
            $("#btnDelContact").click(function (e)
            {  
            	
            	document.getElementById("deletecontactid").value = contactid;
            	 var f=document.form1;
           		 f.method="post";
           		// f.action='deletecontact.do?id='+contactid;
           		f.action='deletecontact.do'; 
           		f.submit();
           		 
              //   HideDialog1();
             //    e.preventDefault();
            });
            $("#btnCancelDelContact").click(function (e)
            {
                 HideDialog1();
                 e.preventDefault();
            });
            $("#btnDelContacts").click(function (e)
              { 
            	 var message = "";
 			   //For each checkbox see if it has been checked, record the value.
 			   for (var i = 0; i < $(".chkheader_editgroup").length; i++)
 			   {					   
 			      if ($(".chkheader_editgroup")[i].checked){			    	 
 			         message = message + $(".chkheader_editgroup")[i].value + ","
 			      }
 			   }
 			    if(message.length ==0){ 			    		    	
 			    	/* if( document.getElementById("error-holder").innerHTML !== ""){
 			    		   document.getElementById("error-holder").style.display="none"; 			    		 
 			    	}	 */
 			      document.getElementById("error-holder1").style.display="block";
 				  document.getElementById("error-holder1").innerHTML = "Please select contact(s) to delete.";
 			   	  $("#dele-contacts").hide();
 				  $("#lean_overlay").hide();  		                      
 				  return false;
 			   } 	 		 
 			   if(message.length>0){				 
 				 	document.getElementById("selectedcontact_ids").value = message;
 					 var f=document.form1;    
            		 f.method="post";
            		 f.action='deletecontacts.do'; 
            		 f.submit();	            		
 				 }                     	
              }); 
             $("#btnCancelDelContacts").click(function (e)
                    {
                         HideDialog3();
                         e.preventDefault();
                    });  
            $("#btn_EditContactSave").click(function (e)
            {
            	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            	
            	if (document.form1.txt_EmailEdit.value == ""){
            		document.getElementById("lblUpdateContact").innerHTML = "Enter Email ID";
            		document.form1.txt_EmailEdit.focus();
            		return false;
            	}
            	else if(document.form1.txt_FirstnameEdit.value == ""){
            		document.getElementById("lblUpdateContact").innerHTML = "Enter First Name";
            		document.form1.txt_FirstnameEdit.focus();
            		return false;
            	}
    			else if(document.form1.txt_LastnameEdit.value == ""){
    				document.getElementById("lblUpdateContact").innerHTML = "Enter Last Name";
    				document.form1.txt_LastnameEdit.focus();
    				return false;
            	}
    			else if (!filter.test(document.form1.txt_EmailEdit.value)){ 
    				document.getElementById("lblUpdateContact").innerHTML = "Invalid Email Format.";
    				document.form1.txt_EmailEdit.focus();
    				return false;
    			}
    			else{
    				
    				document.getElementById("updatecontactid").value= contactid;
    				var f=document.form1;
               		f.method="post";
               		//f.action='updatecontact.do?id='+contactid;
               		f.action='updatecontact.do';
               		f.submit();
               		
    				HideDialog2();
                    e.preventDefault();
    			}
                
            });  
            $("#btn_EditContactCancel").click(function (e)
            {
                  HideDialog2();
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
        function ShowDialog2(modal)
        {
            $("#overlay2").show();
            $("#dialog2").fadeIn(300);

            if (modal)
            {
                $("#overlay2").unbind("click");
            }
            else
            {
                $("#overlay2").click(function (e)
                {
                    HideDialog2();
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
        function HideDialog3()
        {
        	alert("Inside hd3");
            $("#dele-contacts").hide();
          //  $("#dele-contacts-ct").fadeOut(300);
          
        } 
        function HideDialog2()
        {        	
            $("#overlay2").hide();
            $("#dialog2").fadeOut(300);
        } 
       
    </script>
    
</head>

<body style="background:#e5e9ec;">
<form id="form1" name="form1" method="post" action="contacts.do">
<!-- new contacts page -->
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
		            <li><a href="groups.do">Groups</a></li>
		            <li class="active"><a href="contacts.do">Contacts</a></li>
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
                	<li><a href="contacts.do">Contacts</a></li>
                </ul>
            </div>
          	<div class="Body-Title fl">
				<div class="Title fl">
                	<a><img class="fl" src="images/Title_Contacts.png" /></a>
                	<h1>Contacts</h1>
                </div>
                <div class="btn-search fr">
                	<ul>
                		<li><a class="login-btn" id="go" rel="leanModal" name="add" href="#add-contact"><img src="images/addcont-btn.png" /></a></li>
                    	<li><a class="login-btn" id="go" rel="leanModal" name="dele" href="#dele-contacts" onclick="deleteSelectedContacts();"><img src="images/deletecont-btn.png" /></a></li>
                    	<li><input class="name small-txt" type="text" id="kwd_search" value=""  placeholder="Search"/>
                                <!-- <button> <i class="icon-search"></i>-->
                                    <!-- </button> -->
                        </li>
                    </ul>
                </div>
            </div>
            
            <!-- table data -->
         <div class="alert alert-error" id="error-holder1" style="display:none"></div>
			 	
			 		<div class="row-fluid">         
						<% 
									String error =(String)request.getAttribute("message1");
									if (error !=null) {
									%>
										<span id="error-holder" style="color:red;"><%=error%></span>

									<% 	}%>
					</div>
			 	
			 	<div class="row-fluid">        
        				<% if(errmsg!=null){%>                    
             				 <%-- <span id="error-holder"  style="color:red;"><%= errmsg %></span> --%>
             				  <div class="alert alert-error" id="error-holder"><%= errmsg %></div>  
       					 <%} %><br> 
       					 <% if(msg!=null){%>              
             				<%--  <span id="error-holder"  style="color:Blue;"><%= msg %></span> --%>
             				<div class="alert alert-success" id="error-holder"><b><%= msg %></b></div>
       					   <%} %>                              
					</div>
			 	
				
			 	<div class="lockit-data-tables wd fl">
			 	 		<div id="lockit-events-data"><!--Data-table-Starts-->
							<table id="my-table" class="table th-font-color">
														<thead>
														<tr class="th-font-weight">
															<th class="img-align-left" scope="col"><input id="selectall" type="checkbox"/></th>
													    	<th class="img-align-left">Name</th>
													    	<th class="img-align-left">Email</th>
													    	<th class="img-align-left">Edit</th>
															<th class="img-align-center">Delete</th>
														</tr>
													</thead>
													<tbody>
													
													 <%
	          
	                                                   try{
												          ArrayList<HashMap<String, Object>> con_data = (ArrayList<HashMap<String, Object>>)request.getAttribute("contacts_data");	
													 		if(con_data!=null && con_data.size()>0){											          
												          		for(int i=0;i<con_data.size();i++){											          	
												          	%>
												    			<tr>
												    				<td><input class="chkheader_editgroup" name="chkheader_editgroup" type="checkbox" value='<%=con_data.get(i).get("id")%>'/></td>
												    				<td><%=con_data.get(i).get("firstname")%></td>
												    				<td><%=con_data.get(i).get("email")%></td>
												    				<td>
												    				<a id="go" rel="leanModal" name="update" href="#update-contact" onclick="editContact('<%=con_data.get(i).get("id")%>','<%=con_data.get(i).get("email")%>','<%=con_data.get(i).get("firstname")%>','<%=con_data.get(i).get("lastname")%>');"><img src="images/edit.png" /></a></td>
												    				<td class="img-align-center">
												    				<a id="go" rel="leanModal" name="del" href="#del-contact" onclick="deleteContact('<%=con_data.get(i).get("id")%>');"><img src="images/del.png" /></a></td>
												    		  </tr>
												    		<%
												             }
												            }else{         
												                %>
												                <B>No Data Found.</B>	
												                <%}
	                                                   }catch(Exception e){                                                	   
	                                                	   System.out.println("Error in displaying contacts in jsp...."+e.toString());
	                                                   }
	       											   %>	
													
													</tbody>
															
												</table>
				</div>
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
<!-- end new contacts page -->


<!-- popup scripts -->
		
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });		
			});
		</script>

<!--   ADD NEW CONTACT    -->
		<div id="add-contact">
			<div id="add-contact-ct">
				<div id="add-contact-header">
					<h2>Add New Contact</h2>
					<a class="modal_close" href="#"></a>
				</div>
				<p><span id="lblMessage" style="color:Red;"></span></p>
				<div class="txt-fld">
					Email ID:* <input name="txt_Emailid" type="text" id="txt_Emailid" />
				</div>
				<div class="txt-fld">
					First Name:* <input name="txt_Firstname" type="text" id="txt_Firstname" />
				</div>
				<div class="txt-fld">
					Last Name:* <input name="txt_Lastname" type="text" id="txt_Lastname" />
				</div>
				<div class="txt-fld">
					Add to Group: <select name="ddl_GroupName" id="ddl_GroupName">
									<option value="0">Select</option>
								

						
				 <%
				 
                     try{                    	 
                    	 ArrayList<HashMap<String, Object>> data =  (ArrayList<HashMap<String, Object>>) request.getAttribute("listOfgroups");
                    	  if(data!=null && data.size()>0){    			          
  				          	for(int i=0;i<data.size();i++){										          	
						   	%>							
							<option value='<%=data.get(i).get("GroupID")%>'><%=data.get(i).get("GroupName")%></option>
						   <%
						   
  				          	}
                    	  }
                 		
                        }catch(Exception e){
                        	System.out.println("catch in jsp"+e.toString());                                        	   
                        }
       			  %>			

   					 </select>
				</div>
				<div class="btn-fld">
					<input type="button" name="btnSaveContact" value="Add" id="btnSubmit" class="btn btn-primary" />
				</div>
			</div>
		</div>
<!--   UPDATE CONTACT    -->
		<div id="update-contact">
			<div id="update-contact-ct">
				<div id="update-contact-header">
					<h2>Update Contact</h2>
					<a class="modal_close" href="#"></a>
				</div>
				<p><span id="lblUpdateContact" style="color:Red;"></span><br>
					<input type="hidden" name="updatecontactid" value="" id="updatecontactid"/>
				</p>
				<div class="txt-fld">
					Email ID:* <input name="txt_EmailEdit" type="text" id="txt_EmailEdit" />
				</div>
				<div class="txt-fld">
					First Name:* <input name="txt_FirstnameEdit" type="text" id="txt_FirstnameEdit" />
				</div>
				<div class="txt-fld">
					Last Name:* <input name="txt_LastnameEdit" type="text" id="txt_LastnameEdit" />
				</div>
				<div class="btn-fld">
					<input type="submit" name="btn_EditContactSave" value="Update" id="btn_EditContactSave" class="btn btn-primary" />
				</div>
			</div>
		</div>
<!--  Delete multiple contacts -->
	<div id="dele-contacts">
			<div id="dele-contacts-ct">
				<div id="dele-contacts-header">
					<h2>Delete Contacts</h2>
					<a class="modal_close" href="#"></a>
				</div>
				<div id="dele-contacts-header">Are you sure to delete the selected contacts?</div>
				<div>
					<input type="hidden" name="deletecontactid" value="" id="deletecontactid"/>
              		<input type="hidden" name="selectedcontact_ids" value="" id="selectedcontact_ids"/>
             
				</div>
				<div class="btn-fld">
					 <input type="submit" name="btnDelContacts" value="Yes" id="btnDelContacts" class="btn btn-primary" />
				</div>
			</div>
		</div>	
<!--   DELETE CONTACT    -->
		<div id="del-contact">
			<div id="del-contact-ct">
				<div id="del-contact-header">
					<h2>Delete Contact</h2>
					<a class="modal_close" href="#"></a>
				</div>
				<div id="del-contact-header">Are you sure to delete this contact?</div>
				<div>
					<input type="hidden" name="deletecontactid" value="" id="deletecontactid"/>
              		<input type="hidden" name="selectedcontact_ids" value="" id="selectedcontact_ids"/>
				</div>
				<div class="btn-fld">
					 <input type="submit" name="btnDelContact" value="Yes" id="btnDelContact" class="btn btn-primary" />
				</div>
			</div>
		</div>		
		<input type="hidden" name="selectedcontact_ids" value="" id="selectedcontact_ids"/>
</form>
</body>
</html>
