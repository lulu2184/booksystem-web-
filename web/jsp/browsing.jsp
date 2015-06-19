<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
		<link href="../css/browsing.css" rel="stylesheet">
		<script src="../script/browsing.js"></script>
	</head>

	<body>
		<div>
			<h1>Book Browsing</h1>
		</div>

		<div class="radius-grey-div browsing-box">
			Condition:<br/>
			<form id="condition_form" method=post onsumbit="check_notnull()" action="handle/browsing.jsp">
				<span>(</span>
				<select type="option" id="condition_left11">
					<option value="author">author</option>
					<option value="publisher">publisher</option>
					<option value="title">title word</option>
					<option value="subject">subject</option>
				</select>
				<span>=</span>
				<input type="text" id="condition_right11" class="browsing-input"/>
				<input type="button" onclick="add_and()" value="+ and" id="and_button"/>
				<span>)</span>
				<br/>
				<input type="button" onclick="add_or()" value="+ or" id="or_button"/>
				<br/><br/>
				<input type="button" onclick="finish_action()" value="finish" id="finish"/>
			</form>
		</div>
	</body>

</html>