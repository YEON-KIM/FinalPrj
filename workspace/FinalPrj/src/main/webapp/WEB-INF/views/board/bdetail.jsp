<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#thumbnail-tag{
	display: none;
}

/* 상세조회 css */  
<%String color[]  = {"FF0000","FF8000","FFFF00","80FF00","00FF00","00FF80",
		"00FFFF","0080FF","0000FF","7F00FF","FF00FF","FF007F","000000","FFFFFF"};
  String colorC[]  = {"FF6666","FFB266","FFFF66","B2FF66","66FF66","66FFB2"
		  ,"66FFFF","66B2FF","6666FF","B266FF","FF66FF","FF66B2","404040","C0C0C0"};
	for(int i=0; i<color.length; i++){ %>
  
 input#check_btn<%=i%>{
  display:none;
  }

input#check_btn<%=i%> + label{
  cursor:pointer;
 }

input#check_btn<%=i%> + label > span{
  vertical-align: middle;
  
 }

/* label:before에 체크하기 전 상태 CSS */
input#check_btn<%=i%> + label:before{
  content:"";
  display:inline-block;
  width:30px;
  height:30px;
  border:2px solid black;
  background-color:#<%=color[i]%>;
  border-radius: 4px;
  vertical-align:middle;
  
  }
  
  input#check_btn<%=i%>:not(:checked) + label:before{

  display: none;
  }
  

/* label:before에 체크 된 상태 CSS */  
input#check_btn<%=i%>:checked + label:before{
  content:"";
  background-color:#<%=color[i]%>;
  border-color:#<%=color[i]%>;
  background-image: url('check_btn.png');
  background-repeat: no-repeat;
  background-position: 50%;
  border: 2px solid black;
  }
 

/* 수정하기 css */


  
 input#check_btnn<%=i%>{
  display:none;
  }

input#check_btnn<%=i%> + label{
  cursor:pointer;
 }

input#check_btnn<%=i%> + label > span{
  vertical-align: middle;
  
 }

/* label:before에 체크하기 전 상태 CSS */
input#check_btnn<%=i%> + label:before{
  content:"";
  display:inline-block;
  width:30px;
  height:30px;
  border:2px solid black;
  background-color:#<%=color[i]%>;
  border-radius: 4px;
  vertical-align:middle;
  }
  
/* label:before에 체크 된 상태 CSS */  
input#check_btnn<%=i%>:checked + label:before{
  content:"";
  background-color:#<%=colorC[i]%>;
  border-color:#<%=colorC[i]%>;
  background-image: url('check_btn.png');
  background-repeat: no-repeat;
  background-position: 50%;
  }
 
<%}%>





.view-area , .form-area {
	display: none;
	}
.active{
	display: block;
	}

</style>


</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>





	<article>
		<div class="view-area active">
		<div class="container" role="main">
			<h2>꿈 일기장</h2>
			<form name="form" action="${root}/board/bwrite" method="post" >
			
			<input type="hidden" value="${bvo.writerName }">
			
			<%for(int i=0; i<14; i++){ %>
			  <input type="checkbox" id="check_btn<%=i%>" name="color" value="<%=i%>" disabled="disabled">
			  <label  for="check_btn<%=i%>">
			  </label>
			<%} %>



				<div>
					<span>꿈 성격(다중선택가능) : </span> 
					<label for="check_b">발랄함 <input type="checkbox" id="check_b" name="mood" value="20" >
					</label> 
					<label for="check_b">슬픔 <input type="checkbox" id="check_b" name="mood" value="30" >
					</label> 
					<label for="check_b">보통 <input type="checkbox" id="check_b" name="mood" value="40" >
					</label> 
					<label for="check_b">화남 <input type="checkbox" id="check_b" name="mood" value="50" >
					</label>
					<label for="check_b">재밌음 <input type="checkbox" id="check_b" name="mood" value="60">
					</label>
				</div>
				<label>팔기 가능 여부</label>
				<span>${vo.categoryName}</span>


				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" value="${bvo.title}">
				</div>
				
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" >${bvo.content}</textarea>
				</div>
				
				<!-- <div class="mb-3">
					<label for="tag">TAG</label>
					<input type="text" class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요">
				</div> -->
				
		
				</form>
				
			<!-- 댓글  -->	
				
			<div id="comment-header">
				<input type="text" name="comment" placeholder="댓글을 입력하세요">
				<button onclick="writeComment();" class="btn btn-primary btn-sm">댓글작성</button>
			</div>
			<div id="comment-area">
				
			</div>	
			
			
			<!-- 화면 전환 -->
			
					
					
			
			<div>
			<c:if test="${loginMember.no eq bvo.writerNo}">
				<a href="javascript:changeView();" type="button" class="btn btn-sm btn-primary" id="btnList">수정하기</a>
				<a  href="${root}/board/bdelete?no=${bvo.no } " class="btn btn-sm btn-primary"  style="background-color: red">삭제</a>			
			</c:if>
				<a href="${root}/board/blist" type="button" class="btn btn-sm btn-primary" id="btnList">목록</a>
			</div>
			
		</div>
		</div>
		
		
