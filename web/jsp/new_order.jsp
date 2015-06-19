<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.query.OrderSummary" %>
<%@ page language="java" import="backend.query.IntStrPair" %>
<%@ page language="java" import="backend.session.Order" %>
<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="java.sql.SQLException" %>

<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
		<script>
			function new_book(){

			}
			function finish(){
				
			}
		</script>
	</head>

	<body>	
		<div>
			<h1>New Order # <%= order %> </h1>
			<input type="button" class="small-button" value="+ Add Book"  onclick="new_book()"/>
			<input type="button" class="small-button" value="finish this order"  onclick="finish()"/>
		</div>

		<div>
	<%
			long orderid = Order.createNewOrder();
			String order = Long.toString(orderid);
			session.setAttribute("order", order);
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