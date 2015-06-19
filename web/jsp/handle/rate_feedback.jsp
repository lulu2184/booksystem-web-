<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.update.RateFeedback" %>
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<%
			String username = (String)session.getAttribute("user");
			long fid = Long.valueOf(request.getParameter("fid"));
			Integer score = Integer.valueOf(request.getParameter("score"));
			try{
				Connector.start();
				CheckResult result = new RateFeedback(username, fid, score).actions();
				if (result.isValid()){
					out.println("<h1>Successful to rate for feedback #" + fid + ".</h1>");
		%>
					<meta http-equiv="Refresh" content="5;url=../books.jsp" />
		<%
				}else{
					out.println("<h1> Unsuccessfull to give feedback. </h1>");
					out.println("<h1>" + result.getMessage() + "</h1>");
					out.println("<meta http-equiv=\"Refresh\" content=\"5;url=../books.jsp\" />");
				}
		    }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
		%>
	</body>

</html>