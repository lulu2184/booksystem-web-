<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<%
			session.setAttribute("user",null);
			session.setAttribute("order",null);
		%>
			<meta http-equiv="Refresh" content="5;url=../books.jsp" />
			<script>parent.location.reload()</script>
	</body>

</html>