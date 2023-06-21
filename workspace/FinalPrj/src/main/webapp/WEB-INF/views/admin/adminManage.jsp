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
      <a href="${root}/home">메인으로</a>
    </c:if>
  </div>

</head>


<body>
<div id="admin-header">

  <h1>관리자 페이지</h1>
  </div>

  <div class="first_container">
    <div class="nav_div">
      <button onclick="location.href='${root}/admin/member/list'" class="nav_button">회원조회</button>
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
	</div>
<hr>
<div class="container">
  <div class="info_div">하나</div>
  <div class="info_div">둘</div>
  <div class="info_div">셋</div>
  <div class="info_div">야</div>
</div>
	
	
	


</body>
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>

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
},
  error: function(error) {
  console.log(error);
}
});
}
}


</script>

  