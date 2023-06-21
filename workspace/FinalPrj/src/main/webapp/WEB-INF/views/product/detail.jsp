<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Shop &mdash; Free Website Template, Free HTML5 Template by gettemplates.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by gettemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="gettemplates.co" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="wrap">
    	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    	<!-- Animate.css -->
	<link rel="stylesheet" href="${root}/resources/css/product/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${root}/resources/css/product/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${root}/resources/css/product/bootstrap.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="${root}/resources/css/product/flexslider.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="${root}/resources/css/product/owl.carousel.min.css">
	<link rel="stylesheet" href="${root}/resources/css/product/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="${root}/resources/css/product/style.css">

	<!-- Modernizr JS -->
	<script src="${root}/resources/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
        <main>
			<br>
			<%@ include file="/WEB-INF/views/product/cart.jsp"%>
            <div id="fh5co-product">
			<div class="container">
                	<div class="row">
				<div class="col-md-10 col-md-offset-1 animate-box">
					<div class="owl-carousel owl-carousel-fullwidth product-carousel">
						<c:forEach items="${pvo.attList}" var="fvo">
							<div class="item">
								<div class="active text-center">
									<figure>
										<img src="${root}/${path}/${fvo.originName}" alt="user">
									</figure>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<h2>${pvo.name}</h2>
							<p>
								<a href="#" onclick="addToCart('${pvo.no}','${pvo.name}','${pvo.imgName}','${pvo.price}');" class="btn btn-primary btn-outline btn-lg">Add to Cart</a>
							</p>
						</div>
					</div>
				</div>
			</div>
						<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="fh5co-tabs animate-box">
						<ul class="fh5co-tab-nav">
							<li class="active"><a href="#" data-tab="1"><span class="icon visible-xs"><i class="icon-file"></i></span><span class="hidden-xs">상품 정보</span></a></li>
							<li><a href="#" data-tab="2"><span class="icon visible-xs"><i class="icon-bar-graph"></i></span><span class="hidden-xs">평점 및 리뷰</span></a></li>
							<li><a href="#" data-tab="3"><span class="icon visible-xs"><i class="icon-star"></i></span><span class="hidden-xs">잠깐! 구매 전 꼭 읽어주세요</span></a></li>
						</ul>

						<!-- Tabs -->
						<div class="fh5co-tab-content-wrap">

							<div class="fh5co-tab-content tab-content active" data-tab-content="1">
								<div class="col-md-10 col-md-offset-1">
									<span class="price">${pvo.price}</span>
									<h2>${pvo.name}</h2>
									<p>${pvo.info}</p>

									<div class="row">
										<div class="col-md-6">
											<h2 class="uppercase">Size</h2>
	                                       <p>${pvo.gk}</p>
	                                       <p>${pvo.kk}</p>
	                                       <p>${pvo.lk}</p>
	                                       <p>${pvo.qe}</p>
	                                       <p>${pvo.ss}</p>
	                                       <p><span style="font-size: 8pt;">(오차범위: -30mm)</span></p>
	                                       <p><span style="font-size: 8pt;">(*GK와 KK는 사이즈가 동일합니다)</span></p>
										</div>
										<div class="col-md-6">
											<h2 class="uppercase">구성품</h2>
											<p>${pvo.component}</p>
										</div>
										<div class="col-md-6">
											<h2 class="uppercase">주요 소재</h2>
											<p>${pvo.material}</p>
										</div>
										<div class="col-md-6">
											<h2 class="uppercase">원산지</h2>
											<p>${pvo.country}</p>
										</div>
										<div class="col-md-6">
											<h2 class="uppercase">특장점</h2>
											<p>${pvo.advantage}</p>
										</div>
										<div>
											<tr>
											<strong style="color: rgb(0, 0, 0); font-size: 13px;">품질보증기준</strong>
                                    <p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>공정거래위원회 고시(소비자분쟁해결기준)에 의거하여 보상해 드립니다	</p>
                                </tr>
                                <strong style="color: rgb(0, 0, 0); font-size: 13px;">세탁방법/취급주의사항</strong>
	<div style="margin-top: 5px;">
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>이염 및 변색의 우려가 있으니 찬물에 단독 세탁하십시오</p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>중성 세제를 사용하십시오(중성세제 사용 부주의시 원단이 손상되므로 가급적 전문업체에 의뢰하십시오)</p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>이염 및 변색의 우려가 있으니 제품을 삶거나 물에 담가두지 마십시오</p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>오염시 표백제를 사용하지 마시고, 즉시 세탁하십시오 </p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>다림질은 헝겊을 덮고 온도 80~120℃로 하십시오 </p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>그늘에 뉘어서 건조하십시오 </p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>기계건조, 열풍건조기 사용을 절대 삼가해주십시오 </p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>반드시 뒤집어 세탁하고 세탁망을 사용하십시오 </p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">·</span>불꽃 접근 시 불길이 옮겨 붙을 가능성이 있습니다 </p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">※</span>소재의 특성상 세탁시 수축 및 변색, 마찰에 의한 보풀이 발생할 수 있으니 세탁 및 건조시 주의하십시오 </p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">※</span>짙은 색상 및 흰색은 분리하여 단독 세탁하여 주십시오 </p>
		<p style="line-height: 1.5; padding-left: 10px; position: relative;"><span style="width: 10px; margin-left: -10px; display: inline-block;">※</span>세탁 방법의 잘못으로 인한 커버의 손실은 당사가 책임지지 않습니다 </p>
	</div>
	<br><br>
                                </tbody>
                            </table>
                            
										</div>
									</div>

								</div>
							</div>

							<div class="fh5co-tab-content tab-content" data-tab-content="2">
								<div class="col-md-10 col-md-offset-1">
									<h3>Happy Buyers</h3>
									<div class="feed">
										<div>
											<div id="comment-header">
												<input type="text" name="comment" placeholder="댓글을 입력하세요">
												<select id="star" name="star" class="all_star rate">
													<option selected="">Star</option>
													<option class="star_1 fa" value="1">&#xf005</option>
													<option class="star_2 fa" value="2">&#xf005 &#xf005</option>
													<option class="star_3 fa" value="3">&#xf005 &#xf005 &#xf005</option>
													<option class="star_4 fa" value="4">&#xf005 &#xf005 &#xf005 &#xf005</option>
													<option class="star_5 fa" value="5">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
												</select>
												<button onclick="writeComment();" class="btn btn-primary btn-sm">댓글작성</button>
											</div>
											<div id="comment-area">
												
											</div>
											
										</div>
										
									</div>
								</div>
							</div>
							<div class="fh5co-tab-content tab-content" data-tab-content="3">
								<%@ include file="/WEB-INF/views/common/delivery.jsp"%>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
                </div>
                
            </div>
			<!-- c:if 넣어서 관리자만 보이게 -->
						<c:if test="${not empty loginAdmin }">
                           
							<div id="btnBox" class="text-center">
								<a class="btn btn-dark" href="${root}/product/edit/${pvo.no}">상품 수정</a>
								<a class="btn btn-dark" href="${root}/product/delete/${pvo.no}">상품 삭제</a>
							</div>
						</c:if>
        </main>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </div>      

	<form method="post" action="${root}/cart/cartadd">
		<input id="pCnt" name="pCnt" type="hidden" value="">
		<input id="pNo" name="pNo" type="hidden" value="">
	</form>

      	<!-- jQuery -->
	<script src="${root}/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${root}/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${root}/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${root}/resources/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="${root}/resources/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="${root}/resources/js/jquery.countTo.js"></script>
	<!-- Flexslider -->
	<script src="${root}/resources/js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="${root}/resources/js/main.js"></script>
	
	


