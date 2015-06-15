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
				alert(form_obj.searchAttribute.value+"='"+form_obj.attributeValue.value+"'");
				if( form_obj.attributeValue.value == ""){
					alert("Search field should be nonempty");
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
			<input type=hidden name="searchAttribute" value="login">
			<input type=text name="attributeValue" length=10>
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