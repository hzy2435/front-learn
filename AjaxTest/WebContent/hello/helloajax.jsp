<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello Ajax</title>
<script type="text/javascript">
	window.onload = function() {

		document.getElementsByTagName("a")[0].onclick = function() {
			var request = new XMLHttpRequest();
			var url = this.href + '?d=' + new Date();
			var method = 'GET';

			request.open(method, url);
			request.send(null);
			request.onreadystatechange = function() {
				if (request.readyState === 4) {
					if (request.status === 200 || request.status === 304) {
						var response = request.responseText;
						console.info(response);
						document.getElementById("hello").innerHTML = response;
					}
				}
			}

			return false;
		}
	}
</script>
</head>
<body>
	<div id="hello"></div>
	<a href="hello.txt">hello</a>
</body>
</html>