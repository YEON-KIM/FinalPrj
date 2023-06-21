<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
        <main>
			<div class="comp">
				<h2>결제가 완료되었습니다.</h2>
				<div class="text-center" style="padding-top: 3%; padding-bottom: 3%;">
					<table class="table table-bordered text-center" style="width: 60%;" align="center">
						<thead style="background-color: black; color: white; font-size: 30px;">
							<tr>
								<th scope="col" colspan="2">결제 정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">결제 번호</th>
						<td>${pay.no}</td>
					</tr>
					<tr>
					  <th scope="row">결제 일시</th>
					  <td>${pay.enrollDate}</td>
					</tr>
					<tr>
						<th scope="row">구매자</th>
						<td>${pay.name}</td>
					  </tr>
					  <tr>
						<th scope="row">결제 상품</th>
						<td>${pay.product}</td>
					  </tr>
					  <tr>
						<th scope="row">결제 금액</th>
						<td>${pay.totalPrice}</td>
					  </tr>
					  <tr>
						<th scope="row">연락처</th>
						<td>${pay.ph}</td>
					  </tr>
					  <tr>
						<th scope="row">비상 연락망</th>
						<td>${pay.ph2}</td>
					  </tr>
					  <tr>
						<th scope="row">배송지</th>
						<td>${pay.address}</td>
					  </tr>
					  <tr>
						<th scope="row">요청사항</th>
						<td>${pay.ment}</td>
					  </tr>
					</tbody>
				</div>
			  
				</table>

				<div style="padding-top: 3%;">
	            	<a class="btn btn-dark" href="${root}/product/list">다른 상품 보러가기</a>
	            	<a class="btn btn-dark" href="${root}/payList/${loginMember.no}">결제 목록 확인</a>
				</div>
			</div>
        </main>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </div>

	<style>
		.comp{
			padding-top:3%;
			text-align: center;
		}
		.payContent{
			padding-top:2%;
			padding-bottom: 5%;
		}
	</style>
</body>
</html>
