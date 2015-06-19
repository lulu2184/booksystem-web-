<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.query.OrderSummary" %>
<%@ page language="java" import="backend.query.IntStrPair" %>
<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="java.sql.SQLException" %>

<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
		<script>
			
		</script>
	</head>

	<body>	
		<% String order = request.getParameter("orderID"); %>
		<div>
			<h1>Order # <%= order %> </h1>
		</div>

		<div>
	<%
			try{
						Connector.start();
						QueryResult rs= new OrderSummary(order).query();
						out.println(QueryResultToHtml.transform(rs));
				    }catch (Exception e){
				    	out.println("An Exception occured: " + e.getMessage());
					}finally{
						Connector.close();				        
					}
	%>
		</div>
	</body>

</html>