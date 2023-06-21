<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="https://js.tosspayments.com/v1/payment"></script>

        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <!-- iamport.payment.js -->
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    </head>

    <body>
        <div class="wrap">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
                <%-- <link rel="stylesheet" type="text/css" href="${root}/resources/css/product/common.css" /> --%>
                <link rel="stylesheet" type="text/css" href="${root}/resources/css/product/layout.css" />
                <link rel="stylesheet" type="text/css" href="${root}/resources/css/product/pay/style.css" />
                <link rel="stylesheet" type="text/css" href="${root}/resources/css/product/animate.css" />
                <link rel="stylesheet" type="text/css"
                    href="${root}/resources/css/product/jquery.mCustomScrollbar.css" />
                <!--s: content -->
                <div id="content">
                    <div>
                        
                        <h2>주문하기</h2>
                        <p>고객님이 선택하신 상품을 안전하게 주문합니다.</p>
                        <div class="orderList">
                            <h3>주문 내역 확인</h3>
                            <table class="myTable01 orderTable" summary="상품정보, 상품금액, 수량, 주문금액, 배송비, 적립 예정 적립금 정보 제공">
                                <caption>주문 내역 확인 정보 제공</caption>
                                <colgroup>
                                    <col class="t02Col1" />
                                    <col class="t02Col2" />
                                    <col class="t02Col3" />
                                    <col class="t02Col4" />
                                    <col class="t02Col5" />
                                    <col class="t02Col6" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>상품정보</th>
                                        <th>상품금액</th>
                                        <th>수량</th>
                                        <th>주문금액</th>
                                        <th>배송비</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pvoList}" var="pvo">

                                        <tr>
                                            <td class="pInfo">
                                                <a><img src="${root}/resources/upload/product/${pvo.imgName}" alt=""
                                                        width='120' height='68' /></a>

                                                <p>
                                                    <a href="">
                                                        <em>
                                                            ${pvo.name} <br />

                                                        </em>

                                                    </a>
                                                </p>
                                            </td>
                                            <td>${pvo.price} 원</td>
                                            <td>1</td>
                                            <td>${pvo.price} 원</td>
                                            <td>0원</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="orderWon">
                                <div>
                                    <span>총 상품 금액 ${totalPrice}원 + 배송비 0원 =</span>
                                    <dl>
                                        <dt>총 주문금액</dt>
                                        <dd><em>${totalPrice}</em>원</dd>
                                    </dl>

                                </div>
                            </div>

                                <div class="memJoin">
                                    <div>
                                        <h3>배송 받으시는 분</h3>
                                        <span class="same_info"></span>
                                        <p>* 항목은 필수 입력해주세요.</p>
                                    </div>
                                    <fieldset>
                                        <legend>배송 받으시는 분 정보 입력</legend>
                                        <dl>
                                            <dt>이름 *</dt>
                                            <dd><input type="text" name="name" id="name" /></dd>
                                            <dt>주소 *</dt>
                                            <dd class="address">
                                                    <button class="btn btn-dark btn-sm" id="address_kakao_button" name="address_button"
                                                    readonly>주소찾기</button>
                                                    <br>
                                                <div class="warning">
                                                    <input type="text" name="address1" class="street" readonly id="address_kakao" placeholder="도로명주소" />
                                                    <input type="text" name="address2" id="address2" placeholder="상세주소" class="addInput" />
                                                </div>
                                            </dd>
                                            <dt>휴대전화 *</dt>
                                            <dd class="phone">
                                                <select name="re_hp1" id="receiveHp1">
                                                    <option value="">선택</option>
                                                    <option value="010">010</option>
                                                    <option value="011">011</option>
                                                    <option value="016">016</option>
                                                    <option value="017">017</option>
                                                    <option value="018">018</option>
                                                    <option value="019">019</option>
                                                </select>
                                                <span>-</span>
                                                <input type="text" name="re_hp2" value="" maxlength="4" id="receiveHp2"
                                                    onkeyup="onlyNumber(this)" /><label for="receiveHp2">휴대전화 중간 자리
                                                    입력</label>
                                                <span>-</span>
                                                <input type="text" name="re_hp3" value="" maxlength="4" id="receiveHp3"
                                                    onkeyup="onlyNumber(this)" /><label for="receiveHp3">휴대전화 끝 자리
                                                    입력</label>
                                            </dd>
                                            <dt>비상연락망 *</dt>
                                            <dd class="phone">
                                                <select name="re_hp1" id="receiveHp4">
                                                    <option value="">선택</option>
                                                    <option value="010">010</option>
                                                    <option value="011">011</option>
                                                    <option value="016">016</option>
                                                    <option value="017">017</option>
                                                    <option value="018">018</option>
                                                    <option value="019">019</option>
                                                </select>
                                                <span>-</span>
                                                <input type="text" name="re_hp2" value="" maxlength="4" id="receiveHp5"
                                                    onkeyup="onlyNumber(this)" /><label for="receiveHp2">휴대전화 중간 자리
                                                    입력</label>
                                                <span>-</span>
                                                <input type="text" name="re_hp3" value="" maxlength="4" id="receiveHp6"
                                                    onkeyup="onlyNumber(this)" /><label for="receiveHp3">휴대전화 끝 자리
                                                    입력</label>
                                            </dd>
                                            <dt>배송 유의 사항</dt>
                                            <dd class="warning">
                                                <input type="text" name="ment" id="ment"
                                                    placeholder="배송팀에게 요청하실 내용을 적어주세요." />
                                            </dd>
                                        </dl>
                                    </fieldset>
                                </div>


                                <!--//200104_추가-->

                                <dl class="totalWon">
                                    <dt>
                                        <em>결제 금액</em>
                                        <dl>
                                            <dt>상품 총 금액</dt>
                                            <dd>${totalPrice}</dd>
                                            <dt>배송비</dt>
                                            <dd>0원</dd>
                                        </dl>
                                    </dt>
                                    <dd>
                                        <div>총 주문금액</div>
                                        <span><em id="totalPrice">${totalPrice}</em>원</span>
                                    </dd>
                                </dl>

                        </div>
                        <button id="iamportPayment" style="background-color: white; border: 0px;"><img
                                src="${root}/resources/img/kakaoPay.png" width="100px" height="40px" alt=""></button>
                        <button id="payment-button" style="background-color: white; border: 0px;"><img
                                src="${root}/resources/img/TossPay.png" width="100px" height="50px" alt=""></button>
                    </div>
                </div>

                <div class="kakao_pay_layer">
                    <iframe id="frmSimplePay" name="frmSimplePay"></iframe>
                    <div class="dim"></div>
                </div>

                <!--e: content -->



                <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>
        <a href="javascript: ;" id="top"><img id="img_top" src="/img/collection/btn_top.png" alt="" /></a>


    </body>

    </html>

    <!--IMPORT -->
    <!-- jQuery -->

    <script>

        function getPhoneNumber() {
            var hp1 = document.getElementById("receiveHp1").value; // 휴대전화 앞자리
            var hp2 = document.getElementById("receiveHp2").value; // 휴대전화 중간자리
            var hp3 = document.getElementById("receiveHp3").value; // 휴대전화 끝자리
        
            var phoneNumber = hp1 + "-" + hp2 + "-" + hp3; // 휴대전화 번호 합치기
            return phoneNumber;
        }

        function getPhoneNumber2() {
            var hp1 = document.getElementById("receiveHp4").value; // 휴대전화 앞자리
            var hp2 = document.getElementById("receiveHp5").value; // 휴대전화 중간자리
            var hp3 = document.getElementById("receiveHp6").value; // 휴대전화 끝자리
        
            var phoneNumber2 = hp1 + "-" + hp2 + "-" + hp3; // 휴대전화 번호 합치기
            return phoneNumber2;
        }

        function getAddress(){
            var address1 = document.getElementById("address_kakao").value;
            var address2 = document.getElementById("address2").value;

            var address = address1 + address2;

            return address;
        }

        function getMent(){
            var ment = document.getElementById("ment").value;
            return ment;
        }

        $(document).ready(function () {
            $("#iamportPayment").click(function () {
                console.log('${cart}');
                kakaopay();
            })
        })
        
        function kakaopay(product) {
            var IMP = window.IMP;
            IMP.init('imp07450213');

            // 휴대전화 번호 얻기
            var name = document.getElementById("name").value;
            var phoneNumber = getPhoneNumber();
            var phoneNumber2 = getPhoneNumber2();
            var address = getAddress();
            var ment = getMent();

            IMP.request_pay({
                pg: 'kakaopay.TC0ONETIME',
                pay_method: 'card',
                merchant_uid: 'DreamStore_' + new Date().getTime(), // 주문번호
                name: '꿈백화점', // 상품명
                amount: '${totalPrice}'/10000, // 가격
                buyer_email: $('.sessionuserID').val(), // 구매자 이메일
                buyer_name: name, // 구매자 이름
                buyer_tel: phoneNumber, // 전화번호
                buyer_addr: address, // 주소
                buyer_postcode: '123-456' // 우편번호
            }, function(data) {
                if (data.success) {
                var msg = "결제가 완료 되었습니다! 감사합니다.";
                $.ajax({
                    type: 'GET',
                    url: '${root}/payAdd',
                    data: {
                        "mNo"       : '${loginMember.no}' ,
                        "product" : '${cart}',
                        "totalPrice" : '${totalPrice}',
                        "name" : name,
                        "ph" : phoneNumber,
                        "ph2" : phoneNumber2,
                        "address" : address,
                        "ment" : ment,
                    },
                    success: function(response) {
                    // 성공적으로 처리된 경우에 대한 동작을 수행하세요.
                    },
                    error: function(xhr, status, error) {
                    // 오류 발생 시 처리할 동작을 수행하세요.
                    }
                });
                } else {
                var msg = "결제 실패";
                msg += "에러 내용" + data.error_msg;
                }
                alert(msg);
                document.location.href = "${root}/payComp";
            });
            }



        var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
        var tossPayments = TossPayments(clientKey)

        var button = document.getElementById('payment-button') // 결제하기 버튼

        button.addEventListener('click', function () {
            tossPayments.requestPayment('카드', {
                amount: 15000,
                orderId: 'LSwDotG2F3W_U3ACn_5UF',
                orderName: '토스 티셔츠 외 2건',
                customerName: '박토스',
                successUrl: 'http://localhost:8080/success',
                failUrl: 'http://localhost:8080/fail',
            })
        })
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
            document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
        }
    }).open();
});
}
</script>

  