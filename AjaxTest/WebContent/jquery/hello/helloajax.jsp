<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Ajax</title>

<script type="text/javascript" src="../javascripts/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		
		$('a').click(function() {
			
			var url = this.href;
			var args = {'time' : new Date()};
			$('#hello').load(url, args);
			
			return false;
		})
		
	})
	
</script>
</head>
<body>
	<div id="hello"></div>
	<a href="hello.txt">hello</a>
</body>
</html>