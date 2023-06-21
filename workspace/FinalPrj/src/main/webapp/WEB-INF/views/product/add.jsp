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
	background-color: white;
}

.input-form {
	border: 1px solid black;
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
	
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">상품 등록</h4>

				<form action="${root}/product/add" method="POST" enctype="multipart/form-data">

					<div class="row">

						<div class="col-md-6 mb-3">
							<label for="id">상품 명</label> 
                            <input type="text" class="form-control" name="name">
						</div>

						<div class="col-md-3 mb-3">
							<label for="root">카테고리</label> 
							<select class="custom-select d-block w-100 btn btn-secondary" name="cNo" onchange="showDiv(this.value)">
								<option value="">옵션 선택</option>
								<c:forEach items="${category}" var="cg">
									<option value="${cg.no}">${cg.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<label for="email">상품 가격</label> 
                            <input type="text" class="form-control" name="price" >
						</div>

						<div class="col-md-6 mb-3">
								<label for="code">상품 설명</label> 
                                <input type="text" class="form-control" name="info" placeholder="상품 리스트에 적힐 설명을 적어주세요.">
						</div>

                        <div class="col-md-12 mb-3">
                            <label for="code">상품 상세</label> 
                            <br>
                        </div>
						<div id="div1" class="option-div" style="display: none;">
							<div class="col-md-6 mb-3">
								<label for="code">구성품</label> <input type="text" name="component" class="form-control">
								<br>
							</div>
							<div class="col-md-6 mb-3">
								<label for="code">주요 소재</label> <input type="text" name="material" class="form-control">
							</div>
							<br>
							<label for="code">사이즈</label> <br>
							<div class="col-md-12 mb-3">
								<label for="code">GK</label><input type="text" name="gk" class="form-control">
								<label for="code">KK</label><input type="text" name="kk" class="form-control">
								<label for="code">LK</label><input type="text" name="lk" class="form-control">
								<label for="code">QE</label><input type="text" name="qe" class="form-control">
								<label for="code">SS</label><input type="text" name="ss" class="form-control">
							</div>
							<br>
							<div class="col-md-6 mb-3">
								<label for="code">원산지</label> <input type="text" name="country" class="form-control">
							</div>
							<br>
							<div class="col-md-6 mb-3">
								<label for="code">특장점</label> <input type="text" name="advantage" class="form-control">
							</div>
						</div>
						
						  <div id="div2" class="option-div" style="display: none;">
							<div class="col-md-6 mb-3">
								<label for="code">구성품</label> <input type="text" name="component" class="form-control">
								<br>
							</div>
							<div class="col-md-6 mb-3">
								<label for="code">주요 소재</label> <input type="text" name="material" class="form-control">
							</div>
							<br>
							<label for="code">사이즈</label> <br>
							<div class="col-md-12 mb-3">
								<label for="code">GK</label><input type="text" name="gk" class="form-control">
								<label for="code">KK</label><input type="text" name="kk" class="form-control">
								<label for="code">LK</label><input type="text" name="lk" class="form-control">
								<label for="code">QE</label><input type="text" name="qe" class="form-control">
								<label for="code">SS</label><input type="text" name="ss" class="form-control">
							</div>
							<br>
							<div class="col-md-6 mb-3">
								<label for="code">원산지</label> <input type="text" name="country" class="form-control">
							</div>
							<br>
							<div class="col-md-6 mb-3">
								<label for="code">특장점</label> <input type="text" name="advantage" class="form-control">
							</div>
						  </div>
						
						  <div id="div3" class="option-div" style="display: none;">
							<div class="col-md-6 mb-3">
								<label for="code">구성품</label> <input type="text" name="component" class="form-control">
								<br>
							</div>
							<div class="col-md-6 mb-3">
								<label for="code">주요 소재</label> <input type="text" name="material" class="form-control">
							</div>
							<br>
							<div class="col-md-12 mb-3">
								<label for="code">사이즈</label><input type="text" name="pSize" class="form-control">
							</div>
							<br>
							<div class="col-md-6 mb-3">
								<label for="code">원산지</label> <input type="text" name="country" class="form-control">
							</div>
							<br>
							<div class="col-md-6 mb-3">
								<label for="code">특장점</label> <input type="text" name="advantage" class="form-control">
							</div>
						  </div>
					</div>

					<div class="row">
						
						<div class="col-md-6 mb-5">
                        	리스트 사진 업로드<br>
                        	<input type="file" name="img">
                    	</div>

                        <div class="col-md-6 mb-5">
                        	상세 사진 업로드<br>
                        	<input type="file" name="fList" multiple accept=".jpg,.png,.jpeg">
                    	</div>

					</div>
					<div>
					<button class="btn btn-secondary btn-lg btn-block" type="submit">상품 등록</button>
				</form>
				<button class="btn btn-secondary btn-lg btn-block" type="button"
						onclick="locotion.href='${root}'">뒤로가기</button>
                </div>
			</div>
		</div>

	</div>
</body>

</html>
<script>
   function showDiv(option) {
      // 모든 div 숨기기
      var divs = document.getElementsByClassName("option-div");
      for (var i = 0; i < divs.length; i++) {
        divs[i].style.display = "none";
      }
      
      // 선택된 옵션에 해당하는 div 보이기
      var selectedDiv = document.getElementById("div" + option);
      selectedDiv.style.display = "block";
    }
</script>