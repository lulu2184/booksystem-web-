<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.update.GiveFeedback" %>
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<%
			String username = (String)session.getAttribute("user");
			String ISBN = request.getParameter("ISBN");
			Integer score = Integer.valueOf(request.getParameter("score"));
			String comment = request.getParameter("comment");
			try{
				Connector.start();
				CheckResult result = new GiveFeedback(username, ISBN, score, comment).actions();
				if (result.isValid()){
					out.println("<h1>Successful to give feedback.</h1>");
					session.setAttribute("user", username);
		%>
					<meta http-equiv="Refresh" content=<%="\"5;url=../abook.jsp?ISBN=" + ISBN + "\""%> />
		<%
				}else{
					out.println("<h1> Unsuccessfull to give feedback. </h1>");
					out.println("<h1>" + result.getMessage() + "</h1>");
					out.println("<meta http-equiv=\"Refresh\" content=\"5;url=../give_feedback.jsp?ISBN=" + ISBN + "\" />");
				}
		    }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
		%>
	</body>

</html>