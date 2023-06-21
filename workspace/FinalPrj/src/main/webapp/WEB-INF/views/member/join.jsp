<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면</title>

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>

<body>





	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<br>
	<br>
	<br>



	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
Kakao.init('c0a973947b1d96aa01fa4efec791b2fa'); 
console.log(Kakao.isInitialized()); 
function kakaoLogin() {
  Kakao.Auth.login({
    success: function(response) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(response) {
        	console.log(response)
          var nickname = response.properties.nickname;
        	document.querySelector('input[name="nick"]').value = nickname;
        	document.querySelector('input[name="name"]').value = nickname;
          var profileImageUrl = response.properties.profile_image;
          var birthday = response.kakao_account.birthday;
          var email = response.kakao_account.email;
          document.querySelector('input[name="id"]').value = email;
          
          var gender = response.kakao_account.gender;
          document.querySelector('select[name="gender"]').value = gender;
          
          if (gender === "male") {
            document.querySelector('select[name="gender"]').value = "M";
          } else if (gender === "female") {
            document.querySelector('select[name="gender"]').value = "F";
          }
          
          var age_range = response.kakao_account.age_range;
          document.querySelector('select[name="age"]').value = age_range;
          
          if (age_range === "10~19") {
              document.querySelector('select[name="age"]').value = "10";
          } else if (age_range === "20~29") {
              document.querySelector('select[name="age"]').value = "20";
          }	else if (age_range === "30~39") {
              document.querySelector('select[name="age"]').value = "30";
          }	else if (age_range === "40~49") {
              document.querySelector('select[name="age"]').value = "40";
          }	else if (age_range === "50~59") {
              document.querySelector('select[name="age"]').value = "50";
          }	else if (age_range === "60~69") {
              document.querySelector('select[name="age"]').value = "60";
          }	else if (age_range === "70~79") {
              document.querySelector('select[name="age"]').value = "70";
          }	else if (age_range === "80~89") {
              document.querySelector('select[name="age"]').value = "80";
          }	else if (age_range === "90~99") {
              document.querySelector('select[name="age"]').value = "90";
          }
          
          var birthday = response.kakao_account.birthday;
          var birthMonth = parseInt(birthday.substring(0, 2));
          var birthDay = parseInt(birthday.substring(2, 4));

          document.querySelector('select[id="birthdateMonth"]').value = birthMonth;
          document.querySelector('select[id="birthdateDay"]').value = birthDay;

          
          
          
          
          
          
          

          const express = require('express');
          const multer = require('multer');
          const app = express();

          const storage = multer.diskStorage({
            destination: function (req, file, cb) {
              cb(null, '${root}/resources/upload/member/')
            },
            filename: function (req, file, cb) {
              const ext = file.mimetype.split('/')[1];
              cb(null, `profile-image-${req.body.nickname}.${ext}`);
            }
          });

          const upload = multer({ storage: storage });

          app.post('/api/upload-profile-image', upload.single('profile'), function(req, res) {
            res.json({ success: true });
          });
        },
        fail: function(error) {
          console.log(error);
        },
      });
    },
    fail: function(error) {
      console.log(error);
    },
  });
}
</script>


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" style="text-align: center">회원가입</h4>
				<button onclick="kakaoLogin();">
					<img width="50px" height="50px"
						src="${root}/resources/img/kakaologo.png">
				</button>
				<a href="javascript:void(0)"> </a>카카오톡에서 정보 가져오기



				<form action="${root}/member/join" method="POST"
					enctype="multipart/form-data" onsubmit="return checkValidation();">

					<div class="row">

						<div class="col-md-12 mb-3">
							<label for="email">이메일</label> <input type="text"
								class="form-control" id="id" name="id"
								onblur="validateEmailFormat(this);"
								placeholder="example@mail.com">
							<div id="emailWarning" style="color: red; display: none;">이메일
								형식으로 입력하세요.</div>
							<input type="button" value="중복확인" onclick="checkDup();">
						</div>

						<div class="col-md-6 mb-3">
							<label for="email">비밀번호</label> <input type="password"
								class="form-control" name="password" id="password"
								placeholder="영, 숫자 포함 8자리 이상" required>
						</div>


						<div class="col-md-6 mb-3">
							<label for="email">비밀번호 확인</label> <input type="password"
								class="form-control" name="password2" id="password-confirm"
								placeholder="영, 숫자 포함 8자리 이상" required>
						</div>
						<p id="password-mismatch" style="color: red; display: none;">비밀번호가
							일치하지 않습니다.</p>

						<div class="col-md-6 mb-3">
							<label for="nick">닉네임</label> <input type="text"
								class="form-control" name="nick"
								placeholder="한글 두 글자 혹은 영문 네 글자" required
								oninput="validateNickname(this)"> <input type="button"
								value="중복확인" onclick="checkNick();">
						</div>

						<div class="col-md-3 mb-3">
							<label for="root">연령</label> <select
								class="custom-select d-block w-100 btn btn-secondary" name="age"
								required>
								<option value="N">선택안함</option>
								<option value="10">10~19</option>
								<option value="20">20~29</option>
								<option value="30">30~39</option>
								<option value="40">40~49</option>
								<option value="50">50~59</option>
								<option value="60">60~69</option>
								<option value="70">70~79</option>
								<option value="80">80~89</option>
								<option value="90">90~99</option>
							</select>
						</div>


						<div class="col-md-3 mb-1">
							<label for="jumin">생일</label>
							<div class="row">
								<div class="col-md-6">
									<select id="birthdateMonth" name="jumin"
										class="custom-select d-block w-100 btn btn-secondary" required>
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
								</div>
								<div class="col-md-6">
									<select id="birthdateDay" name="jumin"
										class="custom-select d-block w-100 btn btn-secondary" required>
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
							</div>
						</div>


					</div>

					<div class="row">

						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" name="name" placeholder="한글 두 글자 이상"
								required oninput="validateName(this)">
						</div>

						<div class="col-md-3 mb-3">
							<label for="root">성별</label> <select
								class="custom-select d-block w-100 btn btn-secondary"
								name="gender" required>
								<option value="N">선택안함</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</div>

						<div class="col-md-6 mb-5">
						  <label for="phone">핸드폰 번호</label>
						  <input type="text" class="form-control" name="phone" placeholder="000-0000-0000" maxlength="13" oninput="formatPhoneNumber(this)" required>
						  <input type="button" value="중복확인" onclick="checkPhoneNum();">
						</div>


						<div class="col-md-6 mb-5">
							프로필사진 업로드<br> <input id="thumbnail-tag" type="file"
								name="profile">
							<div id="thumbnailArea"></div>
						</div>

					</div>

					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" id="address_kakao" name="address" readonly
							required>
						<td><button id="address_kakao_button" name="address_button"
								readonly>주소찾기</button></td>
					</div>

					<div class="mb-3">
						<label for="address2">상세주소</label> <input type="text"
							class="form-control" name="address_detail"
							placeholder="상세주소를 입력해주세요.">
					</div>


					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>

					<div class="mb-4"></div>
					<button class="btn btn-secondary btn-lg btn-block" type="submit" onclick="validateRegistration()">가입 완료</button>
					
				</form>
			</div>
		</div>

	</div>
	<br>
	<br>
	<br>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>

