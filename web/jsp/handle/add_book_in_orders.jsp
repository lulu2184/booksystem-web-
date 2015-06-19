<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.update.InsertABookInOrder" %>
<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="backend.query.BuyingSuggestion" %>
<html>
	<head>
		<link href="../../css/general.css" rel="stylesheet">
		<script type="text/javascript">
			function to_order(){
				self.location = "../new_order.jsp"
			}
		</script>
	</head>

	<body>
		<%
			String ISBN = request.getParameter("ISBN");
			String order = (String)session.getAttribute("order");
			Integer quantity = Integer.valueOf(request.getParameter("quantity"));
			try{
				Connector.start();
				CheckResult result = new InsertABookInOrder(order, ISBN, quantity).actions();
				if (result.isValid()){ 
		%>
					<div>
					<h1>Successful to add books into order.</h1>
		<%			String user = (String)session.getAttribute("user");
					QueryResult rs = new BuyingSuggestion(user, ISBN).query();
		%>
					<h1> Buying Suggestion </h1>
					<input type="button" class="small-button" value="back to order"  onclick="to_order()"/>
					</div>
					<div> <%= QueryResultToHtml.transform(rs) %> </div>
		<%		}else{
					out.println("<h1> Unsuccessfull to give feedback. </h1>");
					out.println("<h1>" + result.getMessage() + "</h1>");
				} 
			 }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
		%>
	</body>

</html>