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
  padding: 60px 15px 25px 15px;
  margin: auto;
  border: 1px solid #c4c4c4;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

.loginContent{
	margin-left: 5px;
	margin-bottom: 20px;
	text-align: left;
	color: #c4c4c4;
	word-spacing: -5px
}

.email-container{
	margin-top: 40px;
	margin-bottom: 40px;
	text-align: left;
}
.CN-container{
	margin-bottom: 50px;
	text-align: left;
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

input.form {
	display: inline-block;
    width: 70%;
    padding: 0.375rem 0.75rem;
    margin-top: 5px;
    margin-right: 10px;
    font-size: 1rem;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    appearance: none;
    border-radius: 0.25rem;
    
}
button {
	display: flex;
	word-spacing: -4px;
}
input::placeholder{
	font-size:12px;
	color: #c4c4c4c4;
}

</style>
<meta charset="UTF-8">
<title>이메일 인증 페이지</title>
</head>
 <body class="text-center">
    
	<main class="form-signin">
	  <form>
	    
	    <h4 class="h4 fw-normal">
	    이메일 인증 후 <br>
	    회원 가입이 진행됩니다.
	    </h4>
		
	    <div class="email-container">
		<span class="loginContent fs_14">이메일 주소</span><br>
	    <input type="email" class="form" id="email" placeholder="인증 받을 이메일 주소를 입력해주세요"><button class="w-25 btn btn_mint mb-1">번호 전송</button>
	    
	    </div>
	    
	    <div class="CN-container">
		<span class="loginContent fs_14">인증 번호</span><br>
	    <input type="text" class="form" id="Certification_Number" placeholder="인증 번호를 입력해주세요"><button class="w-25 btn btn_mint mb-1">인증</button>
	      
	    </div>
	
	    <button class="w-100 btn btn-lg btn_mint mb-3" type="submit">확인</button>
		
	  </form>
	</main>
</body>
</html>