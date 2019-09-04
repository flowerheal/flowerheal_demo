<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="${pageContext.request.contextPath }/webjars/bootstrap/4.3.1/css/bootstrap.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/webjars/jquery/3.4.1/dist/jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/webjars/bootstrap/4.3.1/js/bootstrap.js"></script>
<style>
body {
	margin: 20px;
	padding: 20px;
	line-height: 1;
	font-family: "Open Sans", sans-serif;
	font-size: 1em;
	background: #555;
	color: #000;
}

ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

li {
	margin-top: 20px;
}

.title {
	margin: 0;
	padding: 0;
	font-size: 1.5em;
	font-weight: 300;
}

.container {
	margin-top: 35px;
}
</style>
<script>
	$(function() {
		$("li").css({
			"background-color" : "#666"
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<h1 class="title">basic :: jQuery node access</h1>
	<div class="container">
		<ul id="tutorial">
			<li class="html">HTML</li>
			<li class="css">CSS</li>
			<li class="css3">CSS3</li>
			<li class="javascript">JavaScript</li>
			<li class="jquery">jQuery</li>
			<li class="blank"></li>
		</ul>
		<p id="portfolio">portfolio</p>
	</div>
</body>
</html>