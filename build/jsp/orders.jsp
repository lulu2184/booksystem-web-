<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.query.OrderList" %>
<%@ page language="java" import="backend.query.IntStrPair" %>
<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="java.sql.SQLException" %>
<%@ page language="java" import="java.util.List" %>
<%@ page language="java" import="java.util.ArrayList" %>

<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
		<script type="text/javascript">
			function new_order(){
				self.location = "new_order.jsp";
			}
		</script>
	</head>

	<body>	
		
			<% String user = (String)session.getAttribute("user"); 
				String order = (String)session.getAttribute("order");
				if (user == null || user.equals("")){ %>
					<p>Please login first.</p>
				<%}else{ %>
					<div>
						<h1>Your Orders</h1>
					</div>
					<% if (order == null || order.equals("")){  %>
						<input type="button" class="small-button" value="+ Start New Order" 
								onclick="new_order()"/>
					<% }else{ %>
						<input type="button" class="small-button" value="Current Order" 
								onclick="new_order()"/>
					<% } %>
 					<div>
<%					try{
						Connector.start();
						QueryResult rs = new OrderList(user).query();
						String enterElement = "<a href=\"one_order.jsp?%s\" class=\"details\">details</a>";
						List<String> element = new ArrayList<String>();
						List<String> key = new ArrayList<String>();
						element.add(enterElement);
						key.add("orderID");
						out.println(QueryResultToHtml.transform(rs, key, element));
				    }catch (Exception e){
				    	out.println("An Exception occured: " + e.getMessage());
					}finally{
						Connector.close();				        
					}
%>
				</div>
				<% } %>
	</body>

</html>