</body>
</html>

	<script>
		function writeComment(){
		//로그인 안되어있으면 ㄴㄴ
		const writerNo = '${loginMember.no}';
		if(writerNo <= 0){
			alert("로그인 후 작성 가능합니다. (JS에서 검사)");
			return;
		}

		//ajax 이용해서 서버에 댓글내용 보내기
		const content = document.querySelector('input[name=comment]').value;
		const star = document.querySelector('select[name=star]').value;

		$.ajax({
			url : '${root}/product/reply/write' ,
			type : 'POST' ,
			data : {
				'pNo' : '${pvo.no}' ,
				'content' : content ,
				'star' : star,
			} , 
			success : function(data){
				if(data == 'ok'){
					alert("댓글 작성 완료 !");
					document.querySelector('input[name=comment]').value = '';
					loadReply();
				}else if(data == 'unauthor'){
					alert("로그인 후 작성 가능합니다.");
				}else{
					alert("댓글 작성 실패 ...");
				}
			} , 
			error : function(){
				alert('bad...');
			} ,
		});
	}
	
	//댓글 불러오기
	loadReply();

	function generateStarRating(value) {
		let starRating = "<span class='rate'><p class='star_"+value+" fa'>";

		// 최대 별점 개수를 5로 설정
		const maxStars = 5;
		
		// value 값이 최대 별점 개수를 초과하는 경우에 대한 처리
		if (value > maxStars) {
			value = maxStars;
		}
		
		for (let i = 1; i <= value; i++) {
			starRating += "&#xf005 ";
		}
		
		starRating += "</p></span>";
		
		return starRating;
	}


	function loadReply(){

		const commentArea = document.querySelector('#comment-area');
		commentArea.innerHTML = '';
		const writerNo = '${loginMember.no}';

		$.ajax({
			url: '${root}/product/reply/list',
			type: 'get',
			data: {
				'pNo': '${pvo.no}'
			},
			dataType: 'json',
			success: function(data) {
				console.log(data);
				
				for (let replyVo of data) {
					let str = "<div><blockquote><p>";
						str += replyVo.content;
						str += "</p></blockquote><h3>&mdash; ";
						str += replyVo.writerNick;
						str += "</h3>";
					str += generateStarRating(replyVo.star);
					str += "</span>";
					if (writerNo == replyVo.writerNo || writerNo == 1) {
					str += "<button class='btn btn-warning btn-sm' onclick='editReply(" + replyVo.no + ");'>수정</button>";
					str += "<button class='btn btn-danger btn-sm' onclick='deleteReply(" + replyVo.no + ");'>삭제</button>";
					}
					str += "</div>";
					commentArea.innerHTML += str;
				}
				},

			error: function(error) {
				console.log(error);
			},
		});


	}

	
	//댓글 삭제 함수
	function deleteReply(rno){
		
		const result = confirm("삭제 진짜로 ???");
		if(!result){
			return;
		}

		$.ajax({
			url : '${root}/product/reply/delete?rno=' + rno ,
			type : 'delete' ,
			// data : {
			// 	'rno' : rno
			// } ,
			success : function(data){
				console.log(data);
				alert("삭제 완료 !");
				loadReply();
			} ,
			error : function(error){
				console.log(error);
				alert("삭제 실패 ...");
			} ,
		});

	}

	//댓글 수정 함수
	function editReply(rno){
		//댓글번호 , 수정할내용
		const newContent = window.prompt("수정할 내용을 입력하세요");

		//수정 요청 보내기
		$.ajax({
			url : '${root}/product/reply/edit' , 
			type : 'post' , 
			data : {
				content : newContent ,
				no : rno ,
			} , 
			success : function(data){
				alert("수정 완료 !");
				loadReply();
			} , 
			error : function(error){
				alert("수정 실패 ...");
			} , 
		});

	}
	</script>

