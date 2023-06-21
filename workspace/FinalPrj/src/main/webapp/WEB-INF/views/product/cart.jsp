<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #cartarea {
        position: relative;
    }
    #cart {
        position: absolute;
        top: 200px;
        right: -560px;
        width: 500px;
        background-color: white;
        padding: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: right 0.3s ease-in-out;
        z-index: 1;
    }
    #cart.active {
        right: 0px;
    }
    
</style>
</head>
<body>
    <div class="cartbtn text-end">
        <div style="width: 84%;">
            <button id="cartarea" class="btn btn-outline-dark" onclick="getCart();">
                <i class="bi-cart-fill me-1"></i>
                Cart
                <span id="cnt" class="badge bg-dark text-white ms-1 rounded-pill"></span>
            </button>
        </div>
        <div id="cart">
            <form action="${root}/pay" method="GET">
                <input type="hidden" name="cartItems" id="cartItems">
            <table class="table">
                <thead>
                    <tr>
                        <th colspan="5" style="text-align: center;"><h1>Cart</h1></th>
                    </tr>
                </thead>
                <tbody id="cartbody">
                
                </tbody>
                <tfoot>
                    <tr>
                        <td>총 금액 : </td>
                        <td>
                            <span id="totalAmount">${totalPrice}</span>원
                            <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="${totalPrice}">
                        </td>
                    </tr>
                </tfoot>
            </table>
                <input class="btn btn-dark btn-lg btn-block" type="submit" onclick="sendCartItems();" value="결제하러 가기">
            </form>
        </div>
    </div>
    <script>
        const cartArea = document.getElementById('cartarea');
        const cart = document.getElementById('cart');

        cartArea.addEventListener('click', function() {
            cart.classList.toggle('active');
        });

        function getCart() {
            $.ajax({
                type: "GET",
                url: "/app/cart",
                success: function (cartItems) {
                    var innerHtml = "";
                    var totalPrice = 0; // 총액을 저장할 변수
                    var itemCount = cartItems.length;

                    $("#cnt").text(itemCount);

                    $.each(cartItems, function(index, item) {
                        // 장바구니 정보를 파이프(|)를 기준으로 분리
                        var cartData = item.split("|");
                        var productName = cartData[0];
                        var productImg = cartData[1];
                        var productPrice = parseFloat(cartData[2]); // 가격을 숫자로 변환
                        var productId = index; // 상품의 인덱스 값을 productId로 사용

                        totalPrice += productPrice; // 가격을 누적하여 총액 계산

                        // 테이블에 행 추가
                        innerHtml += "<tr class=\"cartbox\">"+
                                        "<td><img class=\"cartImg\" src=\"${root}/resources/upload/product/" + productImg + "\" alt=\"상품 이미지\"></td>"+
                                        "<td name=\"productName\">"+productName+"</td>"+
                                        "<td>"+productPrice+" 원</td>"+
                                        "<td><button class=\"btn btn-outline-dark\" type=\"button\" onclick=\"cartRemove(" + productId + ");\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-x\" viewBox=\"0 0 16 16\"><path d=\"M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z\"></path></svg></button></td>"+
                                    "</tr>";
                    });

                    $("#cartbody").html(innerHtml);

                    // 총액을 표시할 위치에 값을 설정
                    $("#totalAmount").text(totalPrice);
                    $("#hiddenTotalPrice").val(totalPrice); // hidden input에 총액 값 설정
                    // 서버로부터 받은 장바구니 정보(cartItems)를 이용하여 UI 업데이트 등 필요한 동작 수행
                },
                error: function (x) {
                    // 에러 처리
                }
            });
        }

        document.querySelector("#cartItems").value = JSON.stringify(cartItems);

        function sendCartItems() {
            var cartItems = []; // 장바구니 상품 이름을 저장할 배열

            // 장바구니 테이블의 각 행을 순회하며 상품 이름을 수집하여 배열에 추가
            $("#cartbody tr").each(function() {
                var productName = $(this).find("td:nth-child(2)").text();
                cartItems.push(productName);
            });

            // cartItems 값을 hidden input 태그에 설정
            $("#cartItems").val(JSON.stringify(cartItems));
        }

        // sendCartItems() 함수 호출을 추가
        sendCartItems();

        function cartRemove(productId) {
            $.ajax({
                type: "GET",
                url: "/app/cart/remove",
                data: { productId: productId },
                success: function(response) {
                    alert("상품 삭제 완료 !");
                    // 쿠키를 삭제하고 화면을 업데이트하는 로직을 추가
                    getCart(); // 장바구니 정보를 다시 가져와서 화면을 업데이트
                },
                error: function(xhr) {
                    // 에러 처리
                    alert("실패 ..");
                    console.log(productId);
                }
            });
        }
    </script>

    <script>
        
        function addToCart(productId, productName, productImg, productPrice) {        
            $.ajax({
                type: "POST",
                url: "/app/cart/add",
                data: {
                    productId: productId,
                    productName: productName,
                    productImg : productImg,
                    productPrice : productPrice
                },
                success: function () {
                    alert("상품이 장바구니에 추가되었습니다.");
                }
            });
        }

        
    </script>

    <style>
        .cartImg{
            width: 100px;
            height: 100px;
            border-radius: 20px;
        }

        .cartbox{
            text-align: center;
        }

    </style>
</body>
</html>
