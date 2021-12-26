<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
	<section style="margin: 100px auto; text-align: center">
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

