<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<% List<String> list = (List)request.getAttribute("nickList"); %>
	<main class="form-signin">
	  <form>
	    
	    <h4 class="h4 fw-normal">
	    로그인하고 지핑에서<br>
	    다양한 경험을 만끽해보세요
	    </h4>
	
	    <div class="userName-container">
	    	<input type="text" class="form-control" id="userName" placeholder="이름(실명)을 입력해주세요">
	    </div>
	    <button id="zzaass">갑확인</button>
	    <div class="userNickName-container">
	      	<input type="text" class="form-control" id="userNickName" placeholder="닉네임을 입력해주세요">
		  	<span class="warningMsg">이미 사용하고 있는 닉네임입니다.</span>
	    </div>
	    <div class="pw-container">
	      	<input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요">
			<span class="warningMsg">대/소문자,숫자,특수기호를 포함한 8자리 이상을 입력해주세요</span>
	    </div>
	    <div class="pwck-container">
	      	<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호를 재입력해주세요">
			<span class="warningMsg">비밀번호가 일치하지 않습니다.</span>
	    </div>
	
	    <button class="w-100 btn btn-lg btn_mint mb-3" type="submit">다음</button>
		
	  </form>
	</main>
	<script>
		$("#zzaass").click(e=> {
			console.log("zz");
			console.log($("#userName").val());
		});
	</script>
<%@ include file="/views/common/footer.jsp" %>
