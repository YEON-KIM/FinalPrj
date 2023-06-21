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
<link href="${root}/resources/css/cs-write.css" rel="stylesheet" type="text/css">
</head>
<body>

  <div id="header">고객센터</div>

<div id="wrap">
  
  <form action="${root}/cs/write" method="POST" enctype="multipart/form-data">
    <div id="main-div">
      <tr class="head-tr">
        <label class="label">제목</label>
        <input type="text" name="title" class="head-input">
        <hr></hr>
        <label class="category">주제</label>
        <select name="category" class="category-input">
          <option>없음</option>
          <option value="10">꿈일기</option>
          <option value="20">쇼핑</option>
          <option value="30">유저신고</option>
          <option value="40">채팅</option>
          <option value="50">기타</option>
        </select>
      </tr>
    </div>
    <hr></hr>
    <div id="sec-div">
      <tr class="head-tr">
        <label class="label">내용</label>
        <br>
        <textarea name="content"></textarea>
      </tr>
    </div>
    <div id="thi-div">
      <tr class="head-tr">
<!--         <div>
          <label class="label" for="thumbnail-tag">사진</label>
          <input id="thumbnail-tag" type="file" name="f" multiple accept=".jpg,.png,.jpeg">
        </div> -->
        <div id="thumbnail-area"></div>
        <hr></hr>
        <input id="write-button" type="submit" value="작성하기">
      </tr>
    </div>
  </form>

</div>





 
</body>
<footer><%@ include file="/WEB-INF/views/common/footer.jsp" %></footer>  
</html>


