<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.query.BookList" %>
<%@ page language="java" import="backend.query.IntStrPair" %>
<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="java.sql.SQLException" %>
<%@ page language="java" import="java.util.List" %>
<%@ page language="java" import="java.util.ArrayList" %>

<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
		<script src="../script/books.js"></script>
	</head>

	<body>	
		<div>
			<h1>Books</h1>
			<input type="button" class="small-button" value="+ Add New Book" onclick="add_new_book()"/>
		</div>

		<div>
<%
					try{
						Connector.start();
						QueryResult rs= new BookList().query();
						String enterElement = "<a href=\"abook.jsp?%s\" class=\"details\">feedbacks</a>";
						String addElement = "<a href=\"new_copy.jsp?%s\" class=\"details radius-button\">+</a>";
						List<String> element = new ArrayList<String>();
						List<String> key = new ArrayList<String>();
						element.add(enterElement);
						element.add(addElement);
						key.add("ISBN");
						key.add("ISBN");
						out.println(QueryResultToHtml.transform(rs, key, element));
				    }catch (Exception e){
				    	out.println("An Exception occured: " + e.getMessage());
					}finally{
						Connector.close();				        
					}
%>
		</div>
	</body>

</html>