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
				<select type="option" name="condition_left_1_1">
					<option value="0">author</option>
					<option value="1">publisher</option>
					<option value="2">title word</option>
					<option value="3">subject</option>
				</select>
				<span>=</span>
				<input type="text" name="condition_right_1_1" class="browsing-input"/>
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