<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>My Page</h1>
    	<div>
    		이메일 : ${memberVO.memberEmail}
    	</div>
    	<div>
    		닉네임 : ${memberVO.memberName}
    	</div>
    	<div>
    		생일 : <fmt:formatDate value="${memberVO.memberBirthday}" pattern="yyyy-MM-dd" />
    	</div>
    	
    	<div>
    		<form action="/member/updateMember" method="get">
    			<button id="modifyBtn">회원정보 수정</button>
    		</form>
    		
    		<form action="/member/dropMember" method="post">
            	<button type="submit" id="dropBtn">회원 탈퇴</button>
    		</form>
    	</div>
    	
    	
    <script>
	var result = '${msg}';
	
	if(result == 'success'){
		alert("회원정보 수정이 완료되었습니다.");
	}
	</script>

</body>
</html>
