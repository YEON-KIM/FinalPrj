<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#area {
				display: flex;
				height: 400px
			}

			#chat-area {
				width: 600px;
				margin: auto;
				display: grid;
				grid-template-columns: repeat(2, 100px 200px);
				grid-template-rows: 30px 30px 300px;
				height: 100%;

			}

			.load_chat {
				border: 1px solid blueviolet;
				text-align: center;
				width: 400px;
				height: 100%;

				margin-right: 150px;
				top: 0;
				overflow-y: scroll;

			}

			#chat-area>div:not (:nth-child(2), :last-child) {
				text-align: center;
			}

			#chat-area>div:nth-child(2),
			#chat-area>div:last-child {
				grid-column: span 3;
			}

			#chat-area>div {
				border: 1px solid blueviolet;
			}



			#chat-area input,
			#chat-area textarea {
				width: 100%;
				height: 100%;
				resize: none;
			}

			.view-area {
				display: none;
			}

			.form-area {
				display: none;
			}

			.active {
				display: block;
			}
			.chatmessege > div {
				text-align: right;
			}
		</style>
	</head>

	<body>

		<div id="wrap">

			<%@include file="/WEB-INF/views/common/header.jsp" %>

				<main>

					<h1 align="center">채팅 게시글 상세조회</h1>

					<div class="view-area active">
						<div id="area">
							<div id="chat-area">
								<div>제목</div>
								<div>${vo.title}</div>
								<div>작성일자</div>
								<div>${vo.enrollDate}</div>
								<div>조회수</div>
								<div>${vo.hit}</div>
								<div>내용</div>
								<div>${vo.content}</div>

							</div>

							<div class="load_chat">
								<div>
									<h1>지난 채팅내용</h1>
								</div>
								<c:forEach items="${chatVo}" var="message">
									<div class="chatMessage">
										<div
											class="${message.sender eq loginMember.nick ? 'myNick-area' : 'anotherNick-area'}">
											<strong>${message.sender}</strong> : ${message.message}
										</div>
										
									</div>
								</c:forEach>
							</div>
						</div>



						<div align="center">
							<div class="text-center" style="width: 600px">
								<c:if test="${loginMember.id != null}">
									<div id="chat-btn-area">
										<button class="btn btn-warning btn-sm" onclick="toggleActive();">수정하기</button>
										<button class="btn btn-danger btn-sm"
											onclick="location.href='${root}/chat/delete?num=${vo.no}'">삭제하기</button>
									</div>
								</c:if>
								<button class="btn btn-primary btn-sm" onclick="openChatRoom()">채팅하러
									가기</button>
							</div>
						</div>
					</div>



					<div class="form-area">
						<form action="${root}/chat/edit" method="POST">
							<input type="hidden" name="no" value="${vo.no}">
							<div id="chat-area">
								<div>제목</div>
								<div>
									<input type="text" name="title" value="${vo.title}">
								</div>
								<div>작성일자</div>
								<div>${vo.enrollDate}</div>
								<div>조회수</div>
								<div>${vo.hit}</div>
								<div>내용</div>
								<div>
									<textarea name="content">${vo.content}</textarea>
								</div>
							</div>
							<input type="submit" value="수정하기">
						</form>
					</div>



				</main>

		</div>

		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</footer>

	</body>

	</html>












	<script>

		//수정하기 버튼 클릭 시 동작하는 내용
		function toggleActive() {
			const viewArea = document.querySelector(".view-area");
			const formArea = document.querySelector(".form-area");

			viewArea.classList.remove('active');
			formArea.classList.add('active');
		}

		//새 창 열기
		function openChatRoom() {
			var chatWindow = window.open('${root}/chat/room', 'Chat Room', 'width=800, height=600');
			// 창의 크기와 속성을 설정합니다.
		}
	</script>