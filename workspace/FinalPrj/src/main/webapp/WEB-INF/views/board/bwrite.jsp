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
  
/* label:before에 체크 된 상태 CSS */  
input#check_btn<%=i%>:checked + label:before{
  content:"";
  background-color:#<%=colorC[i]%>;
  border-color:#<%=colorC[i]%>;
  background-image: url('check_btn.png');
  background-repeat: no-repeat;
  background-position: 50%;
  }
 
<%}%>
</style>


</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>


	<article>
		<div class="container" role="main">
			<h2>꿈 일기장</h2>
			
			
			
			
			<form name="form" action="${root}/board/bwrite" method="post" >
			
			
			
			
			<%for(int i=0; i<14; i++){ %>
			  <input type="checkbox" id="check_btn<%=i%>" name="color" value="<%=i%>"/>
			  <label for="check_btn<%=i%>"><span></span></label>
			<%} %>



				<div>
					<span>꿈 성격(다중선택가능) : </span> 
					<label>발랄함 <input type="checkbox" name="mood" value="20">
					</label> 
					<label>슬픔 <input type="checkbox" name="mood" value="30">
					</label> 
					<label>보통 <input type="checkbox" name="mood" value="40">
					</label> 
					<label>화남 <input type="checkbox" name="mood" value="50">
					</label>
					<label>재밌음 <input type="checkbox" name="mood" value="60">
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
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
				</div>
				
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				
				<!-- <div class="mb-3">
					<label for="tag">TAG</label>
					<input type="text" class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요">
				</div> -->
				
			<!-- 	<div>
					<label for="thumbnail-tag">사진</label>
					<input id="thumbnail-tag" type="file" name="f" multiple accept=".jpg, .png, .jpeg">
				</div> -->
			
			<div>
				<input type="submit" class="btn btn-sm btn-primary" value="작성하기">
				<a href="${root}/board/blist" type="button" class="btn btn-sm btn-primary" id="btnList">목록</a>
			</div>
			</form>
		</div>
	</article>



<br><br><br><br><br><br><br><br><br>


<%@include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>