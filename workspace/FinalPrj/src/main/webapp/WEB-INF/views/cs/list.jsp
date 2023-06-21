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
  <title>고객센터</title>
  <%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="${root}/resources/css/cs-list.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="title">고객센터</div>



<c:if test="${not empty loginMember}">
				<div id="write-button">
					<a class="btn btn-primary" href="${root}/cs/write">작성하기</a>
				</div>
</c:if>

<table class="tb">
  <thead>
    <tr class="tr">
      <th class="th">글번호</th>
      <th class="th">제목</th>
      <th class="th">글쓴이</th>
      <th class="th">작성일</th>
    </tr>
  </thead>
  <tbody>
<c:forEach items="${csVoList}" var="cvo">
  <tr class="tr">
    <td class="th">${cvo.no}</td>
    <td class="th">${cvo.title}</td>
    <td class="th">${cvo.writer}</td>
    <td class="th">
      <script>
        var enrollDate = "${cvo.enrollDate}";
        var formattedDate = enrollDate.substring(0, 16);
        document.write(formattedDate);
      </script>
    </td>
  </tr>
</c:forEach>

  </tbody>
</table>


<div>
  <form action="${root}/board/list" method="get">
    <div id="search-area">
      <select name="searchType">
        <option value="title">제목</option>
        <option value="content">내용</option>
        <option value="writer">글쓴이</option>
      </select>
      <input type="text" name="searchValue" value="${searchMap.searchValue}" placeholder="찾기">
      <input type="submit" value="검색하기">
    </div>
  </form>
</div>
  
  
  
  
  
<%--   <div id="page-area">
    <c:if test="${pv.currentPage > 1}">
      <a href="${root}/board/list?page=${pv.currentPage-1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}" class="btn btn-secondary btn-sm">이전</a>
    </c:if>
    <c:forEach begin="${pv.startPage}" end="${pv.endPage}" step="1" var="i">
      <a href="${root}/board/list?page=${i}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}" class="btn btn-secondary btn-sm">${i}</a>
    </c:forEach>
    <c:if test="${pv.currentPage < pv.maxPage}">
      <a href="${root}/board/list?page=${pv.currentPage+1}&searchType=${searchMap.searchType}&searchValue=${searchMap.searchValue}" class="btn btn-secondary btn-sm">다음</a>
    </c:if>
  </div> --%>





 
</body>
<footer><%@ include file="/WEB-INF/views/common/footer.jsp" %></footer>  
</html>


<script>
	const tbody = document.querySelector('main > table > tbody');
	tbody.addEventListener

</script>

