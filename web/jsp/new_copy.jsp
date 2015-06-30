
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<div>
			<% String book = request.getParameter("ISBN"); %>
			
			<h1>New copy of <%=book%></h1>
			<div class="radius-grey-div give-trust-score-box">
				<form name="new_copy_form" method=post action="handle/new_copy.jsp">
					<input type="hidden" name="ISBN" value=<%= "\"" + book + "\""%>/>
					quantity of new copies:<input type="number" name="quantity"/>
					<input type="submit"/>
				</form>
			</div>

		</div>
	</body>

</html>