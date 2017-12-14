<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="" method="post">
	
	<label for="scrapID">scrapID</label> <!-- auto increase -->
	<input type="text" name="scrapID"/><br>
	<label for="memberID">memberID</label> <!-- session °ª -->
	<input type="text" name="memberID"/><br>
	<label for="codeID">codeID</label> <!-- contents table -->
	<input type="text" name="codeID"/><br> 
	<label for="contentsID">contentsID</label>
	<input type="text" name="contentsID"/><br>
	<label for="contentsTitle">contentsTitle</label>
	<input type="text" name="contentsTitle"/><br>
	<label for="contentsPhoto">contentsPhoto</label>
	<input type="text" name="contentsPhoto"/><br>
	
	<button type="submit">submit</button>
	</form>
</body>
</html>
