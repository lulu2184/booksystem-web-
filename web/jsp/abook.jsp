<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.query.UsefulFeedback" %>
<%@ page language="java" import="backend.query.IntStrPair" %>
<%@ page language="java" import="java.util.ListIterator" %>
<%@ page language="java" import="java.util.List" %>
<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="java.sql.SQLException" %>

<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">

	</head>

	<body>	
			
<%
		String book = request.getParameter("ISBN");					
		out.println("<p1>" + book + "</p1>");
		try{
			Connector.start();
			QueryResult rs= new UsefulFeedback(book, 10).query();
			String enterElement = "<a href=\"rate_feedback.jsp?%s\" class=\"details\">rate for it</a>";
			out.println(QueryResultToHtml.transform(rs, "fid", enterElement));
	    }catch (Exception e){
	    	out.println("An Exception occured: " + e.getMessage());
		}finally{
			Connector.close();				        
		}
%>
	</body>

</html>