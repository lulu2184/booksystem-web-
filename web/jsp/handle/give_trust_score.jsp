<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.update.DeclareUser" %>
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<%
			String username = (String)session.getAttribute("user");
			String u2 = (String)request.getParameter("user");
			Integer score = Integer.valueOf(request.getParameter("score"));
			try{
				Connector.start();
				CheckResult result = new DeclareUser(username, u2, score).actions();
				if (result.isValid()){
					out.println("<h1>Successful to give score to " + u2 + ".</h1>");
		%>
					<meta http-equiv="Refresh" content="3;url=../users.jsp" />
		<%
				}else{
					out.println("<h1> Unsuccessfull to give score to " + u2 + ". </h1>");
					out.println("<h1>" + result.getMessage() + "</h1>");
					out.println("<meta http-equiv=\"Refresh\" content=\"5;url=../users.jsp\" />");
				}
		    }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
		%>
	</body>

</html>