<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<h1>add new book</h1>
			<div class="radius-grey-div new-book-box">
				<form name="register_form" method=post action="handle/new_book.jsp">
					ISBN: <input type="text" name="ISBN"/><br/>
					Title: <input type="text" name="title"/><br/>
					Authors: <input type="text" name="authors"/>
					<p class="hint">(seperated by commas, no extra space)</p><br/>
					Number of Copies: <input type="number" name="stock" onkeyup="value=value.replace(//D/g,'')" onafterpaste="value=value.replace(//D/g,'')"/><br/>
					Price: <input onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"  name="price"/><br/>
					Format: <input type="text" name="format"/><br/>
					Subject: <input type="text" name="subject"/><br/>
					Publisher: <input type="text" name="pname"/><br/>
					Publish year: <select name="pyear"/>
					<% for (int i = 1900; i <= 2015; i++){ %>
						<option value= <%= Integer.toString(i) %>><%= Integer.toString(i) %></option>
					<%	} %>
					</select>
					<br/>
					<input type="submit" name="Submit"/>
				</form>
			</div>
	</body>

</html>