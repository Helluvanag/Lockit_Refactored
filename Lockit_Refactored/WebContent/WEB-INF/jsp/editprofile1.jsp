<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  session="true"
    pageEncoding="ISO-8859-1"%>


<%String logged_user_mail = (String)session.getAttribute("user_mail");

ArrayList<HashMap<String, Object>> mydata =(ArrayList<HashMap<String, Object>>) request.getAttribute("profileData");
String userid="",firstname="",lastname="",displayname="",organization="",location="",email="",phone="",mobile="",Photourl="";
if(mydata!=null && mydata.size()>0){
		userid=mydata.get(0).get("UserID").toString();
		firstname=mydata.get(0).get("FirstName").toString();
		lastname=mydata.get(0).get("LastName").toString();
		displayname=mydata.get(0).get("DisplayName").toString();
		organization=mydata.get(0).get("Organization").toString();
		location=mydata.get(0).get("Location").toString();
		email=mydata.get(0).get("Email").toString();
		phone=mydata.get(0).get("Mobile").toString();
		mobile=mydata.get(0).get("OfficePhone").toString();
		Photourl=mydata.get(0).get("PhotoUrl").toString();
		Photourl = Photourl.substring(Photourl.lastIndexOf("/") + 1);
		Photourl = "images" + "/" + Photourl;} 
        session = request.getSession(true);
	    session.setAttribute("user_name", displayname);	%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Lockit : User Profile</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <!--  new css -->
        <link href="css/inner.css" rel="stylesheet" type="text/css" />
       <link rel="stylesheet" href="css/elusive/css/elusive-webfont.css" />
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300&amp;subset=latin,latin-ext' rel='stylesheet'>
        <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />          
        <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script  src="Scripts/prototype-1.js"  type="text/javascript"></script>
		<script src="Scripts/prototype-base-extensions.js"  type="text/javascript"></script>
		<script  src="Scripts/prototype-date-extensions.js"  type="text/javascript"></script>
		<script src="Scripts/behaviour.js"  type="text/javascript"></script>
		<script src="Scripts/datepicker.js"  type="text/javascript"></script>
        <script  src="Scripts/behaviors.js"  type="text/javascript"></script>		
		<link rel="stylesheet" href="Scripts/datepicker.css"/>		
		<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
function checkEmail(email) {
	var email=document.forms["form1"]["email"].value;
	var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (reg.test(email)){
	
	return true;
	}    
	return false;
	}

function validate(){
    	var x=document.forms["form1"]["mobile"].value;
	    var y=document.forms["form1"]["officephone"].value;
	    var email=document.forms["form1"]["email"].value;
	    var fname=document.forms["form1"]["fname"].value;
	    var lname=document.forms["form1"]["lname"].value;
	    var dname=document.forms["form1"]["dname"].value;
	    
   if(fname!=""){
	   if(lname!=""){
		   if(dname!=""){
	 if(email.length>0){
	    if (checkEmail(email.value)==false){
	  	  	document.getElementById("L_Message1").innerHTML="Enter Valid Email Id.";
           return false;
        }
	    }
	  	 if(fname.length==0 && lname.length==0 && dname.length==0){
		  	document.getElementById("L_Message1").innerHTML="Enter FirstName,LastName,DisplayName.";
			
		}else if(dname.length==0 ){			
		    document.getElementById("L_Message1").innerHTML="Enter DisplayName.";			
		}
		else if(isNaN(x)||x.indexOf(" ")!=-1 )
	     {	    
	        document.getElementById("L_Message1").innerHTML="Enter numeric characters for Mobile number.";
	        document.form1.getElementById("mobile").focus();
	    }
		 else if(isNaN(y)||y.indexOf(" ")!=-1){		 
		        document.getElementById("L_Message1").innerHTML="Enter numeric characters for Office phone.";
		        document.form1.getElementById("officephone").focus();
		}else
	     {      var f = document.form1;
				f.method="post";
				f.action='updateprofile.do';
				f.submit();
	     } 
			   
		   }
		   else{
			 
			   document.getElementById("L_Message1").innerHTML = "Enter DisplayName.";
	       return false;}
	   }else{  
		  	  
		   document.getElementById("L_Message1").innerHTML = "Enter LastName.";
		       return false;}
	   
          }else{ 
        	  
                document.getElementById("L_Message1").innerHTML = "Enter First Name.";
	           return false;}
 }