<!-- 수정페이지 -->		
		
		
		<div class="form-area">
		<div class="container" role="main">
			<h2>꿈 일기장</h2>
			<form name="form" action="${root}/board/bedit" method="post"  enctype="multipart/form-data" >
			
				<input type="hidden" name="no" value="${bvo.no }">			
			<%for(int i=0; i<14; i++){ %>
			  <input type="checkbox" id="check_btnn<%=i%>" name="color" value="<%=i%>"/>
			  <label for="check_btnn<%=i%>"><span></span></label>
			<%} %>



			<div>
					<span>꿈 성격(다중선택가능) : </span> 
					<label for="check_b">발랄함 <input type="checkbox" id="check_b" name="mood" value="20" >
					</label> 
					<label for="check_b">슬픔 <input type="checkbox" id="check_b" name="mood" value="30" >
					</label> 
					<label for="check_b">보통 <input type="checkbox" id="check_b" name="mood" value="40" >
					</label> 
					<label for="check_b">화남 <input type="checkbox" id="check_b" name="mood" value="50" >
					</label>
					<label for="check_b">재밌음 <input type="checkbox" id="check_b" name="mood" value="60">
					</label>
				</div>
				<select name="categoryNo">
					<option value="10">팔기가능</option>
					<option value="20">팔기불가능</option>
				</select>

				<div>
					<input type="hidden" name="writerNo" value="${loginMember.no }">
				</div>

				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" value="${bvo.title }">
				</div>
				
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content"  >${bvo.content }</textarea>
				</div>
				
	
			
			<div>
			<c:if test="${loginMember.no eq bvo.writerNo}">
				<input type="submit" class="btn btn-sm btn-primary" value="수정하기">
				<a  href="${root}/board/bdetail?no=${bvo.no } " class="btn btn-sm btn-primary">취소</a>			
			</c:if>
				<a href="${root}/board/blist" type="button" class="btn btn-sm btn-primary" id="btnList">목록</a>
			</div>
			</form>
		</div>
		
		</div>
		
	</article>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



<br><br><br><br><br><br><br><br><br>


<%@include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>


<script>


function changeView(){
	//viewArea 액티브 클래스 제거
	const viewArea = document.querySelector('.view-area');
	viewArea.classList.remove('active');
	
	//formArea 액티브 클래스 추가
	const formArea = document.querySelector('.form-area');
	formArea.classList.add('active');
}





	const div = document.querySelector('#thumbnail-area');
	
	let imgTag;
	let aTag;
	<c:forEach items="${bvo.attList}" var="fvo">
		//a태그 만들기
		aTag = document.createElement('a');
		//aTag.href = "${root}/board/att/down?ano=${fvo.no}";
		//이미지 요소 만들기
		imgTag = document.createElement('img');
		imgTag.setAttribute("src" , "${root}/${path}/${fvo.changeName}");
		imgTag.setAttribute("alt" , "${fvo.originName}");
		imgTag.setAttribute("width" , "100px");
		imgTag.setAttribute("height" , '100px');

		//a태그 내부에 img 추가
		aTag.appendChild(imgTag);

		//div 안에 a태그 추가
		div.appendChild(aTag);
	</c:forEach>

	
	
	
	
	
	
    const mood = '${bvo.moodStr}';
    const arr = mood.split(",");
    
    for(let i = 0 ; i < arr.length; i++){
        const str = "input[value='" + arr[i] + "']";
        document.querySelector(str).checked = true;
    }
   
    
    const color = '${bvo.colorStr}';
    const arrr = color.split(",");
    
    for(let i = 0 ; i < arrr.length; i++){
        const str = "input[value='" + arrr[i] + "']";
        document.querySelector(str).checked = true;
    }
   
	
	
/*     const uncheckedButtons = document.querySelectorAll('input[type="checkbox"]:not(:checked)');
    uncheckedButtons.forEach((button) => {
        button.style.display = 'none';
    });
    
     */
    
     
     
     
    //댓글
    
    
    	function writeComment(){
		//로그인 안되어있으면 ㄴㄴ
		const writerNo = '${loginMember.no}';
		if(writerNo <= 0){
			alert("로그인 후 작성 가능합니다.");
			return;
		}

		//ajax 이용해서 서버에 댓글내용 보내기
		const content = document.querySelector('input[name=comment]').value;
		
		$.ajax({
			url : '${root}/board/reply/write' ,
			type : 'POST' ,
			data : {
				
				'bno' : '${bvo.no}' ,
				'content' : content ,
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

	function loadReply(){

		const commentArea = document.querySelector('#comment-area');
		commentArea.innerHTML = '';
		const writerNo = '${loginMember.no}';

		$.ajax({
			url : '${root}/board/reply/list' ,
			type  : 'get' ,
			data : {
				'bno' : '${bvo.no}'	
			} ,
			dataType : 'json' ,
			success : function(data){
				console.log(data);

				for(let replyVo of data){
					let str = "";
					str += "<div>";
					str += replyVo.content;
					str += "</div>";
					str += "<div>";
					str += "<span>"
					str += replyVo.writerNick;
					str += "</span>"
					if(writerNo == replyVo.writerNo || writerNo == 1 ){
						str += "<button class='btn btn-warning btn-sm' onclick='editReply(" + replyVo.no + ");'>수정</button>";
						str += "<button class='btn btn-danger btn-sm' onclick='deleteReply(" + replyVo.no + ");'>삭제</button>";
					}
					str += "</div>";
					commentArea.innerHTML += str;
				}

			} ,
			error : function(error){
				console.log(error);
			} ,
		});

	}

	
	//댓글 삭제 함수
	function deleteReply(rno){
		
		const result = confirm("삭제 진짜로 ???");
		if(!result){
			return;
		}

		$.ajax({
			url : '${root}/board/reply/delete?rno=' + rno ,
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
			url : '${root}/board/reply/edit' , 
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



	//내글만 삭제 수정가능
	function changeView(){

		//view-area 액티브 클래스 제거
		const viewArea = document.querySelector('.view-area');
		viewArea.classList.remove('active');


		//form-area 액티브 클래스 제거
		const formArea = document.querySelector('.form-area');
		formArea.classList.add('active');
	}

	
	
</script>