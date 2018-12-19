<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返回Html数据格式</title>

<script type="text/javascript" src="../javascripts/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		$('a').click(function() {
			
			var url = this.href + " h2"; // 可以在后面加上选择器, 以便截取需要的部分
			var args = {'time' : new Date()};
			
			$('#info').load(url, args);
			
			return false;
			
		})
		
	})

</script>
</head>
<body>
	<ul>
		<li><a href="111.html">111</a></li>
		<li><a href="222.html">222</a></li>
		<li><a href="333.html">333</a></li>
	</ul>
	<div id="info"></div>
</body>
</html>