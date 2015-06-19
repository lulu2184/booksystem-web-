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
			function check_positive_number(form_obj){
				var re = /^[1-9]+[0-9]*]*$/;
				if(re.test(form_obj.number.value) == false){
					alert("The number should be a positive number.");
					return false;
				}
				return true;
			}

			function give_feedback(para){
				console.log(para);
				self.location = "give_feedback.jsp?ISBN=" + para;
			}
		</script>
	</head>

	<body>	
			

		<% String book = request.getParameter("ISBN"); 
			String number = request.getParameter("number");
			if (number == null){
				number = "10";
			}%>	
		<div>		
			<h1> feedbacks of # <%= book %> </h1>
			<div>
			<% String user = (String)session.getAttribute("user");
				if (user != null && !user.equals("")){ %>
					<input type="button" class="small-button" value="+ Give Feedback" 
								onclick=<%="give_feedback(\""+book+"\")" %> />
				<% } %>

				<form class="result-num-form" onsubmit="check_positive_number(this)" action="abook.jsp">
					get the top
					<input type="number" name="number" value=<%="\"" + number + "\""%>/>
					<input type="hidden" name="ISBN" value=<%="\"" + book + "\"" %>/>
					most useful results.
					<input type="submit" value="submit"/>
				</form>
			</div>
		</div>

		<div>
<%			try{
				int num;
				if (number == ""){
					num = 10;
				}else{
					num = Integer.parseInt(number);
				}
				Connector.start();
				QueryResult rs= new UsefulFeedback(book, num).query();
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