</script>
</head>
<body style="background:#e5e9ec;">
<form  method="post"  enctype="multipart/form-data" id="form1" name="form1" ">

<!-- new profile page -->
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
                        <a class="txt-wt-clr" href="editprofile1.do">Welcome:&nbsp;&nbsp;<%=displayname%></a>
                    </div>
                </div>   
      		</div>
    	</div>
	</div>
</div>  <!--AAAAAAA DDDDDDD EEEEEE DDDDDDDD -->
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
                	<li><a href="#"><img src="images/navigation-path-hm-icn.png" /></a></li>
                	<li><img src="images/navigation-path-divlin-icn.png" /></li>
                	<li><a href="#">Profile</a></li>
                </ul>
            </div>
          	<div class="Body-Title fl">
				<div class="Title fl">
                	<a><img class="fl" src="images/Title_Profile.png" /></a>
                	<h1>Profile</h1>
                </div>
            </div>
            
            <!-- table data -->
        
			 	<div class="lockit-data-tables wd fl">
			 		<div class="share_table fl"><!--SHARE- Ends -->

                <div class="profile-headng fl">Edit Profile</div>
                <div class="lockit-data-tables wd fl"><!--lockit-data-tables -->
                                      <span  style="color:red"  id="L_Message1"></span>    
                                            <% 
										String error =(String)request.getAttribute("message");
										if (error !=null) {
									%>
									<span  style="color:red" id="L_Message"><%=error%></span>

										<% } %>
										
										 <% 
										String success =(String)request.getAttribute("message1");
										if (success !=null) {
									%>
									<div class="alert alert-success" id="L_success"><%=success%></div>
									

										<% } %>
										
					<div class="form-horizontal"><!--form-horizontal -->
                        <div style="margin-top:20px;" class="control-group">
                            <label class="control-label">User Email Id</label>
                            <div class="controls">
                                <input type="text" name="uname" readonly="readonly" onFocus="blur();" value='<%=logged_user_mail%>'/>
                            </div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label">
                            	First Name<span class="req"></span>
                            </label>
                            <div class="controls">
	                            <input type="text" id="fname" name="fname" value='<%=firstname%>'/>
                             </div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label">
                            	Last Name 
                            <span class="req"></span>
                            </label>
                            <div class="controls">
	                            <input type="text" id="lname" name="lname" value='<%=lastname%>' />
                             </div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label">
                            	Display Name <span class="req"></span>
                            </label>
                            <div class="controls">
	                            <input type="text" id="dname" name="dname" value='<%=displayname%>'/>
                             </div>
                        </div>
                         <div class="control-group">
                            <label class="control-label">Alternate Email Id</label>
                            <div class="controls">
	                            <input type="text" id = "email" name="email" value='<%=email%>'/>
                             </div>
                        </div>
                 
                        <div class="control-group">
                            <label class="control-label">Organization</label>
                            <div class="controls">
	                            <input type="text" name="organization" value='<%=organization%>' />
                             </div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label">Location</label>
                            <div class="controls">
	                            <input type="text" name="location" value='<%=location%>' />
                             </div>
                        </div>
                      <div class="control-group">
                            <label class="control-label">Mobile</label>
                            <div class="controls">
	                            <input type="text" name="mobile" value='<%=mobile%>' maxlength="12"  />
                             </div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label">
                            	Office Phone
                            </label>
                            <div class="controls">
	                            <input type="text" name="officephone" value='<%=phone%>' maxlength="12"  />
                             </div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label">
                                Update Profile Picture
                                <br>
                                (2Mb, png/jpg/gif/bmp allowed)
                            </label>
                            <div class="controls">
                               <input type="file" name="Choose File" />
                            </div>
                        </div>
   
                        <div class="control-group">
                            <div class="controls">
                                <input type="button" name="update" value="Update"  class="btn btn-primary" id="Btn_BasicInfoUpdate" onClick="return validate()" />
                            </div>
                        </div>
					</div><!--form-horizontal ENDS -->
                    
                </div><!--lockit-data-tables ENDS -->
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

</div>  <!--AAAAAAA DDDDDDD EEEEEE DDDDDDDD -->
<!-- end profile page-->

</form>
</body>
</html>
