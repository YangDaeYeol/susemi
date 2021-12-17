<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: white;
}

.form-signin {
  width: 100%;
  max-width: 400px;
  padding: 60px 25px 25px 25px;
  margin: auto;
  border: 1px solid #c4c4c4;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

.loginContent{
	margin-left: 10px;
	margin-bottom: 5px;
	float: left;
	color: #c4c4c4;
}

.border-right{
	border-right: 1px solid black;
}
.fs_14{
	font-size: 14px;
}
.btn_mint{
	background-color: #94d5de;
	color: white;
}
.pd_5{
	padding-top: 5px;
	padding-bottom: 5px;
}
a {
	text-decoration: none;
	color: black;
}

.memberType button{
	border: 1px solid black; 
}

/* [라디오 버튼 관련 레이아웃] */
input[type='radio'] {
 display: none;
}


input[type='radio'] + label {
    width: 40%;
    margin: 50px 5px 50px 0px;
	padding: 10px;

    /* [라디오 버튼 선택 (전) 테두리 radius 둥글게] */
    border-radius: 5px;

    /* [라디오 버튼 선택 (전) 배경 색상] */
    background-color: white;

    /* [라디오 버튼 선택 (전) 테두리 색상] */
    border: 1px solid #000000;

    /* [p 태그 수직 정렬 위해 table 선언] */
    display: inline-block;
} 
input[type='radio'] + label p {
    /* [label 내부에 있는 p 태그 속성 지정] */
    display: table-cell;
    text-align: center;
    vertical-align: middle;

    color: #ffffff;
    font-size: 200%;
    font-weight: bold;
}
input[type='radio']:checked + label {
    /* [라디오 버튼이 클릭 되었을 때 배경 색상 변경] */
    background: #94d5de;

    /* [라디오 버튼 선택 (후) 테두리 색상] */
    border: 0cm;

	/* [라디오 버튼 선택 (후) 글자색] */
	color: white;
}   


</style>
<meta charset="UTF-8">
<title>회원 유형 페이지</title>
</head>
 <body class="text-center">
    
	<main class="form-signin">
		<form>

		<h5 class="h4 fw-normal">
		회원 가입할 유형을 <br>
		선택해주세요.
		</h5>

		<div class="memberType">
			<input type="radio" name="memberType" id="normal" value="normal">
			<label for="normal">일반사용자</label>
			<input type="radio" name="memberType" id="tutor" value="tutor">
			<label for="tutor">튜터</label>
		</div>

		<button class="w-100 btn btn-lg btn_mint mb-3" type="submit">확인</button>

		</form>
	</main>
</body>
</html>