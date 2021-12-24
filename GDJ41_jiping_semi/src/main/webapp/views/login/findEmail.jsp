<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
	<section style="margin: 100px auto; text-align: center">
		<main class="form-signin">
			<form id="findEmailFrm" action="<%=request.getContextPath() %>/findEmail" method="post">
				<h4 class="h4 fw-normal ws-4">
					회원가입 시 등록했던 <br>
					이름과 휴대폰번호를 <br>
					입력해주세요.
				</h4>
				<div class="userName-container">
					<span class="loginContent fs_14">이름(실명)</span>
					<input type="text" class="form-control" id="userName" name="userName" placeholder="이름(실명)을 입력해주세요">
				</div>
				<div class="phone-container">
					<span class="loginContent fs_14">휴대폰 번호</span>
					<input type="text" class="form-control" id="phone" name="phone" placeholder="-를 제외한 휴대폰 번호를 입력해주세요">
				</div>
				<button class="w-100 btn btn-lg btn_mint mb-3" type="submit">확인</button>
				<h4 class="h4 fw-normal d-none">
					등록했던 이메일 주소는<br>
					OOO@OOO.OOO 입니다.
				</h4>
			</form>
		</main>
	</section>
<%@ include file="/views/common/footer.jsp" %>