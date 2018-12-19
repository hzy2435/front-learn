<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返回Html数据格式</title>
<script type="text/javascript">

	window.onload = function() {

		var aNodes = document.getElementsByTagName('a');
		for (var i = 0; i < aNodes.length; i++) {
			
			aNodes[i].onclick = function() {
				
				var request = new XMLHttpRequest();
				var url = this.href + "?time=" + new Date();
				var method = 'GET';

				request.open(method, url);
				request.send(null);
				request.onreadystatechange = function() {

					if (request.readyState === 4) {
						if (request.status === 200 || request.status === 304) {
							var txt = request.responseText;
							document.getElementById('info').innerHTML = txt;
						}
					}

				}

				return false;
			}
		}

	}
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