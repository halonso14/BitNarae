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

<h1>회원정보 수정</h1>

	<form name="form" action="updateMember" method="post">
		<div>
			이메일<input type="text" name="memberEmail" id="memberEmail" value="${memberVO.memberEmail}" readonly="readonly"/>
		</div>
		
		<div>
			비밀번호<input type="password" name="memberPassword" id="memberPassword" placeholder="비밀번호를 입력하세요"/>
		</div>
		<div>
			비밀번호확인<input type="password" name="memberPasswordChk" id="memberPasswordChk" placeholder="다시 입력하라고"/>
		</div>
		<div>
			닉네임<input type="text" name="memberName" id="memberName" value="${memberVO.memberName}"/>
		</div>
		<div>
			생년월일<input type="date" name="memberBirthday" id="memberBirthday" value="<fmt:formatDate value="${memberVO.memberBirthday}" pattern="yyyy-MM-dd" />"/>
		</div>
		
		<div class="row">
			<div>
				<button type="submit">회원정보 수정</button>
			</div>
		</div>
	</form>

</body>
</html>