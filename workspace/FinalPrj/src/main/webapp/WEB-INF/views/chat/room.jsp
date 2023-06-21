<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>웹소켓으로 채팅</title>
            <link rel="stylesheet" href="/app/resources/css/chat/room.css">
        </head>

        <body>
            <main>

                <button type="button" onclick="loadChatMessage();">채팅 불러오기</button>


                <div id="wrapper" class="chat-wrapper">
                    <c:forEach items="${chatMessages}" var="message">
                        <div class="chatMessage">
                            <div class="${message.sender eq loginMember.nick ? 'myNick-area' : 'anotherNick-area'}">
                                ${message.sender}
                            </div>
                            <div class="${message.sender eq loginMember.nick ? 'myMsg-area' : 'anotherMsg-area'}">
                                ${message.msg}
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <footer>
                    <form onsubmit="event.preventDefault(); sendMsg();">
                        <input type="text" name="msg">
                        <input type="submit" value="전송">
                    </form>
                </footer>
            </main>

            <script>
                const socket = new WebSocket("ws://127.0.0.1:8888/app/server");

                socket.onopen = function () {
                    console.log("웹소켓 연결됨 !!!");
                }
                socket.onclose = function () {
                    console.log("웹소켓 끊김 ...");
                }
                socket.onerror = function () {
                    console.log("웹소켓 연결 실패 ...");
                }

                socket.onmessage = function (event) {
                    const receivedMsg = event.data;

                    const separatorIndex = receivedMsg.indexOf("<br>");
                    const sender = receivedMsg.substring(0, separatorIndex);
                    const msg = receivedMsg.substring(separatorIndex + 4);

                    const messageContainer = document.createElement("div");
                    messageContainer.className = sender === "${loginMember.nick}" ? "myMsg-area" : "anotherMsg-area";

                    const messageContent = document.createElement("span");
                    messageContent.innerHTML = msg;

                    const nickContainer = document.createElement("div");
                    nickContainer.className = sender === "${loginMember.nick}" ? "myNick-area" : "anotherNick-area";
                    nickContainer.innerHTML = sender;

                    const chatArea = document.getElementById("wrapper");
                    chatArea.appendChild(nickContainer);
                    chatArea.appendChild(messageContainer);
                    messageContainer.appendChild(messageContent);

                    // 스크롤을 맨 아래로 이동
                    chatArea.scrollTop = chatArea.scrollHeight;
                };

                function sendMsg() {
                    const msgInput = document.querySelector("input[name=msg]");
                    const msg = msgInput.value.trim();

                    if (msg !== "") {
                        socket.send(msg);
                        msgInput.value = "";
                    }
                }

                function loadChatMessage() {
                    const commentArea = document.querySelector('#comment-area');
                    commentArea.innerHTML = '';
                    const writerNo = '${loginMember.no}';

                    let ChatVo = '${chatVo}';

                    $.ajax({
                        url: '${root}/chat/load',
                        type: 'get',
                        success: function (data) {
                            console.log(data);

                            for (let ChatVo of data) {
                                let str = " <div class=\"chatMessage\">";
                                str += "<div class=\"" + Nick() + "\">";
                                str += ChatVo.sender;
                                str += "</div>"

                                str += "<div class=\"" + Msg() + "\">";
                                str += ChatVo.message;
                                str += "</div>"
                                str += "</div>"
                            }
                        },
                        error: function (error) {
                            console.log(error);
                        },
                    });
                }

                function Nick() {
                    let Nick = "${message.sender eq loginMember.nick ? 'myNick-area' : 'anotherNick-area'}";
                    return Nick;
                }

                function Msg() {
                    let Msg = "${message.sender eq loginMember.nick ? 'myMsg-area' : 'anotherMsg-area'}";
                    return Msg;
                }
            </script>
        </body>
        </html>