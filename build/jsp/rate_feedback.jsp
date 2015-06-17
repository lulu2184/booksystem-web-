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
		<script LANGUAGE="javascript">

			function check_all_fields(form_obj){
				//alert(form_obj.score.value+"='"+form_obj.score.value+"'");
				if(form_obj.score.value == ""){
					alert("score should be nonempty");
					return false;
				}
				return true;
			}

		</script> 
	</head>

	<body>	
			
<%
		String feedback = request.getParameter("fid");					
		out.println("<p1>" + "rate for feedback #" + feedback + "</p1>");

%>
		<form name="rate_for_feedback" method=get onsubmit="return check_all_fields(this)" action="handle/rate_feedback.jsp">
			<input type="text" name="score" value="score">
			<input type=submit>
		</form>
<%		try{
			Connector.start();

	    }catch (Exception e){
	    	out.println("An Exception occured: " + e.getMessage());
		}finally{
			Connector.close();				        
		}
%>
	</body>

</html>