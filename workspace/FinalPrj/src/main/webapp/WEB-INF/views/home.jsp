<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <link rel="stylesheet" href="${root}/resources/css/common/home.css">

    <header>
    
    

        <div id="ddsmain0">
            <div class="ddsimg">
                <div class="div_img1" style="float: left; margin-top: 30px; margin-right: 10px;">
                    <img src="${root}/resources/img/ddsremove.png" alt="" width="500px" height="300px"></div>
                <div class="div_img2" style="float: left;">
                    <img src="${root}/resources/img/tree.png" alt="" width="500px" height="450px"></div>
                </div><div style="clear:both"></div>           
                </div>
    </header>
        <div id="ddsmain1">
            <div class="wrap">
                <p>꿈 백화점에 오신것을 환영합니다.</p>
            <div class="video">
                <video src="${root}/resources/img/main2.mp4" autoplay muted></video></div>
            	<article>
                꿈 백화점에서 꿈을 기록하고 판매하고 다른 사람의 꿈도 구경해보세요. 
                <br>전문가와 상담할 수 있는 꿈 채팅방에서 상담할 수 있고, 악몽을 꿨다면 꿈보험에 가입할 수 있습니다.
                <br>또한 숙면을 취할 수 있는 제품을 판매하는 꿈 스토어도 있습니다.
            	</article></div> 
        </div>
        
    <div id="ddsmain2">
        <p class="des">꿈을 왜 기록해야 할까요?</p>
        <section class="ddsmain3">
            <article>
                당신의 꿈은 자신의 개인적인 기억임과 동시에 독특한 특성을 가지고 있습니다. 
                <br>꿈 백화점을 통해 꿈을 기록하고 언제든지 다시 볼 수 있습니다.
                <br>이런 꿈일기를 통해 꿈의 패턴을 인식하고 무의식적인 자아를 발견하도록 도와줍니다.
                <br>또한 꿈일기를 통해 정신적 통찰력을 얻으면서 이것을 개선하는 데 도움이 될 것입니다.
                <br>마음속에 스며 있는 오래된 패턴을 수정함으로써 원하는 사람이 될 수 있습니다.
                <br><br><br><a class="ddslink" href="">꿈일기 게시판</a>
            </article>
                <a href=""><img src="${root}/resources/img/dream.png" alt=""></a>
        </section>
    </div>
    
    <div id="ddsmain3">
        <p class="des">어떤 꿈이 고민이신가요?</p>
        <section class="desdetail">
        	<a class="imglink" href=""><img src="${root}/resources/img/live-chat.png" alt=""></a>
            <article>
                당신의 꿈은 자신의 개인적인 기억임과 동시에 독특한 특성을 가지고 있습니다. 
                <br>꿈 백화점을 통해 꿈을 기록하고 언제든지 다시 볼 수 있습니다.
                <br>이런 꿈일기를 통해 꿈의 패턴을 인식하고 무의식적인 자아를 발견하도록 도와줍니다.
                <br>또한 꿈일기를 통해 정신적 통찰력을 얻으면서 이것을 개선하는 데 도움이 될 것입니다.
                <br>마음속에 스며 있는 오래된 패턴을 수정함으로써 원하는 사람이 될 수 있습니다.
                <br><br><br><a class="ddslink" href="">꿈은영 채팅방</a>
            </article>
        </section>
    </div>
    
    <div id="ddsmain4">
    	<div class="div1">
        <p class="des1">깊은 잠을 자고 싶을 때</p>
        <section class="text1">
            <a class="imglink" href=""><img src="${root}/resources/img/sleep.png" alt=""></a>           
            <article>
                숙면을 위한 침구류를 찾고 계신가요?
                <br>저희 꿈백화점 스토어에 방문해주세요.
                <br>숙면을 위한 제품을 판매하고 있습니다.
            	<br><br><a class="ddslink" href="">꿈스토어</a>
            </article>
        </section>
        </div>
        <div class="div2">
        <p class="des2">악몽으로 괴로울 때</p>
        <section class="text2">
            <a class="imglink" href=""><img src="${root}/resources/img/sign.png" alt=""></a>           
            <article>
                악몽때문에 고통받고 계신가요?
                <br>그렇다면 꿈백화점 꿈보험에 가입해보세요. 
                <br>보험상품은 보험사와 연계하여 제공하고 있습니다.
            	<br><br><a class="ddslink" href="">꿈보험</a>
            </article>
        </section>
        </div>
    </div>
 	<footer><%@ include file="/WEB-INF/views/common/footer.jsp" %></footer>
</body>
</html>