<%@page import="com.verudix.lockit.service.DashboardServiceImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
<script src="js/jquery.autocomplete.js"></script>  
		
 <% 
	try{      
		 String s[]=null;

	 DashboardServiceImpl dashboardServiceImpl=(DashboardServiceImpl)config.getServletContext().getAttribute("dashboardServiceImpl");
            
		
		 List lig=dashboardServiceImpl.usp_Select_Groups((String)session.getAttribute("user_mail"));
		 List li=dashboardServiceImpl.getAllUserContacts((String)session.getAttribute("user_mail"));
		  
		  li.addAll(lig);
		  System.out.println("Group Users:"+lig);
			
			String[] str = new String[li.size()];			
			Iterator it = li.iterator();
			int i = 0;
			while(it.hasNext())
			{
				String p = (String)it.next();	
				str[i] = p;
				i++;
			}
		
			//jQuery related start		
				String query = (String)request.getParameter("q");
			
			//   System.out.println("q value:"+query);
				
				int cnt=1;
				for(int j=0;j<str.length;j++)
				{
					if(str[j].toUpperCase().startsWith(query.toUpperCase()))
					{
						out.print(str[j]+"\n");
						if(cnt>=100)
							break;
						cnt++;
					}
				}
			//jQuery related end	
		
	    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}


 %>