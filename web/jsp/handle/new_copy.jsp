<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.update.IncreaseNumberOfBook" %>
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<%
			String book = (String)request.getParameter("ISBN");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			try{
				Connector.start();
				CheckResult result = new IncreaseNumberOfBook(book, quantity).actions();
				if (result.isValid()){
					out.println("<h1>Successful to add new copies.</h1>");
				}else{
					out.println("<h1> Unsuccessfull to add new copies. </h1>");
					out.println("<h1>" + result.getMessage() + "</h1>");
				}
		    }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
		%>
			<meta http-equiv="Refresh" content="3;url=../books.jsp" />
	</body>

</html>