<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="backend.query.BookBrowsing" %>
<%@ page language="java" import="backend.query.IntStrPair" %>
<%@ page language="java" import="java.util.List" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="java.sql.SQLException" %>

<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">

	</head>

	<body>

		
			
<%
				try{	
					List<List<IntStrPair>> query = new ArrayList<List<IntStrPair>>();
					QueryResult rs = new BookBrowsing(query, 2);
					if (rs.isValid()){
						System.out.println("<p>" + rs.getMessage() + "</p>");
					}else{ 
%>			
						<table>
						<tr>
							<td>ISBN</td>
							<td>title</td>
							<td>stock</td>
							<td>price</td>
							<td>format</td>
							<td>subject</td>
							<td>publisher</td>
							<td>publish year</td>
							<td>average score</td>
						</tr>
<%
							for (int i = 0; i < rs.result.size(); ++i){
								System.out.println("<tr>\n");
								for (int j = 0; j < rs.result[i].size();++j){
									System.out.println("<td>" + rs.result[i][j] + "</td>");
								}
								System.out.println("</tr>\n");
							}
%>
						</table>
<%

					} 
				}catch (SQLException e){
					System.out.println("<p>SQL connetion errors. </p>");
				}	
			%>
			}
			%>
		

	</body>

</html>