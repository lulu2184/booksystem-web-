<%@ page language="java" import="tools.QueryResultToHtml" %>
<%@ page language="java" import="backend.query.PopBookInSemester" %>
<%@ page language="java" import="backend.query.PopAuthorInSemester" %>
<%@ page language="java" import="backend.query.PopPublisherInSemester" %>
<%@ page language="java" import="backend.query.UsefulUser" %>
<%@ page language="java" import="backend.query.TrustedUser" %>
<%@ page language="java" import="backend.query.QueryResult" %>
<%@ page language="java" import="java.util.Calendar" %>
<%@ page language="java" import="backend.Connector" %>

<html>
	<head>
		<link href="../css/general.css" rel="stylesheet">
		<link href="../css/summary.css" rel="stylesheet">

		<script type="text/javascript">
			function degree_action(){
				var author1 = document.getElementById("degree_form").author1.value;
				var author2 = document.getElementById("degree_form").author2.value;
				if (window.XMLHttpRequest){
					xmlhttp=new XMLHttpRequest();
				}else {
				 	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState==4 && xmlhttp.status==200){
				    	document.getElementById("degree_result").innerHTML=xmlhttp.responseText;
				    }
				}
				xmlhttp.open("GET","handle/author_degree.jsp?author1="+author1+"&author2="+author2,false);
				xmlhttp.send();
			}
		</script>
	</head>

	<body>
		<div>
			<h1>Summary</h1>
		</div>

		<div class="content">
			<%
				Calendar ca = Calendar.getInstance();
				String year = Integer.toString(ca.get(Calendar.YEAR));
				int month = ca.get(Calendar.MONTH);
				String semester;
				if (month <= 6){
					semester = "first";
				}else{
					semester = "second";
				}
				try{
					Connector.start();
					%>
					<div class="half-div">
					<div class="summary-element radius-grey-div">
						<h2>popular books in this semester</h2>
						<%
							QueryResult rs = new PopBookInSemester(year, semester).query();
							out.println(QueryResultToHtml.rktransform(rs));
						%>
					</div>


					<div class="summary-element radius-grey-div">
						<h2>popular authors in this semester</h2>
						<%
							rs = new PopAuthorInSemester(year, semester).query();
							out.println(QueryResultToHtml.rktransform(rs));
						%>
					</div>

					<div class="summary-element radius-grey-div">
						<h2>popular publishers in this semester</h2>
						<%
							rs = new PopPublisherInSemester(year, semester).query();
							out.println(QueryResultToHtml.rktransform(rs));
						%>
					</div>
				</div>
				<div class="half-div">

					<div class="summary-element radius-grey-div">
						<h2>Degree Of Authors</h2>
						<form id="degree_form" action="">
							Author1: <input type="text" method=post name="author1"/> <br/>
							Author2: <input type="text" method=post name="author2"/> <br/>
							<input type="button" onclick="degree_action()" value="query"/>
						</form>
						
						<p id="degree-result-p"><span id="degree_result"></span></p>
					</div>

					<div class="summary-element radius-grey-div">
						<h2>trusted users</h2>
						<%
							rs = new TrustedUser(10).query();
							out.println(QueryResultToHtml.rktransform(rs));
						%>
					</div>

					<div class="summary-element radius-grey-div">
						<h2>useful users</h2>
						<%
							rs = new UsefulUser(10).query();
							out.println(QueryResultToHtml.rktransform(rs));
						%>
					</div>
				</div>

					
				<%
					}catch (Exception e){
		    			out.println("An Exception occured: " + e.getMessage());
					}finally{
						Connector.close();				        
					}
				%>
		<div>
	</body>

</html>