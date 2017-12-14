<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="/resources/js/handlebars-v4.0.10.js"></script>
	<title>title</title>
</head>

<body>
	<h2>Ajax Test Page</h2>
	<script>
   var files=${json};

</script>
	<!-- 
<script src="/resources/js/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		detail();
	};

        $.ajax({
            type:'get',
            url:"/restaurants/restaurantDetail/1",
            data : JSON.stringify({
                restaurantID : restaurantID,
                restaurantTitle : restaurantTitle
            }),
            success: function(result) {
                alert('success');
            }
        });
</script>
 -->
</body>
</html>