<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>使用 Ajax 验证用户名是否存在</title>
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/jquery/javascripts/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	
		$(function() {
			
			$(':input[name="userName"]').change(function() {
				
				var val = $(this).val();
				val = $.trim(val);
				
				if(val != '') {
					
					var url = '${pageContext.request.contextPath}/validateUserName';
					var args = {'userName' : val, 'time' : new Date()};
					$.post(url, args, function(data) {
						
						$('#message').html(data);
						
					});
					
				}
				
			});
			
		})
	
	</script>
	
</head>
<body>

	<form action="" method="post">
		<input type="text" name="userName">
		<br>
		<div id="message"></div>
		<br>
		<input type="submit" value="提交">
	</form>

</body>
</html>