<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>使用 Ajax 实现购物车</title>
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/jquery/javascripts/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	
		/*
		1. 获取所有的a节点, 为其添加 onclick 响应事件, 并取消其默认行为
		2. 获取 url: {a href}, args: {时间戳}
		3. 发送请求
		4. 获取请求响应, 为Json对象, 并将响应内容添加到文本中
		*/
		
		$(function() {
			
			var hasCar = '${ sessionScope.shoppingCar == null}';
			if(hasCar == 'true') {
				
				$('#carInfo').hide();
				
			} else {
				
				$('#carInfo').show();
				
				$('#bookName').text('${sessionScope.shoppingCar.bookName}');
				$('#totalBookNumber').text('${sessionScope.shoppingCar.totalNumber}');
				$('#totalPrice').text('${sessionScope.shoppingCar.totalPrice}');
			}
			
			$('a').click(function() {
				
				$('#carInfo').show();
				
				var url = this.href;
				var args = {'time' : new Date()};
				
				$.getJSON(url, args, function(data) {
					
					var bookName = data.bookName;
					var totalBookNumber = data.totalNumber;
					var totalPrice = data.totalPrice;
					
					$('#bookName').text(bookName);
					$('#totalBookNumber').text(totalBookNumber);
					$('#totalPrice').text(totalPrice);
					
				});
				
				return false;
				
			})
			
		})
	
	</script>
	
</head>
<body>

	<div id="carInfo">
		已将 &nbsp;&nbsp; <span id="bookName"></span> &nbsp;&nbsp; 添加到购物车.
		购物车中有 &nbsp;&nbsp; <span id="totalBookNumber"></span> &nbsp;&nbsp; 本书,
		总价格为  &nbsp;&nbsp; <span id="totalPrice"></span> &nbsp;&nbsp; 元.
	</div>
	<br><br>
	Java &nbsp;&nbsp; <a href="${ pageContext.request.contextPath }/addToCar?bookName=Java&price=120">加入购物车</a>
	<br><br>
	JavaScript &nbsp;&nbsp; <a href="${ pageContext.request.contextPath }/addToCar?bookName=JavaScript&price=150">加入购物车</a>
	<br><br>
	HTML &nbsp;&nbsp; <a href="${ pageContext.request.contextPath }/addToCar?bookName=HTML&price=200">加入购物车</a>

</body>
</html>