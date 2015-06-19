<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.query.UsefulFeedback" %>
<%@ page language="java" import="backend.query.IntStrPair" %>
<%@ page language="java" import="java.util.ListIterator" %>
<%@ page language="java" import="java.util.List" %>
<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="java.sql.SQLException" %>

<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>	
		<% String user = (String)session.getAttribute("user"); 

		if (user == null || user.equals("")){
			out.println("Please login first.");%>
			<meta http-equiv="Refresh" content="5;url=../html/login.html" />
		<% } else{ %>

		<div class="radius-grey-div rate-feedback-box">
	<%
			String feedback = request.getParameter("fid");	
			String ISBN = request.getParameter("ISBN");				
			out.println("<p1>" + "rate for feedback #" + feedback + "</p1>");

	%>
			<form name="rate_for_feedback" method=post action=<%="\"handle/rate_feedback.jsp?fid=" + feedback + "\"" %>>
				Score:
				<select name="score">
					<% for (int i = 0; i <= 2; ++i){ %>
							<option value=<%=Integer.toString(i)%>><%=Integer.toString(i)%></option>	
					<%	}  %>
				</select>
				<br/>
				<input type="submit">
			</form>
	<%		try{
				Connector.start();

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