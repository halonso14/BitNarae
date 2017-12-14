<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	
	<form action="/member/loginPost" method="post">
		<div>
			<input type="text" name="memberEmail" placeholder="Email을 입력하세요"/>
		</div>
		<div>
			<input type="password" name="memberPassword" placeholder="비밀번호를 입력하세요"/>
		</div>
		<div class="row">
			<div>
				<div>
					<label>
						<input type="checkbox" name="useCookie">Remember Me
					</label>
				</div>
			</div>
			<div>
				<button type="submit">로그인</button>
			</div>
		</div>
	</form>
	
</body>
</html>