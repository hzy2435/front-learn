<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返回XML数据格式</title>
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
							var result = request.responseXML;
							
							var name = result.getElementsByTagName('name')[0].firstChild.nodeValue;
							var website = result.getElementsByTagName('website')[0].firstChild.nodeValue;
							var email = result.getElementsByTagName('email')[0].firstChild.nodeValue;
							
							var aNode = document.createElement('a');
							aNode.append(document.createTextNode(name));
							aNode.href = 'mailto:' + email;
							
							var h2Node = document.createElement('h2');
							h2Node.append(aNode);
							
							var aNode2 = document.createElement('a');
							aNode2.append(document.createTextNode(website));
							aNode2.href = website;
							
							var detailNode = document.getElementById('info');
							detailNode.innerHTML = "";
							detailNode.append(h2Node);
							detailNode.append(aNode2);
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
		<li><a href="111.xml">111</a></li>
		<li><a href="222.xml">222</a></li>
		<li><a href="333.xml">333</a></li>
	</ul>
	<div id="info"></div>
</body>
</html>