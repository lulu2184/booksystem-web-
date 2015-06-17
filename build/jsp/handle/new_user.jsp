<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.update.RegisterActions" %>
<%@ page language="java" import="backend.info.UserInfo" %>
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<%
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String fullname = request.getParameter("fullname");
			double price = Double.parseDouble(request.getParameter("price"));
			String format = request.getParameter("format");
			String subject = request.getParameter("subject");
			String pname = request.getParameter("pname");
			String pyear = request.getParameter("pyear");
			BookInfo info = new BookInfo(username, password, fullname, age, address, phone);

			try{
				Connector.start();
				CheckResult result = new RegisterActions(info).actions();
				if (result.isValid()){
					out.println("<h1>Successful to register.</h1>");
					session.setAttribute("user", username);
		%>
					<meta http-equiv="Refresh" content="5;url=../books.jsp" />
					<script>parent.location.reload()</script>
		<%
				}else{
					out.println("<h1> Unsuccessfull to register. </h1>");
					out.println("<h1>" + result.getMessage() + "</h1>");
					out.println("<meta http-equiv=\"Refresh\" content=\"5;url=../register.jsp\" />");
				}
		    }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
		%>
	</body>

</html>