<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
    <img id="sidearea" class="menu-icon" src="${root}/resources/img/134216_menu_lines_hamburger_icon.png" alt="이미지">
    <br>
    <div id="sidebar">
          <h2>My Page</h2>
        <hr>
          <ul>
            <li><h5>닉네임</h5></li>
            <li>${loginMember.nick}</li><br>
            <li><h5>이메일(아이디)</h5></li>
            <li>${loginMember.id}</li><br>
            <li><h5>나의 최근 꿈일기</h5></li>
            <li>'writer'검색으로 꿈일기 리스트</li><br>
            <li><h5>나의 최근 문의사항</h5></li>
            <li>'writer'검색으로 고객센터 문의 리스트</li><br>
            <li><h5>Store 결제 목록</h5></li>
            <li><a href="${root}/payList/${loginMember.no}">결제 내역</a></li><br>
            <li><h5>일기장이 사라집니다.</h5></li>
            <li><h5>신중하게 결정해주세요</h5></li>
            <li><a href="/member/quit">탈퇴버튼</a></li>
            
          </ul>
        </div>
        <script>
          const sidebar = document.getElementById('sidebar');
          const sidearea = document.getElementById('sidearea');

          sidearea.addEventListener('mouseover', () => {
            sidebar.classList.add('active');
          });
          sidebar.addEventListener('mouseleave', () => {
            sidebar.classList.remove('active');
          });

        </script>
</body>
</html>
<style>
#sidebar {
  background-color: #f1f1f1;
  width: 300px;
  height: 800px;
  position: absolute;
  left: -320px;
  transition: left 0.6s;
  text-align: center;
  padding-top: 1%;
}
#sidebar.active {
  left: 0;
}
#sidebar ul {
  list-style-type: none;
  margin: 0;
  padding: 0%;
}
#sidebar ul li {
  margin: 10px 0;
}
#sidebar ul li a {
  display: block;
  color: #333;
  text-decoration: none;
  font-size: 16px;
  font-weight: bold;
}
#sidebar ul li a:hover {
  color: #fff;
  background-color: #333;
}
.menu-icon{
  margin-top: 30px;
  margin-left: 20px;
  width: 40px;
  height: 40px;
  cursor: pointer;
}
.admin{
    font-size: 24px;
    text-align: center;
    margin-top: 0.83em;
    margin-bottom: 0.83em;
    font-weight: bold;
}
</style>