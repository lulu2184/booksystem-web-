<%@ page language="java" import="backend.Connector" %>
<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.update.CreateNewBook" %>
<%@ page language="java" import="backend.info.BookInfo" %>
<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
	</head>

	<body>
		<%
			String ISBN = request.getParameter("ISBN");
			String title = request.getParameter("title");
			String authors = request.getParameter("authors");
			Integer inum = Integer.valueOf(request.getParameter("stock"));
			double price = Double.parseDouble(request.getParameter("price"));
			String format = request.getParameter("format");
			String subject = request.getParameter("subject");
			String pname = request.getParameter("pname");
			Integer pyear = Integer.valueOf(request.getParameter("pyear"));
			String[] author_list = authors.split(",");
			BookInfo info = new BookInfo(ISBN, title, inum, price, format, subject, pname, pyear, author_list);

			try{
				Connector.start();
				CheckResult result = new CreateNewBook(info).actions();
				if (result.isValid()){
					out.println("<h1>Successful to add book " + ISBN + ".</h1>");
		%>
					<meta http-equiv="Refresh" content="5;url=../books.jsp" />
		<%
				}else{
					out.println("<h1> Unsuccessfull to add book " + ISBN + ". </h1>");
					out.println("<h1>" + result.getMessage() + "</h1>");
					out.println("<h1>" + pname + "</h1>");
					out.println("<meta http-equiv=\"Refresh\" content=\"3;url=../add_new_book.jsp\" />");
				}
		    }catch (Exception e){
		    	out.println("An Exception occured: " + e.getMessage());
			}finally{
				Connector.close();				        
			}
		%>
	</body>

</html>