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
		<script>
			function give_feedback(para){
				console.log(para);
				self.location = "give_feedback.jsp?ISBN=" + para;
			}
		</script>
	</head>

	<body>	
			

		<% String book = request.getParameter("ISBN"); %>	
		<div>		
			<h1> feedbacks of # <%= book %> </h1>
			<% String user = (String)session.getAttribute("user");
				if (user != null && !user.equals("")){ %>
					<input type="button" class="small-button" value="+ Give Feedback" 
								onclick=<%="give_feedback(\""+book+"\")" %> />
				<% } %>
		</div>

		<div>
<%			try{
				Connector.start();
				QueryResult rs= new UsefulFeedback(book, 10).query();
				String enterElement = "<a href=\"rate_feedback.jsp?%s\" class=\"details\">rate for it</a>";
				List<String> element = new ArrayList<String>();
				List<String> key = new ArrayList<String>();
				element.add(enterElement);
				key.add("fid");
				out.println(QueryResultToHtml.transform(rs, key, element));
		    }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
%>
		</div>
	</body>

</html>