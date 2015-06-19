
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">

	</head>

	<body>
		<div>
			<% String ISBN=request.getParameter("ISBN"); %>
			
			<h1>Give Feedback to # <%=ISBN%></h1>
			<div class="radius-grey-div give-feedback-box">
				<form name="give_feedback_form" method=post action= <%="\"handle/give_feedback.jsp?ISBN=" + ISBN + "\""%>>
					Score:<select name="score">
						<% for (int i = 0; i <= 10; ++i){ %>
								<option value=<%=Integer.toString(i)%>><%=Integer.toString(i)%></option>	
						<%	}  %>
					</select>
					<br/>
					Comment:
					<br/>
					<textarea name="comment" id="comment"> </textarea>
					<br/>
					<input type="submit" name="Submit"/>
				</form>
			</div>
		</div>
	</body>

</html>