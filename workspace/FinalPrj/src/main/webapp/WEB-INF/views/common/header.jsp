<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}" scope="page" />
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${root}/resources/css/common/H.F.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>header</title>

    </head>

        <main class="main-back">
            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                <symbol id="bootstrap" viewBox="0 0 118 94">
                    <title>Bootstrap</title>
                    <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z">
                    </path>
                </symbol>
            </svg>

            <!-- Header -->
            <div class="container">
                <header
                    class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3">
        <!-- 에러 날 수도 있음 -->
                    <a href="/app/home" class="d-flex align-items-center col-md-2 mb-2 mb-md-0 text-dark text-decoration-none">

                        <svg class="bi me-2" width="200%" height="100%" role="img">
                            <image href="${root}/resources/img/logo.png"></image>
                        </svg>
                    </a>

                    <nav class="navbar navbar-expand-lg navbar_header">
                        <div class="container-fluid">
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarsExample10" aria-controls="navbarsExample10" aria-expanded="false"
                                aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link a-color-white" aria-current="page"
                                            href="${root }/board/blist">ADD DREAM</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link a-color-white " aria-current="page"
                                            href="${root}/product/list">STORE</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link a-color-white" href="${root}/chat/list">CHAT</a>
                                    </li>

                                    <li class="nav-item">

                                        <a class="nav-link a-color-white" href="${root}/cs/list">CUSTOMER SERVICE</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>

                    <div class="col-md-3 text-end">
                       

                        <c:if test="${loginMember == null && loginAdmin == null }">
                            <button type="button" class="btn btn-outline-dark me-2" onclick="location.href='${root}/member/login'">로그인</button>
                            <button type="button" class="btn btn-outline-dark" onclick="location.href='${root}/member/join'">회원가입</button>
                        </c:if>
                        
						<c:if test="${not empty loginMember }">
						    <button onclick="location.href='${root}/member/edit'" class="btn btn-primary">${loginMember.nick}님 환영합니다.</button>
						    <img width = "80px" height="80px" src="${root}/resources/upload/member/${loginMember.profileName}" alt="프로필 이미지">
                            <button type="button" class="btn btn-outline-primary ms-2">
						        <a href="${root}/member/logout">로그아웃</a>
						    </button>
                        </c:if>
						
                        <c:if test="${not empty loginAdmin }">
                            ${loginAdmin.manage}님 환영합니다.
                            <button type="button" class="btn btn-outline-primary ms-2">
                                <a href="${root}/admin/member/logout">로그아웃</a>
                              </button>
                        </c:if>
                        
                    </div>


        </main>
 



    </html>
