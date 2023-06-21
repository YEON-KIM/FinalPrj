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
  <title>마이페이지</title>
  <%@ include file="/WEB-INF/views/common/header.jsp" %>
  <link href="${root}/resources/css/memberEdit.css" rel="stylesheet" type="text/css">

</head>

<body>
  <main >  
  <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
  <div class="header_member_div">
    <h1 class="header_member_edit">마이페이지</h1>
  </div>
    <div style="width: 1000px; margin: auto;" >
      <hr>
      <form action="${root}/member/edit" method="POST" class="edit_form">
        <input type="hidden" name="no" value="${loginMember.no}">

        <div class="edit_input_div"><input type="text" class="edit_input" name="nick" placeholder="닉네임" required oninput="validateNickname(this)">
          <a>한글 두 글자 혹은 영문 네 글자</a>
          <input type="button" value="중복확인" onclick="checkNick();"></div>
            
		
        <div class="edit_input_div"><input type="password" name="password" placeholder="비밀번호" id="password"
            class="edit_input" required><a>영, 숫자 포함 8자리 이상</a></div>
        <div class="edit_input_div"><input type="password" name="password2" placeholder="비밀번호 확인" id="password-confirm"
            class="edit_input" required>
          <a id="password-mismatch" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</a></div>
        <hr>

        <label class="input-label">주소</label>
        <div class="edit_input_div">
          <input type="text" class="edit_input" id="address_kakao" name="address" readonly required>
          <button id="address_kakao_button" name="address_button" readonly>주소찾기</button>
        </div>


        <div class="edit_input_div">
          <input type="text" class="edit_input" name="address" id="address_kakao_detail" placeholder="상세주소를 입력해주세요.">
        </div>

        <hr>

        <label class="input-label">생일</label>
        <div class="edit_input_div">


          <br>



          <select id="birthdateMonth" name="jumin" class="edit_select" required>
            <option value="N">선택안함</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>




          </select>


          <select id="birthdateDay" name="jumin" class="edit_select" required>
            <option value="N">선택안함</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>



          </select>
        </div>




        <label class="input-label">성별</label>
        <div class="edit_input_div">

          <select class="edit_select" name="gender" required>
            <option value="N">선택안함</option>
            <option value="M">남자</option>
            <option value="F">여자</option>
          </select>
        </div>




        <label class="input-label">자기소개</label>
        <div class="edit_input_div">
          <textarea class="edit_textarea" name="pr" placeholder="자신을 소개하는 문구를 남겨보세요 :)"></textarea>
        </div>

        <div class="edit_input_div">
          <input type="submit" value="변경사항 저장하기">
        </div>
      </form>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    // 닉네임 형식 제한

    let isNickFormOk = false;

    function validateNickname(input) {
      const nickname = input.value.trim();
      const koreanRegex = /^[가-힣]{2,}$/;
      const englishRegex = /^[a-zA-Z]{4,}$/;

      if (!koreanRegex.test(nickname) && !englishRegex.test(nickname)) {
        input.setCustomValidity('닉네임은 한글 2글자 이상 또는 영어 4글자 이상이어야 합니다.');
        input.classList.add('is-invalid');
        isNickFormOk = false;
        return;
      } else {
        input.setCustomValidity('');
        input.classList.remove('is-invalid');
        isNickFormOk = true;
      }
    }
    // 닉네임 중복검사
    function checkNick() {

      const nick = document.querySelector(".edit_input[name=nick]").value;



      if(nick === ''){
        alert("닉네임을 입력해주세요.")

        document.querySelector(".edit_input[name=nick]").focus();
        return;
      }

      if(!isNickFormOk){
        alert("닉네임 형식에 맞게 입력하세요.");
        return false;
      }

      $.ajax({
        url: '/app/member/nick-check',
        type: 'POST',
        data: {
          'nick': nick
        },
        success: function (data) {
          if (data == 'notDup') {
            alert("사용 가능한 닉네임입니다.");
          }
          else {
            alert("이미 사용중인 닉네임입니다.");
          }
        },
        error: function (e) {
          console.log(e);
        },
      });
    }




    //비밀번호 확인
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('password-confirm');
    const passwordMismatch = document.getElementById('password-mismatch');

    confirmPassword.addEventListener('input', () => {
      if (password.value !== confirmPassword.value) {
        passwordMismatch.style.display = 'block';
      } else {
        passwordMismatch.style.display = 'none';
      }
    });
  </script>

  <script>
    //비밀번호 형식
    const passwordRegex = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,}$/;

    function validatePassword(password) {
      return passwordRegex.test(password);
    }

    password.addEventListener('input', () => {
      if (!validatePassword(password.value)) {
        password.setCustomValidity('비밀번호는 영문과 숫자를 조합한 8자리 이상이어야 합니다.');

      } else {
        password.setCustomValidity('');

      }
    });

    confirmPassword.addEventListener('input', () => {
      if (password.value !== confirmPassword.value) {
        passwordMismatch.style.display = 'block';

      } else {
        passwordMismatch.style.display = 'none';

      }
    });
  </script>





  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    //카카오톡 주소찾기
    window.onload = function () {
      document.getElementById("address_kakao_button").addEventListener("click", function (event) {
        //카카오 지도 발생
        new daum.Postcode({
          oncomplete: function (data) {
            document.getElementById("address_kakao").value = data.address;
            document.querySelector("input[id=address_kakao_detail]").focus();
          }
        }).open();

        // form submit 방지
        event.preventDefault();
      });
    };
  </script>

</main>


</body>

</html>