let isIdFormOk = false;

	//이메일 형식
function validateEmailFormat(input) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  const emailWarning = document.getElementById('emailWarning');
  
  if (!emailRegex.test(input.value.trim())) {
	    input.style.borderColor = 'red';
	    emailWarning.style.display = 'block';
	    isIdFormOk=false;
	    return;
	    
  } else {
	  	input.style.borderColor = '';
	    emailWarning.style.display = 'none';
	    isIdFormOk=true;
  }
}


	//아이디 중복확인
	

	
function checkDup(){
  const id = document.querySelector(".input-form input[name=id]").value;
  
  if(id === ''){
	  alert("이메일을 입력해주세요.");
	  input.style.borderColor = 'red';
	  document.querySelector(".input-form input[name=id]").focus();
	  return;
  }
  
  if(!isIdFormOk){
	  alert("이메일 형식에 맞게 입력하세요");
	  return false;
  }
  
  $.ajax({
    url : '/app/member/id-check',
    type : 'POST' ,
    data : {
      'id' : id
    },
    success : function(data){
      if(data == 'notDup'){
        alert("사용 가능한 이메일입니다.");
        
        
      } else {
        alert("이미 가입된 이메일입니다.");
        
        
      }
    },
    error : function(e){
      console.log(e);
    },
  });
}

