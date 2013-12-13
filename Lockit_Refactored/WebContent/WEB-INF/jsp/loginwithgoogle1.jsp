<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    System.out.println("inside loginwithgoogle1 jsp.....");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
  <script type="text/javascript">
  function check(){
	 
        var url =   window.document.URL;
        
        var acToken =   gup(url, 'access_token');
        
        document.getElementById("access_token").value = acToken ;
       
       
      
		 var f=document.form1;
  		 f.method="post";
  		 f.action='loginwithgoogle1.do'; 
  		 f.submit();
        
       
        function gup(url, name) {
            name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
            var regexS = "[\\#&]"+name+"=([^&#]*)";
            var regex = new RegExp( regexS );
            var results = regex.exec( url );
            if( results == null )
                return "";
            else
                return results[1];
        }
  }
        </script>
</head>
<body onload="check();">
<form name="form1">
<input type="hidden" name="access_token" id="access_token" value=""/>
</form>
</body>
</html>