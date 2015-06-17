<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.query.UserList" %>
<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="java.sql.SQLException" %>
<%@ page language="java" import="java.util.List" %>
<%@ page language="java" import="java.util.ArrayList" %>

<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">

	</head>

	<body>	
			
<%
					try{
						Connector.start();
						QueryResult rs= new UserList().query();
						String enterElement = "<a href=\"give_trust_score.jsp?%s\" class=\"details\">score him</a>";
						List<String> key = new ArrayList<String>();
						List<String> element = new ArrayList<String>();
						key.add("user");
						element.add(enterElement);
						out.println(QueryResultToHtml.transform(rs, key, element));
				    }catch (Exception e){
				    	out.println("An Exception occured: " + e.getMessage());
					}finally{
						Connector.close();				        
					}
%>
	</body>

</html>