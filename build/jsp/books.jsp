<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.query.BookBrowsing" %>
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
					try{
						Connector.start();
						List<List<IntStrPair>> query = new ArrayList<List<IntStrPair>>();
						QueryResult rs= new BookBrowsing(query, 1).query();
						String enterElement = "<a href=\"abook.jsp?%s\" class=\"details\">details</a>";
						out.println(QueryResultToHtml.transform(rs, "ISBN", enterElement));
				    }catch (Exception e){
				    	out.println("An Exception occured: " + e.getMessage());
					}finally{
						Connector.close();				        
					}
%>
	</body>

</html>