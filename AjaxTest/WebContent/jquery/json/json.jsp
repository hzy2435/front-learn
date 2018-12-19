<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返回json数据格式</title>

<script type="text/javascript" src="../javascripts/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		$('a').click(function() {
			
			var url = this.href;
			var args = {'time': new Date()};
			
			$.getJSON(url, args, function(data) {
				
				var name = data.name;
				var email = data.email;
				var website = data.website;
				
				$('#info').empty().append('<h2><a href="mailto:' + email + '">' + name + '</a></h2>')
								  .append('<a href="' + website + '">' + website + '</a>');
				
			});
			
			return false;
			
		});
		
	})
	
</script>
</head>
<body>
	<ul>
		<li><a href="111.json">111</a></li>
		<li><a href="222.json">222</a></li>
		<li><a href="333.json">333</a></li>
	</ul>
	<div id="info"></div>
</body>
</html>