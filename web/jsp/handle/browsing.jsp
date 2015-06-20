<%@ page language="java" import="backend.query.BookBrowsing" %>
<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="backend.query.IntStrPair" %>
<%@ page language="java" import="java.util.List" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="java.util.Enumeration" %>
<%@ page language="java" import="backend.Connector" %>

<html>
	<head>
		<link href="../../css/general.css" rel="stylesheet">
	</head>

	<body>
		<div>
			<h1>Book Browsing Result</h1>
		</div>

		<div>
			<%
				Enumeration paras =  request.getParameterNames();
				int order_type = Integer.parseInt(request.getParameter("order_type"));
				int rows = Integer.parseInt(request.getParameter("rows"));
				List<List<IntStrPair>> query=new ArrayList<List<IntStrPair>>();
				for (int i = 1; i <= rows; ++i){
					List<IntStrPair> tmp=new ArrayList<IntStrPair>();
					int cols = Integer.parseInt(request.getParameter("columns_" + Integer.toString(i)));
					for (int j = 1; j <= cols; ++j){
						int type = Integer.parseInt(request.getParameter("condition_left_" + Integer.toString(i) + "_" + Integer.toString(j)));
						String content = request.getParameter("condition_right_" + Integer.toString(i) + "_" + Integer.toString(j));
						tmp.add(new IntStrPair(type,content));
					}
					query.add(tmp);
				} %>
				<div class="radius-grey-div">
					Condition:<br/>
					<%
						String name[] = new String[]{"author = ", "publisher = ", "title has substring ", "subject has substring "};
						for (int i = 0; i < query.size(); i++){
							if (i > 0){
								out.println("OR<br/>");
							}
							out.println("(");
							for(int j = 0; j < query.get(i).size();j++){
								IntStrPair p = query.get(i).get(j);
								if (j > 0) out.println(" AND ");
								out.println(name[p.x] + "'" + p.str + "'");
							}
							out.println(")<br/>");
						}
					%>
				</div>
				<br/>

			<%	try{
					Connector.start();
					QueryResult rs = new BookBrowsing(query, order_type).query();
					//out.println(rs.getMessage());
					out.println(QueryResultToHtml.transform(rs));
				}catch (Exception e){
					out.println("An Exception occured: " + e.getMessage());
				}finally{
					Connector.close();
				}
			%>
		</div>
	</body>

</html>