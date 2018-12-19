<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返回json数据格式</title>
<script type="text/javascript">
	window.onload = function() {

		var alinks = document.getElementsByTagName('a');

		for (var i = 0; i < alinks.length; i++) {

			alinks[i].onclick = function() {

				var request = new XMLHttpRequest();
				var url = this.href + '?time=' + new Date();
				var method = 'GET';

				request.open(method, url);
				request.send(null);

				request.onreadystatechange = function() {

					if (request.readyState === 4) {

						if (request.status === 200 || request.status === 304) {
							
							var result = request.responseText;
							var person = eval('(' + result + ')');
							
							console.info('result: ' + result);
							console.info(person);
							
							var details = document.getElementById('info');
							var aNode = document.createElement('a');
							aNode.append(document.createTextNode(person.name));
							aNode.href = person.email;

							var h2Node = document.createElement('h2');
							h2Node.append(aNode);

							var aNode2 = document.createElement('a');
							aNode2.append(document
									.createTextNode(person.website));
							aNode2.href = person.website;

							details.innerHTML = '';
							details.append(h2Node);
							details.append(aNode2);

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
		<li><a href="111.json">111</a></li>
		<li><a href="222.json">222</a></li>
		<li><a href="333.json">333</a></li>
	</ul>
	<div id="info"></div>
</body>
</html>