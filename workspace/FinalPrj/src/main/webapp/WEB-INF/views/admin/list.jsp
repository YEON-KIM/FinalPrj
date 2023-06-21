<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}" scope="page" />
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>


  <link href="${root}/resources/css/adminPage.css" rel="stylesheet" type="text/css">

  <div class="login-button">
    <c:if test="${not empty loginAdmin }">
      <a class="btn btn-primary">관리자: ${loginAdmin.id}</a>
      <a class="btn btn-primary">담당: ${loginAdmin.manage}</a>
      <button type="button" class="btn btn-outline-primary ms-2">
        <a href="${root}/admin/member/logout">로그아웃</a>
      </button>
    </c:if>
  </div>

</head>


<body>
<div id="admin-header">

  <h1>관리자 페이지</h1>
</div>

<div class="first_container">
  <div class="nav_div">
    <button type="submit" onclick="함수" class="nav_button">회원</button>
  </div>
  <div class="nav_div">
    <button type="submit" onclick="showDreamBoardSearch()" class="nav_button">꿈게시판</button>
  </div>
  <div class="nav_div">
    <button type="submit" onclick="showSearch('chat')" class="nav_button">채팅방</button>
  </div>
  <div class="nav_div">
    <button type="submit" onclick="showSearch('customer_service')" class="nav_button">고객센터</button>
  </div>
  <div class="nav_div">
    <button type="submit" onclick="showSearch('notice')" class="nav_button">공지사항</button>
  </div>
</div>
<div class="search_div">
  <label for="search_input">회원 검색:</label>
  <input type="text" id="search_input">
  <button id="search_button">검색</button>
</div>
<div class="search_div">
  <label for="dream_board_search_input" style="display: none;">꿈게시판 검색:</label>
  <input type="text" id="dream_board_search_input" style="display: none;">
  <button id="dream_board_search_button" style="display: none;">검색</button>
</div>


<h1 style="text-align: center;">-회원 리스트-</h1>
<hr>
<table>
  <thead>
  <tr>
    <th>회원번호</th>
    <th>아이디</th>
    <th>닉네임</th>
    <th>상태</th>
    <th>가입일</th>
    <th>프로필</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${voList}" var="vo">
    <tr>
      <th>${vo.no}</th>
      <th>${vo.id}</th>
      <th>${vo.nick}</th>
      <th>${vo.quit_yn}</th>
      <th>${vo.enroll_date}</th>
      <th><img width="110px" height="110px" alt="프로필이미지" src="${root}/resources/upload/member/${vo.profileName}"></th>
      <th>
        <button onclick='deleteMember(${vo.no});'>회원강퇴</button>
      </th>
    </tr>
  </c:forEach>
  </tbody>
</table>



</body>
<footer><%@ include file="/WEB-INF/views/common/footer.jsp" %></footer>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
  function showDreamBoardSearch() {
    // 회원 검색 요소 숨기기
    document.querySelector('label[for="search_input"]').style.display = "none";
    document.getElementById("search_input").style.display = "none";
    document.getElementById("search_button").style.display = "none";

    // 꿈게시판 검색 요소 보이기
    document.querySelector('label[for="dream_board_search_input"]').style.display = "inline-block";
    document.getElementById("dream_board_search_input").style.display = "inline-block";
    document.getElementById("dream_board_search_button").style.display = "inline-block";
  }


  const tbody = document.querySelector("tbody");
  tbody.addEventListener('mouseover', function(event) {
    event.target.parentNode.style.backgroundColor = "lightgray";
  });

  tbody.addEventListener('mouseout', function(event) {
    event.target.parentNode.style.backgroundColor = "";
  });

  tbody.addEventListener('click', function(event) {
    if (event.target.nodeName === "TH") {
      const no = event.target.parentNode.querySelector("th:first-child").innerText;
      location.href = "${root}/admin/member/one/" + no;
    }
  });

  function deleteMember(no) {
    // 사용자에게 확인 대화상자를 표시하고 선택 결과를 확인합니다.
    var confirmed = confirm('유저를 강퇴하시겠습니까?');

    // 사용자가 확인을 선택한 경우에만 삭제 요청을 보냅니다.
    if (confirmed) {
      $.ajax({
        url: '${root}/admin/member/delete',
        type: 'post',
        data: {no: no},
        success: function(data) {
          console.log(data);
          alert("삭제완료");
          location.reload();
        },
        error: function(error) {
          console.log(error);
        }
      });
    }
  }


</script>