</script>


	<script>
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
  const nick = document.querySelector(".input-form input[name=nick]").value;
  
  
  if(nick === ''){
	  alert("닉네임을 입력해주세요.")
	  document.querySelector(".input-form input[name=nick]").focus();
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
</script>


	<script>
//실명 형식 제한
function validateName(input) {
  const name = input.value.trim();
  const regex = /^[가-힣]{2,}$/;

  if (!regex.test(name)) {
    input.setCustomValidity('이름은 한글 두 글자 이상이어야 합니다.');
    input.classList.add('is-invalid');
  } else {
    input.setCustomValidity('');
    input.classList.remove('is-invalid');
  }
}
</script>

<script>
let isPhoneFormOk = false;

function formatPhoneNumber(input) {
  const value = input.value.trim().replace(/-/g, '');

  if (value.length = 11) {
    input.value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11);
    isPhoneFormOk=true;
  }
}

function checkPhoneNum() {
	  const phone = document.querySelector(".input-form input[name=phone]").value;
	  	
	  	console.log(phone);	//디버깅용, 지워야 함.
	  	
	  if (phone === '') {
		  
	    alert("핸드폰 번호를 입력해주세요.");
	    document.querySelector(".input-form input[name=phone]").focus();
	    return;
	  }
	  if (phone.length !== 13) {
		    alert("핸드폰 번호를 정확히 입력해주세요.");
		    return;
		  }

	  $.ajax({
	    url: '/app/member/phone-check',
	    type: 'POST',
	    data: {
	      'phone': phone
	    },
	    success: function (data) {
	      if (data == 'notDup') {
	        alert("사용 가능한 핸드폰 번호입니다.");
	      } else if (data == 'isDup') {
	          alert("이미 사용중인 핸드폰 번호입니다.");
	      } else {
	        alert("중복 여부를 확인할 수 없습니다.");
	      }
	    },
	    error: function (e) {
	      console.log(e);
	      alert("요청을 처리하는 도중 오류가 발생했습니다.");
	    },
	  });
	}
  </script>

	<script>
//변수 준비
const fileTag = document.querySelector('input[name="profile"]');
const thumbnailArea = document.querySelector('#thumbnailArea');

//이벤트 핸들러 연결
fileTag.addEventListener('change' , function(){
	thumbnailArea.innerHTML = '';		//썸네일 에리어 지우기

	//파일 있으면 미리보기 작업 진행
	if(fileTag.files.length > 0){
		for(let f of fileTag.files){
			const reader = new FileReader();
			reader.addEventListener("load" , processPreview);
			reader.readAsDataURL(f);
		}
	}
});

//이미지 요소 만들어서, 화면에 추가
function processPreview(event){
	const imgTag = document.createElement('img');
	imgTag.setAttribute("src" , event.target.result);
	imgTag.setAttribute("width" , "100px");
	imgTag.setAttribute("height" , "100px");
	thumbnailArea.appendChild(imgTag);
}


</script>





	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
//카카오톡 주소찾기
	window.onload = function(){
		document.getElementById("address_kakao_button").addEventListener("click", function(){ //주소입력칸을 클릭하면
			//카카오 지도 발생
			new daum.Postcode({
				oncomplete: function(data) { //선택시 입력값 세팅
					document.getElementById("address_kakao").value = data.address; // 주소 넣기
					document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
				}
			}).open();
		});
	}
</script>

<script>
function validateRegistration() {
	  if (!isIdFormOk && !isNickFormOk && !isPhoneFormOk) {
	    alert("회원가입 항목을 체크해주세요:)");
	    return false;
	  }

	  // 가입 완료 로직 실행
	  // location.href = '${root}';

	  alert("꿈백화점의 회원이 되신 것을 축하드립니다:)");
	  location.href = '${root}';
	}



</script>




</body>

</html>