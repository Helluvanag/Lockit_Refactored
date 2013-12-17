
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	
		String logged_user = (String)session.getAttribute("user_name");
		String logged_user_mail = (String)session.getAttribute("user_mail");

		System.out.println("logged_user...."+logged_user);
		
		String dir_error = (String)request.getAttribute("dir_error");
		String Photourl = (String)request.getAttribute("Photourl");
   %>
<!DOCTYPE html>

<html lang="en">
    <head>
         <meta charset="utf-8" />
        <title>Lockit - Active Directory Settings</title>

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
<script type="text/javascript">
function importactivedirectory(){
	
	if (document.form1.txt_domain.value == ""){
		document.getElementById("lblMessage1").innerHTML = "Enter Domain name";
		document.form1.txt_domain.focus();
		return false;
	}
	else if (document.form1.txt_domainUser.value == ""){
		document.getElementById("lblMessage2").innerHTML = "Enter Domain username";
		document.form1.txt_domainUser.focus();
		return false;
	}
	else if (document.form1.txt_domainpwd.value == ""){
		document.getElementById("lblMessage3").innerHTML = "Enter Domain password";
		document.form1.txt_domainpwd.focus();
		return false;
	}
	else{
	var f=document.form1;
	f.method="post";
	f.action='importactivedirectorycontacts.do';
	f.submit();
	}
}

</script>


</head>
<body>
    <form id="form1" name="form1" method="post">
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
                	<li><a href="groups.do">Groups > Import Active Directory</a></li>
                </ul>
            </div>
          	<div class="Body-Title fl">
				<div class="Title3 fl">
                	<a><img class="fl" src="images/Title_Help.png" /></a>
                	<h1>Import Active Directory</h1>
                </div>
            </div>
            
            <!-- table data -->
        
			 	<div class="lockit-data-tables wd fl">
			 		<div class="control-group">
                                        <%
                                        if(dir_error!=null){
                                        	%>
                                        	<span id="lblMessage4" style="color:Red;"><%=dir_error %></span>
                                        	<%
                                        }
                                        
                                        %>
                                         
                                         </div>
					<div class="form-horizontal">
                                        
                                        <div class="control-group">
                                            <label class="control-label">Domain Name <span class="req"></span></label>
                                            <div class="controls">
                                            <input type="text" id="txt_domain" name="txt_domain"/>
                                            <span id="lblMessage1" style="color:Red;"></span>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Domain User Name <span class="req"></span></label>
                                            <div class="controls">
                                            <input type="text" id="txt_domainUser" name="txt_domainUser"/>
                                             <span id="lblMessage2" style="color:Red;"></span>
                                                               </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Domain Password <span class="req"></span></label>
                                            <div class="controls">
                                            <input type="password" id="txt_domainpwd" name="txt_domainpwd" />
                                                      <span id="lblMessage3" style="color:Red;"></span>  
                                            </div>
                                        </div>
                                    <div class="control-group">
                                            <div class="controls">
                                            <input type="button" id="Btn_Import" class="btn btn-primary" value="Import" onclick="importactivedirectory();"/>
                                             <a href="groups.do"><input type="button" id="Btn_Cancel" class="btn btn-primary" value="Cancel"/></a>
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
		<a>Powered by: Verudix Solutions</a>
      </div>
    </div>
</div>
<!--Lockit-Inner-footer- Ends -->

</div>	
    <!-- end active directory -->
        </form>
</body>
</html>
