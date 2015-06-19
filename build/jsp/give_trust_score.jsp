
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<div>
			<% String u2=request.getParameter("user"); %>
			
			<h1>Do you trust <%=u2%></h1>
			<div class="radius-grey-div give-trust-score-box">
				<form name="give_feedback_form" method=post action="handle/give_trust_score.jsp">
					<input type="hidden" name="user" value=<%= "\"" + u2 + "\"" %>/>
					<input type="radio" name="score" value="1"/>Yes<br/>
					<input type="radio" name="score" value="0"/>No<br/>
					<input type="submit" name="Submit"/>
				</form>
			</div>
		</div>
	</body>

</html>