<%@ page language="java" import="backend.check.CheckResult" %>
<%@ page language="java" import="backend.query.DegreeOfAuthor" %>
<%@ page language="java" import="backend.Connector" %>

<html>
	<%
		try{
			String author1 = request.getParameter("author1");
			String author2 = request.getParameter("author2");
			Connector.start();
			CheckResult rs = new DegreeOfAuthor(author1, author2).query();
			if (rs.isValid()){
				out.println("result: degree of " + author1 + " and " + author2 + " is " + rs.getMessage() + ".");
			}else{
				out.println("Sorry, " + rs.getMessage() + ".");
			}
		}catch (Exception e){
			out.println("An exception occurs: " + e.getMessage());
		}finally{
			Connector.close();
		}
	%>
</html>