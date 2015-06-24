
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
		<script type="text/javascript">
			function check_num_form (obj_form) {
				var re = /^[1-9]+[0-9]*]*$/;
				if(re.test(form_obj.quantity.value) == false){
					alert("The quantity should be a positive number.");
					return false;
				}
				return true;
			}
		</script>

	</head>

	<body>
		<div>
			<% String order=(String)session.getAttribute("order"); %>
			
			<h1>Add book to order # <%=order%></h1>
			<div class="radius-grey-div add-book-order-box">
				<form name="add_book" method=post onsubmit="check_num_form(this)" action="handle/add_book_in_orders.jsp">
					ISBN:<input typt="text" name="ISBN"/>
					<br/>
					quantity:<input type="number" name="quantity"/>
					<br/>
					<input type="submit" name="Submit"/>
				</form>
			</div>
		</div>
	</body>

</html>