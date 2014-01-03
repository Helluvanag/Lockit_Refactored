<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Lockit : Reset Password </title>

        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
            
        <!--  new css -->
        <link href="css/lockit-styles.css" rel="stylesheet" type="text/css" />
        
            <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300&amp;subset=latin,latin-ext' rel='stylesheet' />
            <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />

        <!--[if lt IE 9]>
            <style>
                select, textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input {display:inline;min-height:20px !important}
            </style>
            <script src="js/ie/html5shiv.min.js"></script>
        <![endif]-->
        
        <script type="text/javascript">
        
        function  btnReset_Click()
        
        
        {
        	var pass=document.forms["myForm"]["password"].value;
        	var re_enterd_pass=document.forms["myForm"]["re_password"].value;
        	
        	if(pass==""  && re_enterd_pass=="" )
        	{
        		document.getElementById("error-holder").innerHTML="All fields are mandatory.";
        		return false; 
        	}
        	
        	else if (pass==null || pass=="")
        	{
        		document.getElementById("error-holder").innerHTML="Password is mandatory.";
        		return false; 
        	}
        	
        	else if(re_enterd_pass==null || re_enterd_pass=="")
        	{
        		document.getElementById("error-holder").innerHTML="Re-Enter Password.";
        		return false; 
        	}
        	
        	else if((pass!=re_enterd_pass || !pass)) 
			{
        		
        	document.getElementById("error-holder").innerHTML="Password does not match.";
	 		return false; 
	 		
			}
        	
        	else if (pass.length < 6)
        	{
        		
        		document.getElementById("error-holder").innerHTML="Password length must be atleast 6 characters.";
    			return false; 
    			
        	}
        	 else
        	{
        		var f = document.myForm;
  				f.method="post";
  				f.action='resetPassword1.do';
  				f.submit();
        	}
        }
     
        </script>
    </head>
    <body>
        <form  name="myForm"  method="post"  >
   
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
                    <img src="images/Resetyour-passw.png" />
                    <div class="margin-left-login">
						<div class="lockit-google-login id="resetDiv" runat="server"">                    	
                            <div class="login-with-lockit id="divForgetPassword" runat="server"">
                            	<ul>
                            		<li>Passwords are case-sensitive and must be at least 6 characters long.</li>
                            		<li>
                            			 <% 
										String message =(String)request.getAttribute("message1");
			                            
			                              System.out.println("error in loginf.."+message);
										if (message !=null) {
										%>
										<span id="error-holder" style="color:red;" class="error_box"><%=message%></span>
			          
										<% } else{%>
										<span id="error-holder" style="color:red;" class="error_box"></span>
										<% } %>
                            		</li>
                            		<li>
                            			<input id="txtPassword" type="password" name="password" MaxLength="64" TabIndex="1" class="name small-txt" placeholder="Enter New Password"/>
                            		</li>
		                            <li>
		                            	<input id="txtConfirmPassword" name="re_password" type="password" MaxLength="64" TabIndex="2" class="name small-txt" placeholder="Re-Enter New Password"/>
		                            </li>
		                            <li>
		                            	<input style="width:145px; color:#fff; font-weight:bold;" id="btnReset" class="btn login-btn" value="Reset Password" type="button"  onClick=" return btnReset_Click()"; TabIndex="3" />
		                            	<!--  onclick="return btnReset_Click();" -->
		                            </li>
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