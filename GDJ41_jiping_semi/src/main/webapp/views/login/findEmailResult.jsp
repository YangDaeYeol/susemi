<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
<%@ page import="com.jiping.member.model.vo.*" %>
<% 
	Member m = (Member)request.getAttribute("member");
%>    
	<section style="margin: 100px auto; text-align: center">
		<main class="form-signin">
			<form action="<%=request.getContextPath()%>/views/login/loginMain.jsp">
				<h4 class="h4 fw-normal" style="margin: 50px 0 50px 0;">
					등록했던 이메일 주소는<br>
					<%=m.getEmail() %> 입니다.
				</h4>
				<button class="w-100 btn btn-lg btn_mint mb-3 mt-5" type="submit">확인</button>
			</form>
		</main>
	</section>
<%@ include file="/views/common/footer.jsp" %>