<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#write-form-area{
		width: 600px;
		height: 600px;
		margin: auto;
		display: grid;
		grid-template-columns: 3fr 7fr;
		grid-template-rows: 1fr 9fr;
		place-items: center center;
	}

	#write-form-area > input:last-child{
		grid-column: span 2;
	}

	#write-form-area input ,
	 #write-form-area textarea{
		width: 100%;
		height: 100%;
	}

</style>
</head>
<body>

	<div id="wrap">
		<%@include  file="/WEB-INF/views/common/header.jsp"%>
		
			<main>
				<h1 align="center">채팅 게시판 작성하기</h1>
			</main>

		<form  action="${root}/chat/write" method="POST">
			<div id="write-form-area">
				<span>제목</span>
				<input type="text" name="title" placeholder="제목을 입력하세요">
				<span>내용</span>
				<input type="hidden" name="writer">
				<textarea name="content"></textarea>
				<input type="submit" value="작성하기">				
			</div>
		</form>

	</div>

</body>
</html>