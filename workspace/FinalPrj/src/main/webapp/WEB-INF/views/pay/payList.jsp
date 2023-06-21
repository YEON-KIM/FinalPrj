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
            <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

            <h1 align="center">결제 목록</h1>

            <div style="padding-top: 5%; padding-bottom: 20%;">
            <table class="table table-bordered text-center" style="width: 80%;" align="center">
                <thead style="background-color: black; color: white; font-size: 20px;">
                    <tr>
                        <th scope="col">결제 번호</th>
                        <th scope="col">상품 이름</th>
                        <th scope="col">총 금액</th>
                        <th scope="col">구매자 이름</th>
                        <th scope="col">연락처</th>
                        <th scope="col">비상 연락망</th>
                        <th scope="col">배송지 주소</th>
                        <th scope="col">배송 요청 멘트</th>
                        <th scope="col">구매 일자</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${payList}" var="pay">
                        <tr>
                            <td>${pay.no}</td>
                            <td>${pay.product}</td>
                            <td>${pay.totalPrice}</td>
                            <td>${pay.name}</td>
                            <td>${pay.ph}</td>
                            <td>${pay.ph2}</td>
                            <td>${pay.address}</td>
                            <td>${pay.ment}</td>
                            <td>${pay.enrollDate}</td>
                        </tr>
            </c:forEach>
            
            </tbody>
            </table>
        </div>
        </main>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </div>

</body>
</html>
