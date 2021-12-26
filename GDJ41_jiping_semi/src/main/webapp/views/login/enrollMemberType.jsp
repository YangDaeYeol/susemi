<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String email = (String)request.getAttribute("email"); %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
		<main class="form-signin">
				<h5 class="h4 fw-normal">
					회원 가입할 유형을 <br>
					선택해주세요.
				</h5>
				<div class="memberType">
					<input type="radio" name="memberType" id="normal" value="수강생">
					<label for="normal">일반사용자</label>
					<input type="radio" name="memberType" id="tutor" value="튜터">
					<label for="tutor">튜터</label>
				</div>
				<button class="w-100 btn btn-lg btn_mint mb-3" id="nextEnroll">다음</button>
		</main>
<script>
	let type;
	$("input[type=radio]").click(e=> {
		type = $(e.target).val();
	});
 	$("#nextEnroll").click(e=> {
		$.ajax({
			url : "<%= request.getContextPath() %>/enrollMemberSecond",
			dataType : "html",
			data : {"email":"<%= email %>","type":type},
			success : data => {
				$("section").html(data);
			}
		});
	});
</script>

