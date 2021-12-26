<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
<%
	String msg = (String)request.getAttribute("msg");
%>
	<section style="margin: 100px auto; text-align: center">
		<main class="form-signin">
			<form action="<%=request.getContextPath() %>/member/loginPage.do" method="post">           
				<h4 class="h4 fw-normal ws-4">
				    <%=msg %>
				</h4>    
				<button class="w-100 btn btn-lg btn_mint mb-3 mt-5" type="submit">확인</button>    
			</form>
		</main>
	</section>
<%@ include file="/views/common/footer.jsp" %>