<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
 
<%

String logged_user = (String)session.getAttribute("user_name");
String logged_user_mail = (String)session.getAttribute("user_mail");

//System.out.println("logged_user...."+logged_user);

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Lockit : Forgot Password </title>

        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
            
		<!--  new css -->
        <link href="css/lockit-styles.css" rel="stylesheet" type="text/css" />
        <link href="css/popup.css" rel="stylesheet" type="text/css" />
        
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
        
  <script>

function checkEmail() {

    var email = document.getElementById('txtUserName');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
 
    document.getElementById("error").innerHTML="Enter Valid Email Id.";
    email.focus;
    return false;
 }
}</script>

</head>
<body>

    <form name="forgotpassword" action="ForgotPassword.do" method="post" id="form1" onsubmit="return  checkEmail();">
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
                            <span id ="error" style="color:#ff0000;"></span>
                            	<ul>
                            		<li>Enter an email address to help us locate your account</li>
		                            <li>
		                            	<input name="email"  type="text" maxlength="128" id="txtUserName" tabindex="1" class="name small-txt" placeholder="Enter Email ID" />
		                            </li>
		                          <!--   <li><a style="width:110px; color:#fff; font-weight:bold;" class="btn login-btn" id="go" rel="leanModal" name="signup" href="#signup">Submit</a></li>
		                            --><li> <input type="submit"  style="width:110px; color:#fff; font-weight:bold;" value="Submit" class="btn login-btn" id= "btnSubmit" TabIndex="2"/>  </li>
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
    
<!-- forgot pwd --> 
<!--  end forgot pwd -->
        <div class="container mv15">
           
            <div class="span4">
                <div class="login_box">
        <!-- sign in -->    
                   
                              
       
<% 
String error =(String)request.getAttribute("message");
if (error !=null) {

	
%>
                 <div class="box_top">
                        <h4>Forgot your password?</h4>
                     <br>
                   
                            <div class="text-center">

								<span id = "successmessage" style="color:Blue;" class="error_box" ><%=error%></span>

							</div>
							  <br>
						<div class="text-center">
							<a href="login.do">Back to Home</a>
					</div>
	
 </div>  
 
<%

}else{
	%>
       
	 <div class="box_top">
                     
                            </div>  
                    <div class="box_content" id="divForgetPassword" >
                        <div class="row-fluid">
                           
                            <div class="text-center">
   
     
<% 
String error1 =(String)request.getAttribute("message");
if (error1 !=null) {

%>
<span  id = "error-holder" style="color:#ff0000;" class="error_box"><%=error1%></span>
<%

}
%>    
    </div>
        
     
       
   </div>
                    </div>

	<%
}
%> 
 
                </div>
            </div>
        </div>
<!-- popup div -->
<p><a id="go" rel="leanModal" name="signup" href="#signup">With Close Button</a>
		</p>
<div id="signup">
			<div id="signup-ct">
				<div id="signup-header">
					<h2>Forgot your Password?</h2>
					<a class="modal_close" href="#"></a>
				</div>
				<div id="signup-header">
					Please provide a valid Email address
				</div>
				
				  <div class="btn-fld">
				  <button type="submit">OK</button>
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
    </form>
    </body>
</html>