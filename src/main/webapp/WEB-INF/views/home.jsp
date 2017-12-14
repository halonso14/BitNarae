<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="common/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tripster</title>
</head>
<body>
	<h1>메인 페이지</h1>
	
	<p> ${serverTime}</p>
	
<script>
	var result = '${msg}';
	
	if(result == 'success'){
		alert("회원가입이 완료되었습니다.");
	}
	
	if(result == 'delete'){
		alert("개인정보 중국에 판매완료!.");
	}
</script>


</body>
</html>