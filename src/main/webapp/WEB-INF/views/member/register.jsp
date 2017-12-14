<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="../../../resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../../../resources/js/additional-methods.min.js"></script>
<script type="text/javascript" src="../../../resources/js/messages_ko.min.js"></script>

<title>회원가입</title>
</head>
<body>

	<h1>회원가입</h1>

	<form id="form" action="registerPost" method="post">
		<div>
			이메일<input type="text" name="memberEmail" id="memberEmail" placeholder="Email을 입력하세요"/>
		</div>
		<!-- <div>
			<button type="button" id="repeatChk">중복확인</button>
		</div> -->
		<div>
			비밀번호<input type="password" name="memberPassword" id="memberPassword" placeholder="비밀번호를 입력하세요"/>
		</div>
		<div>
			비밀번호확인<input type="password" name="memberPasswordChk" id="memberPasswordChk" placeholder="다시 입력하라고"/>
		</div>
		<div>
			닉네임<input type="text" name="memberName" id="memberName" placeholder="닉네임넣어라"/>
		</div>
		<div>
			생년월일<input type="date" name="memberBirthday" id="memberBirthday"/>
		</div>
		
		<div class="row">
			<div>
				<button type="submit">회원가입</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
	
	/* $(document).on('click','#repeatChk',function(){
		var memberEmail = $('#memberEmail').val()
	    $.ajax({
	        url:'/member/repeatChk',
	        type:'POST',
	        data: {'memberEmail' : memberEmail},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        dataType : "json",

	        success:function(data){
	            console.log("success")
	            alert(decodeURIComponent(data.msg))


	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){

	        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
	        	}
	    });
	}); */
	
	$(function(){
        $("form").validate({
            
            //규칙
            rules: {
            	memberEmail: {
                    required : true,
                    minlength : 2,
                    email : true,
                    remote : "/member/repeatChk"
                },
                memberPassword: {
                    required : true,
                    minlength : 4
                },
                memberPasswordChk: {
                    required : true,
                    minlength : 4,
                    equalTo : memberPassword
                },
                memberName: {
                    required : true,
                    minlength : 2
                },
                memberBirthday: {
                	required : true
                }
                
            },
            //규칙체크 실패시 출력될 메시지
            messages : {
            	memberEmail: {
                    required : "이메일을 입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    email : "올바른 이메일 형식이 아닙니다.",
                    remote : "중복된 이메일입니다."
                },
                memberPassword: {
                    required : "비밀번호를 입력하세요.",
                    minlength : "최소 {0}글자이상이어야 합니다"
                },
                memberPasswordChk: {
                    required : "비밀번호를 다시 입력하세요.",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    equalTo : "비밀번호가 일치하지 않습니다."
                },
                memberName: {
                    required : "닉네임을 입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다"
                },
                memberBirthday: {
                	required : "생년월일을 입력하세요."
                }
                
            }
        });
})

	</script>
	
</body>
</html>