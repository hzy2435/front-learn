<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返回XML数据格式</title>

<script type="text/javascript" src="../javascripts/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		$('a').click(function() {
			
			var url = this.href;
			var args = {'time': new Date()};
			
			$.get(url, args, function(data) {
				
				var name = $(data).find('name').text();
				var email = $(data).find('email').text();
				var website = $(data).find('website').text();
				
				$('#info').empty().append('<h2><a href="mailto:' + email + '">' + name + '</a><h2>')
								 .append('<a href="' + website + '">' + website + '</a>');
				
			});
			
			return false;
			
		});
		
	})
	
</script>
</head>
<body>
	<ul>
		<li><a href="111.xml">111</a></li>
		<li><a href="222.xml">222</a></li>
		<li><a href="333.xml">333</a></li>
	</ul>
	<div id="info"></div>
</body>
</html>