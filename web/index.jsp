<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link href="css/index.css" rel="stylesheet">
	<title>JSP Example</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<script src="script/index.js"></script>
</head>

<body>
	<div id="container">
		<div id = "header">
			<h1>Book System</h1>	
		</div>

		<div id = "middle">
			<div id="sidebar">
				<div class="user-info">
					<img src="img/user-img.jpg" id="user-img"/>
					<div id="user-access-block">
					<%
						String user=(String)session.getAttribute("user");
						if (user==null || user.equals("")){ 
					%>
						<input type="button" class="small-button" onclick="login_page()" value="login"/>
						<button class="small-button">register</button>
					<% }else{  %>
						<p id="username">Hello, <%= user %></p>
						<input type="button" class="small-button" onclick="logout()" value="logout"/>
					<% } %>
					</div>
				</div>
				<div id="navigate">
					<ul>
						<li class="sidebar-button" id="books-button" onclick="books_page()">
							<a href>Books</a>
						</li>
						<li class="sidebar-button" id="orders-button" onclick="orders_page()">
							<a href>Orders</a>
						</li>
						<li class="sidebar-button" id="sidebar-button" onclick="summary_page()">
							<a href>Summary</a>
						</li>
					</ul>
				</div>
			</div>

			<div id="content">
				<iframe src="jsp/books.jsp" id="embed_page" frameborder="0" height="100%" width="100%"></iframe>
			</div>
		</div>

		<div id = "footer">
			<p> Author by: Lu Liu</p>
			<p> Contact me: lulu2184@gmail.com</p>
		</div>

	</div>

</body>
</html>
