<%@ page language="java" contentType="text/html; charset=ISO-8859-1" session="true"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>New Registration - Login Page</title>

        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
            
        <!--  new css -->
        <link href="css/lockit-styles.css" rel="stylesheet" type="text/css" />
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
	
	var x=document.forms["myForm"]["displayname"].value;
	var y=document.forms["myForm"]["email"].value;
	var pass=document.forms["myForm"]["password"].value;
	var con_pass=document.forms["myForm"]["confirmpassword"].value;
	var z=pass.length;
	
	var atpos=y.indexOf("@");
	var dotpos=y.lastIndexOf(".");
	
	if (x==null || x=="")
		
		{
			// alert("First name must be filled out"); 
			document.getElementById("error").innerHTML="Display name is mandatory.";
		    return false;
		    
			
		}
	if (y==null || y=="")
		
	{
		// alert("First name must be filled out"); 
		document.getElementById("error").innerHTML="Email id is mandatory.";
	    return false;
	    
		
	}
		if (atpos<1 || dotpos<atpos+2 || dotpos+2>=y.length)
	{
		//alert("Not a valid e-mail address");
		document.getElementById("error").innerHTML="Invalid email id.";
		return false;
	}
		if (pass==null || pass=="" || con_pass==null || con_pass=="")
			
		{
			// alert("First name must be filled out"); 
			document.getElementById("error").innerHTML="Display name is mandatory.";
		    return false;
		    
			
		}
	     
			if((pass!=con_pass || !pass)) 
				
			 {
			//alert("Password does not match!!! Please give correct password");
			document.getElementById("error").innerHTML="Password do not match.";
			return false;
			}
			 if (pass.length < 6)
		      {
		      //alert("password length must be atleast 6 characters");
		      document.getElementById("error").innerHTML="Password length must be atleast 6 characters.";
		   return false;
		      }
}
</script>

</head>

<body>
<form  name="myForm" action="signup.do" method="post" id="form1" onsubmit="return  validate();" >
<!--  new signup code -->
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
                    <img src="images/signup-withlockit.png" />
                    <div class="margin-left-login">
						<div class="lockit-google-login">                    	
                            <div class="login-with-lockit">
                            	<div class="text-center">         	           
				          	        <% 
					String error =(String)request.getAttribute("message1");
					if (error !=null)
					{
					%>
					<span id ="error-holder" style="color:#ff0000;"><%=error%></span>

					<%
					}
					%> 
					<span id ="error" style="color:#ff0000;"></span>
								</div>
                            	<ul>
                            		<li>
                            			<input  type="text"  name="email" id="email" class="name small-txt" placeholder="Enter Email ID"/>
                            		</li>
		                            <li>
		                            	<input  type="password"  name="password" id="password" class="name small-txt" placeholder="Password"/>
		                            </li>
		                            <li>
		                            	<input  type="password" id="confirmpassword" name="confirmpassword" class="name small-txt" placeholder="Confirm Password"/>
		                            </li>
		                            <li>
		                            	<input  type="text"  name="displayname" class="name small-txt" placeholder="Display Name"/>
		                            </li>
		                            <li>
		                            	<input style="width:110px; color:#fff; font-weight:bold;" type="submit" value="Sign up" class="btn login-btn"  >
		                            </li>
		                            <li>
		                            	Already a User? <a style="color:#f40101;" id="HyperLink2" href="login.do">Sign in Here</a>
		                            </li>
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
</div>
<!--  end new signup code -->

</form>
</body>
</html>
