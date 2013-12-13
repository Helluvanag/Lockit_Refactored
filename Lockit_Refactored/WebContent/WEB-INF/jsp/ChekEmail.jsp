<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
<%-- <%String msg = (String)request.getAttribute("message") ; %>
<!DOCTYPE html> --%>
<html lang="en">
<head>
 <head>
        <meta charset="utf-8" />
        <title>Lockit - Login Page</title>

        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
            
        <!--  new css -->
        <link href="css/lockit-styles.css" rel="stylesheet" type="text/css" />

        <!-- elusive webicons -->
            <link rel="stylesheet" href="css/elusive/css/elusive-webfont.css" />
            
        <!-- custom fonts -->
            <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300&amp;subset=latin,latin-ext' rel='stylesheet' />
            <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
        <!-- custom assets -->
        <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>

        <!--[if lt IE 9]>
            <style>
                select, textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input {display:inline;min-height:20px !important}
            </style>
            <script src="js/ie/html5shiv.min.js"></script>
        <![endif]-->
   
<script type="text/javascript" lang="javascript">

function validate()
{
		 
	if (document.loginform.email.value == ""){

		document.getElementById("error-holder").innerHTML = "Enter Email ID";
		document.loginform.email.focus();
		return false;
	 }
	 	
	  if (document.loginform.password.value == ""){
		
		document.getElementById("error-holder").innerHTML = "Enter Password";
		document.loginform.password.focus();
		return false;
	 }
	 return( true );
}
function login() {

    var OAUTHURL    =   'https://accounts.google.com/o/oauth2/auth?';
    var VALIDURL    =   'https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=';
    var SCOPE       =   'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email';
    var CLIENTID    =   '692423742708.apps.googleusercontent.com';
    var REDIRECT    =   'http://defigomail.com:8082/Lockit_Refactored/loginwithgoogle.do';
    var TYPE        =   'token';
    var _url        =   OAUTHURL + 'scope=' + SCOPE + '&client_id=' + CLIENTID + '&redirect_uri=' + REDIRECT + '&response_type=' + TYPE;
 
    window.location=_url;
    
    
}
</script>

</head>

<body>
 <script type="text/javascript" lang="javascript">


      function OpenGoogleLoginPopup() {    	  
    	  var url = "https://accounts.google.com/o/oauth2/auth?";
          url += "scope=https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email&";
          url += "state=%2Fprofile&"
          url += "redirect_uri=http://www.defigomail.com/Lockit/LoginWithGoogle1.aspx&"
          url += "response_type=token&"
          url += "client_id=876589672154.apps.googleusercontent.com";
          window.location = url;
      }
</script>


<form name="loginform" action="#" method="post" id="form1">
 
 <!--  new code -->
	<div id="Lockit-wrapper">
<div id="Lockit-header-wrapper">
    <div class="Lockit-header-container">
        <div class="Lockit-header fl"></div>
    </div>
</div>

<div id="Lockit-Login-wrapper">
    <div class="Lockit-Login-container">
        <div class="Lockit-Login fl">
        
        	<div class="login-what-ucan-do-content fl">
            
            	<div class="login-content">
                    <img src="images/forgot-password.png" />
                    	<%
				        String errorMsg = (String)request.getParameter("errorMsg");
				        
				        if(errorMsg != null){
				        %>
				        <div><%= errorMsg%></div>
				        <%} %>
                    <div class="margin-left-login">
						<div class="lockit-google-login">                    	
                            <div class="login-with-lockit">
                            	<ul>
                            		<li>
                            			<div class="text-center">
                              <% 
							String error =(String)request.getAttribute("message");
							if (error !=null) {
							%>
							<span id="error-holder" style="color:#ff0000;" class="error_box"><%=error%></span>

							<% } %>
          
                         <%--  <div class="row-fluid">        
        				 
       					  <% if(msg!=null){%>              
             				 <span id="error-holder"  style="color:Blue;"><%= msg %></span>
       					 <%} %>                               
		</div> --%>
                            </div>
                            		</li>
		                            <li>Please check your email. We've sent you an email that will allow you to reset your password quickly and easily.</li>
		                            <li><a href="login.do" style="color:#8b8b8b;">Back to Home?</a></li>
	                        </ul>
                            </div>
                    	</div>
                    </div>
                </div>
                
                <div class="Lockit-divline"><img src="images/div-line.png" /></div>
                
                <!--Lockit-What u can do with Lockit-->
                
                <div class="what-ucan-do-content">
                	<img src="images/Login-wht-can-do.png" />
                    <div class="margin-left-login">
	                    <img src="images/what-ucan-do-options.png" />
                    </div>
                </div>
                
            </div>
            
        </div>
    </div>
</div>
<!--Lockit-Login-Ends -->

</div>
	<!--  end new code -->

      </form>
    </body>
</html>