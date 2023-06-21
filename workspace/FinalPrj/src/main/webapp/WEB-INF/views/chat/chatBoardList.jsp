<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#page-area{
	width:300px;
	margin: auto;
	margin-top: 30px;
	display: flex;
	justify-content: space-evenly;
}

</style>
</head>
<body>
	
	<div id="wrap">
		
		<%@include file="/WEB-INF/views/common/header.jsp" %>
		
		<main>
			<h1 align="center" id="ListTitle">채팅 게시판 목록</h1>
			<!-- 로그인 한 사람만 글쓰기 가능 -->
			<%-- <c:if test="${loginMember.id empty}">
			</c:if> --%>
				
			
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일시</th>
						<th>조회수</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${cvoList }" var="cvo">
						<tr id="oneBoard">
							<td>${cvo.no}</td>
							<td>${cvo.title}</td>
							<td>${cvo.nick}</td>
							<td>${cvo.enrollDate}</td>
							<td>${cvo.hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<c:if test="${loginMember != null }">
				<div id="write-btn-area">
					<a class="btn btn-primary" href="${root}/chat/write">글쓰기</a>
				</div>
			</c:if>
			
			<div id="page-area">
				<c:if test="${pv.currentPage > 1 }">
				<a class="btn btn-primary btn-sm" href="${root }/chat/list?page=${pv.currentPage-1}">이전</a>
				</c:if>
				
				<c:forEach begin="${pv.startPage }" end="${pv.endPage }" step="1" var="i">
					<c:if test="${pv.currentPage != i }">
						<a class="btn btn-primary btn-sm" href="${root }/chat/list?page=${i}">${i}</a>
					</c:if>
					<c:if test="${pv.currentPage == i }">
						<a class="btn btn-secondary btn-sm">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pv.currentPage < pv.maxPage}">
				<a class="btn btn-primary btn-sm" href="${root }/chat/list?page=${pv.currentPage + 1}">다음</a>
				</c:if>
			</div>
	
		</main>
	
	</div>
	
	<footer><%@ include file="/WEB-INF/views/common/footer.jsp" %></footer>
	
</body>
</html>
	

<link rel="stylesheet" href="${root}/resources/css/chat/list.css">

<script>
	const table = document.querySelector("main table tbody");
	table.addEventListener("click" , (event)=>{
		const num = event.target.parentNode.children[0].innerText
		location.href = '${root}/chat/detail?num=' + num;
	});
</script>