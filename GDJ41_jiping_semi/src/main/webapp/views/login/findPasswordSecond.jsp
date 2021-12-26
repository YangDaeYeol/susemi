<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
<%
	String email = (String)request.getAttribute("email");
%>
	<section style="margin: 100px auto; text-align: center">
		<main class="form-signin">
			<form action="<%=request.getContextPath() %>/passwordUpdate" method="post">           
				<div class="pw-container">
			      	<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
					<span class="warningMsg">대/소문자,숫자,특수기호를 포함한 8자리 이상을 입력해주세요</span>
			    </div>
			    <div class="pwck-container">
			      	<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호를 재입력해주세요">
					<span class="warningMsg">비밀번호가 일치하지 않습니다.</span>
			    </div>   
				<button class="w-100 btn btn-lg btn_mint mb-3 mt-5" type="submit">확인</button>    
				<input type="hidden" name="email" value="<%=email%>">
			</form>
			
		</main>
	</section>
<%@ include file="/views/common/footer.jsp" %>