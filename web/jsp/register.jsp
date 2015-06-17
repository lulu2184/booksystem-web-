<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<h1>register</h1>
			<div class="radius-grey-div login-box">
				<form name="register_form" method=post action="handle/new_user.jsp">
					User name: <input type="text" name="username"/>
					<br/>
					Password: <input type="password" name="password"/>
					<br/>
					Full name: <input type="text" name="fullname"/>
					<br/>
					Age: <select name="age">
					<% for (int i = 1; i < 100; i++){ %>
						<option value= <%= Integer.toString(i) %>><%= Integer.toString(i) %></option>
					<%	} %>
					</select>
					<br/>
					Address: <input type="text" name="address"/>
					<br/>
					Phone number: <input type="text" name="phone"/>
					<input type="submit" name="Submit"/>
				</form>
			</div>
	</body>

</html>