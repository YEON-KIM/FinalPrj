<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿈백화점  - ProductList</title>
</head>
<body>

    <div id="wrap">

        <%@include file="/WEB-INF/views/common/header.jsp" %>
        
        <main>
            <br>
            <%@ include file="/WEB-INF/views/product/cart.jsp"%>
            <!-- c:if 추가해서  -->
    		<div class="text-center">
                <c:if test="${not empty loginAdmin }">
                    <a class="btn btn-dark" href="${root}/product/add">상품 등록</a>
                </c:if>	
			</div>
            <h2>Store</h2>
            


            <div id="category">
                <div class="proSelect2">
                    <label for="category">Category</label>
                    <select id="category" name="category" class="proSelect2" onchange="updateCategory()">
                        <option value="" selected="">Category</option>
                                <option value="1">MATTRESS</option>
                                <option value="2">BEDDING</option>
                    </select>
                </div>
            </div>
			<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center product">
                    <!-- forEach 안에 넣기 -->
                    <c:forEach items="${pvoList}" var="pvo">
                        <c:if test="${selectedCategory eq '' || empty selectedCategory || selectedCategory eq pvo.cNo}">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image 상품 이미지-->
                                <div style="display: none;">${pvo.no}</div>
                                <img class="card-img-top" src="${root}/resources/upload/product/${pvo.imgName}" alt="..." />
                                <!-- Product details 상품 정보-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name 상품 이름-->
                                        <h5 class="fw-bolder">${pvo.name}</h5>
                                        <h6 class="fw-bolder">${pvo.info}</h6>
                                        <!-- Product reviews 상품 별점-->
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                        </div>
                                        <!-- Product price 상품 가격-->
                                        <h6 class="fw-bolder">${pvo.price } 원</h6>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="fw-bolder text-center">
                                        <i class="bi-cart-fill me-1"></i>
                                            조회수 
                                        <span id="cnt" class="badge bg-white text-black ms-1 rounded-pill">${pvo.hit}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>
                    </c:forEach>
                    
                </div>
            </div>
        </section>
        </main>
        
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
        
    </div>

<style>
    main > h2{
        text-align: center;
    }

    #category{
        text-align: center;
        margin: auto;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .productBox{
        border: 1px solid black;
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        align-items: center;
        width: 80%;
    }
    #productList{
        text-align: center;
        margin: auto;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #productList{
        display: grid;

        grid-template-columns: 1fr 1fr 1fr;
    }
</style>

</body>
</html>


<script>

//"product" 클래스를 가진 요소에 클릭 이벤트 리스너를 추가합니다.
const productElements = document.getElementsByClassName("product");
for (let i = 0; i < productElements.length; i++) {
  productElements[i].addEventListener("click", function(event) {
    const num = event.target.parentNode.children[0].innerText;
    const cnum = event.target.parentNode.children[1].innerText;
    location.href = '${root}/product/detail?num=' + num;
  });
}

let selectedCategory = ""; // 선택된 카테고리를 저장할 변수

function updateCategory() {
  selectedCategory = document.getElementById("category").value;
  updateProductList();
  console.log("업데이트 함수실행");
}

function updateProductList() {
  const category = $("#category").val();

  $.ajax({
    type: "POST",
    url: "/app/product/list",
    data: { category: category },
    success: function(response) {
      const productListContainer = $("#productList");
      productListContainer.html(response);
      console.log(response);
    },
    error: function(xhr, status, error) {
      console.error("Error: " + status);
    }
  });
}



</script>
