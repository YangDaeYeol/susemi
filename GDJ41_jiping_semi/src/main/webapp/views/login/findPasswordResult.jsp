<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
	<section style="margin: 100px auto; text-align: center">
		<main class="form-signin">
			<form>           
				<h4 class="h4 fw-normal ws-4">
				    입력하신 이메일로 <br>
				    임시 비밀번호가 전송되었습니다.<br><br>
				    로그인 후 임시 비밀번호를<br> 
					꼭 변경해주세요
				</h4>    
				<button class="w-100 btn btn-lg btn_mint mb-3 mt-5" type="submit">확인</button>    
			</form>
		</main>
	</section>
<%@ include file="/views/common/footer.jsp" %>