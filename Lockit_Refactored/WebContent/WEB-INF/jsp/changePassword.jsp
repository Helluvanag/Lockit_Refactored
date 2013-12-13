
<%@page import="com.verudix.lockit.service.DashboardServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    DashboardServiceImpl dashboardServiceImpl=(DashboardServiceImpl)config.getServletContext().getAttribute("dashboardServiceImpl");
    
    
    String logged_user = (String)session.getAttribute("user_name");
    String Photourl = (String)request.getAttribute("Photourl");
    System.out.println("Photo Url:---"+Photourl);
    %>
 
<!DOCTYPE html>

<html>
    <head >
         <meta charset="utf-8" />
        <title>Lockit - ChangePassword</title>

        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
            
        <!--  new css -->
        <link href="css/inner.css" rel="stylesheet" type="text/css" />
        
        <!-- elusive webicons -->
            <link rel="stylesheet" href="css/elusive/css/elusive-webfont.css" />
            
        <!-- custom fonts -->
            <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300&amp;subset=latin,latin-ext' rel='stylesheet'>
            <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />          
        <!-- custom assets -->
        <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>

<link href="css/styles.css" rel="stylesheet" type="text/css" />
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



<script type="text/javascript" lang="javascript">
 function validate()
{
		
	if (document.form1.oldpwd.value =="" && document.form1.newpwd.value =="" && document.form1.newconfirmpwd.value ==""){		
	//	alert("All Fields Are Mandatory!");
		document.getElementById("error-holder").innerHTML = "All Fields Are Mandatory!";
		document.form1.oldpwd.focus();
		return false;
	 }else if (document.form1.newpwd.value ==""){
		//    alert("New Password is Mandatory!");	
		    document.getElementById("error-holder").innerHTML = "New Password is Mandatory!";
			document.form1.newpwd.focus();
			return false;
		 }
	else if (document.form1.newconfirmpwd.value ==""){
	//	 alert("Confirm Password is Mandatory!");	
		 document.getElementById("error-holder").innerHTML = "Confirm Password is Mandatory!";
		document.form1.newconfirmpwd.focus();
		return false;
	 }else if (document.form1.newpwd.value!==document.form1.newconfirmpwd.value ){
	//	 alert("Passwords Mismatched!");	
		 document.getElementById("error-holder").innerHTML = "Passwords Mismatched!";
		 document.form1.newconfirmpwd.value="";
			document.form1.newpwd.value=""; 
			document.form1.newpwd.focus();
			return false;
	 }else if(document.form1.newpwd.value.length<6) {
	//   alert("Password length must be atleast 6 characters!");
	   document.getElementById("error-holder").innerHTML = "Password length must be atleast 6 characters!";
	   return false;
	  }else if(document.form1.oldpwd.value =="" ) {
	//	   alert("Old Password is Mandatory!");
		   document.getElementById("error-holder").innerHTML = "Old Password is Mandatory!";	
		   document.form1.oldpwd.focus();
		   return false;
		  }else{
		 var f=document.form1;
    	 f.method="post";
    	 f.action='changePassword.do';
    	 f.submit();
	}

} 
</script>

</head>
<body style="background:#e5e9ec;">
   <form  method="post" name="form1" action="/changePassword.do" name="form1">
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
                	<li><a href="#"><img src="images/navigation-path-hm-icn.png" /></a></li>
                	<li><img src="images/navigation-path-divlin-icn.png" /></li>
                	<li><a href="#">Change Password</a></li>
                </ul>
            </div>
          	<div class="Body-Title fl">
				<div class="Title2 fl">
                	<a><img class="fl" src="images/Title_Password1.png" /></a>
                	<h1>Change Password</h1>
                </div>
            </div>
            
            <!-- table data -->
        
			 	<div class="lockit-data-tables wd fl">
			 		                    
                                        <%  String msg= (String)request.getAttribute("message") ;
                                        
                                        if(msg!=null){
                                        	  %>                                        	
                                        	 <div class="alert alert-error"> <%= msg %> </div>
                                         <% 
                                        }
                                        %>
                                        
                                       <% 
										String success =(String)request.getAttribute("message1");
										if (success !=null) {
									%>
									<div class="alert alert-error"><%=success%></div>
                                     
										<% } %>
                                   <div class="alert alert-error" id="error-holder"></div>
      
	            <div class="Lockit-main-content fl">
	            	<div class="form-horizontal">
	            	<div class="control-group">
                            <label class="control-label">
                            	Old Password<span class="req"></span>
                            </label>
                            <div class="controls">
	                            <input type="password" id="oldpwd"  name="oldpwd" />
                             </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                            	New Password<span class="req"></span>
                            </label>
                            <div class="controls">
	                            <input type="password" id="newpwd"  name="newpwd"/>
                             </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                            	Confirm New Password<span class="req"></span>
                            </label>
                            <div class="controls">
	                           	<input type="password" id="newconfirmpwd" name="newconfirmpwd" />
                             </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input type="button" Value="Update" Class="btn btn-primary" onclick="return(validate());"/>
                            </div>
                        </div>
	           		</div>
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
   <!-- end change pwd -->

    </form>
</body>
</html>