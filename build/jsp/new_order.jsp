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
				self.location = "add_book_in_order.jsp"
			}
			function finish(){
				self.location = "handle/finish_order.jsp"
			}
		</script>
	</head>

	<body>	
		<%	String order = (String)session.getAttribute("order");
			String user = (String)session.getAttribute("user"); 
			try{
			Connector.start();
			if (order == null || order.equals("")){
				long orderid = Order.createNewOrder(user);		
				order = Long.toString(orderid);
				session.setAttribute("order", order);
			} %>
			<div>
				<h1>New Order # <%= order %> </h1>
				<input type="button" class="small-button" value="+ Add Book"  onclick="new_book()"/>
				<input type="button" class="small-button" value="finish this order"  onclick="finish()"/>
			</div>

			<div>
		<%		QueryResult rs= new OrderSummary(order).query();
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