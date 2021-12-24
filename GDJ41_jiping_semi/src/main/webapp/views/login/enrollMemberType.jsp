<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>

*{
  font-family: "서울남산체";
}

    html,
body {
  height: 100%;
}

body {
  
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: white;
  text-align: center;
}

section{
  margin: 100px auto;
}

.form-signin {
  width: 400px;
  padding: 60px 15px 25px 15px;
  margin: auto;
  border: 1px solid #c4c4c4;
}

.form-signin .checkbox {
  font-weight: 400;
}

.btn_mint{
	background-color: #94d5de;
	color: white;
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
input[type='radio']:checked + label {
    /* [라디오 버튼이 클릭 되었을 때 배경 색상 변경] */
    background: #94d5de;

    /* [라디오 버튼 선택 (후) 테두리 색상] */
    border: 0cm;

	/* [라디오 버튼 선택 (후) 글자색] */
	color: white;
}   


</style>
<section>
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
</section>
  <script>
	  $("input[type='radio']").click(e=>{
	      console.log($(e.target).val());
        if($(e.target).val()=="tutor"){
            console.log("튜터");
        }else{
          console.log("일반 사용자"); 
        }
	  })
  </script>

<%@ include file="/views/common/footer.jsp" %>

