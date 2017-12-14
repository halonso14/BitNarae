<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Header</title>
    
    <style type="text/css">
        #wrap{
            text-align: center;
            width: 800px;
            height: 150px;
        }
    </style>
    
    <script type="text/javascript">
        
        function changeView(value){
            
            if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
            {
                location.href="/";
            }
            else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
            {
                location.href="member/login";
            }
            else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
            {
                location.href="member/register";
            }
            else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
            {
                location.href="member/logout";
            }
            else if(value == "4") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
            {
                location.href="member/mypage";
            }
        }
    </script>
    
</head>
<body>
    <div id = "wrap">
        <p>
            <button id="homeBtn" onclick="changeView(0)">HOME</button>
        <%
            // 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
            if(session.getAttribute("login")==null){ 
        %>
            <button id="loginBtn" onclick="changeView(1)">로그인</button>
            <button id="joinBtn" onclick="changeView(2)">회원가입</button>
            
        <%
            // 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
            }else{ 
        %>
            <button id="logoutBtn" onclick="changeView(3)">로그아웃</button>
            <button id="updateBtn" onclick="changeView(4)">내정보</button>
        <%  }  %>    
 
        </p>
    </div>
</body>
</html>
