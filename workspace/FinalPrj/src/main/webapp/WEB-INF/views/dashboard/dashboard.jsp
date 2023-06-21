<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
  <link rel="stylesheet" href="/dashboard.css">
  <style>
  .body_dashboard{
  text-align: center;
}

.first_container{
  margin: 0 auto;
  width: 70%;
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* 3개의 열을 생성 */
  grid-gap: 20px; /* 간격 설정 */
  
}

.second_container{
  margin: 0 auto;
  width: 70%;
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* 3개의 열을 생성 */
  grid-gap: 20px; /* 간격 설정 */
  
}

.color_container{
  margin: 0 auto;
  width: 10%;
  display: grid;
  grid-template-columns: repeat(10, 1fr); /* 3개의 열을 생성 */
}

.header_div{
  display: flex; /* Flexbox 사용 */
  justify-content: center; /* 수평 중앙 정렬 */
  /* align-items: ; 수직 중앙 정렬 */
  /* height: 100vh; 높이 지정 */
  width: 100%;
}
  
.header_dashboard {
  text-align: center;
  color: pink;
  font-size: 100px;
}
.info_div{
  width: 100%;
  border: 2px solid #000000;
}
.info_color{
  width: 100%;
  height: 12vh;
  border: 2px solid #000000;
  display: flex;
  flex-wrap: wrap;

}
.info_mood{
  width: 100%;
  height: 12vh;
  border: 2px solid #000000;
  display: flex;
  flex-wrap: wrap;

}
.info_emotion{
  width: 100%;
  border: 2px solid #000000;
  display: grid;
  

}

.color{
  width: calc(10%); /* 바둑판 모양으로 10개를 만들기 위해 각 요소의 너비는 (100% / 10) - (좌우 2px * 2) 입니다. */
  height: calc(20%); /* 바둑판 모양으로 5개를 만들기 위해 각 요소의 높이는 (100% / 5) - (상하 2px * 2) 입니다. */
  box-sizing: border-box; /* border-box를 사용해, width와 height 값에 border와 padding 값이 포함되도록 설정합니다. */
  float: left; /* 요소들을 좌측으로 정렬시킵니다. */
  border: 2px solid #000000;
}
.emotion{
  width: 100%;
  float: left; /* 요소들을 좌측으로 정렬시킵니다. */
  border: 2px solid #000000;
}
  
  </style>
</head>
<body class="body_dashboard">
  <div class="header_div"><h1 class="header_dashboard">대시보드</h1></div>

  <div class="info_div">그래프</div>

<hr>

<div class="first_container">
  <div>
    <label>무드</label>
    <div class="info_mood">
      <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
        <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
        <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
        <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
        <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
    </div>
  </div>
  <div>
    <label>컬러: 꿈컬러 순차적 삽입</label>
    <div class="info_color">
        <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
        <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
        <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
        <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
        <div class="color">1</div>
        <div class="color">2</div>
        <div class="color">3</div>
        <div class="color">4</div>
        <div class="color">5</div>
        <div class="color">6</div>
        <div class="color">7</div>
        <div class="color">8</div>
        <div class="color">9</div>
        <div class="color">0</div>
    </div>
  </div>
</div>
<hr>
<div class="second_container">

  <div>
    <label>감정</label>
    <div class="info_emotion">
      <div class="emotion">감정</div>
      <div class="emotion">감정</div>
      <div class="emotion">감정</div>
    </div>
    
  </div>

  <div>
    <div class="info_div">꿈주제</div>
  </div>

  <div>
    <div class="info_div">피플</div>
  </div>

</div>

</body>
</html>