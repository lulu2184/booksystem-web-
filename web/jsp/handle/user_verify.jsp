<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.check.content.ValidUser" %>
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<%
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			try{
				Connector.start();
				CheckResult result = new ValidUser(username, password).check();
				if (result.isValid()){
					out.println("<h1>Successful to login.</h1>");
					session.setAttribute("user", username);
		%>
					<meta http-equiv="Refresh" content="5;url=../books.jsp" />
					<script>parent.location.reload()</script>;
		<%
				}else{
					out.println("<h1> Unsuccessfull to login. </h1>");
					out.println("<h1>" + result.getMessage() + "</h1>");
					out.println("<meta http-equiv=\"Refresh\" content=\"5;url=../../html/login.html\" />");
				}
		    }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
		%>
	</body>

</html>