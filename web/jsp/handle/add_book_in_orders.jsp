<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.update.InsertABookInOrder" %>
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
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
					out.println("<h1>Successful to add books into order.</h1>");
				}else{
					out.println("<h1> Unsuccessfull to give feedback. </h1>");
					out.println("<h1>" + result.getMessage() + "</h1>");
					out.println("<meta http-equiv=\"Refresh\" content=\"5;url=../give_feedback.jsp?ISBN=" + ISBN + "\" />");
				} %>
				<meta http-equiv="Refresh" content="5;url=../new_order.jsp" />
		<%  }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
		%>
	</body>

</html>