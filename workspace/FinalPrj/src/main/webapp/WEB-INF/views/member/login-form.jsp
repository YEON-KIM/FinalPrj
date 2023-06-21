<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}" scope="page" />
<!doctype html>
<html>
  <head>
      <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Login</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${root}/resources/css/signin.css" rel="stylesheet">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </head>
  <body class="text-center">
  
  


<main class="form-signin w-100 m-auto">
  <form action="${root}/member/login" method="POST" >  
    <img class="mb-4" src="${root}/resources/img/logo.png" alt="" width="300" height="131">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
  <input type="email" class="form-control" id="id" name="id" placeholder="name@example.com">
  <label for="floatingInput">ID</label>
</div>
<div class="form-floating">
  <input type="password" class="form-control" id="password" name="password" placeholder="Password">
  <label for="floatingPassword">PASSWORD</label>
</div>



<div class="checkbox mb-3">
  <label>
    <input type="checkbox" name="remember-me" value="1"> 아이디 저장
  </label>
</div>
<button class="w-100 btn btn-lg btn-primary login" type="submit" onclick="loginFail()">로그인</button>



  </form>
</main>


<script>
    function loginFail() {
        var alertMsg = document.getElementById("alertMsg").value;
        if (alertMsg !== "") {
            alert(alertMsg);
        }
    }
</script>



  </body>
</html>




