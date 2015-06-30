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
			Integer age = Integer.valueOf(request.getParameter("age"));
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			UserInfo info = new UserInfo(username, password, fullname, age, address, phone);

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