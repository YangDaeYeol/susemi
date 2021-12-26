<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%
	List<String> list = (List)request.getAttribute("nickList");
	String Nickname = "";
	for(String s : list) {
		Nickname += s + ",";
	}
	String email = (String)request.getAttribute("email");
	String type = (String)request.getAttribute("type");
%>
<main class="form-signin" id="firstEnroll">
    
    <h4 class="h4 fw-normal">
    로그인하고 지핑에서<br>
    다양한 경험을 만끽해보세요
    </h4>
    <input type="hidden" id="type" value="<%= type %>">
	<div class="email-container">
    	<input type="text" class="form-control" id="email" value="<%= email %>" readonly>
    </div>
    <div class="userName-container">
    	<input type="text" class="form-control" id="userName" placeholder="이름(실명)을 입력해주세요">
    </div>
    <div class="userNickName-container">
      	<input type="text" class="form-control" id="userNickName" placeholder="닉네임을 입력해주세요">
	  	<span class="warningMsg"></span>
    </div>
    <div class="pw-container">
      	<input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요">
		<span class="warningMsg">영문자,숫자,특수기호를 포함한 8자리 이상을 입력해주세요</span>
    </div>
    <div class="pwck-container">
      	<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호를 재입력해주세요">
		<span class="warningMsg"></span>
    </div>

    <button class="w-100 btn btn-lg btn_mint mb-3" id="nextEnroll">다음</button>
</main>
	<script>
	//"^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*#?&])[a-z\d@$!%*#?&]{8,}$"
		$("#secondEnroll").hide();
		let nick = ("<%= Nickname %>").split(",");
		$("#userNickName").focusout(e=> {
			const inputNick = $(e.target).val();
			if(nick.includes(inputNick)) {
				$(e.target).next("span").text("이미 존재하는 닉네임입니다.");
				$(e.target).next("span").css({"color":"red"});
			}else {
				$(e.target).next("span").text("사용 가능한 닉네임입니다.");
    			$(e.target).next("span").css({"color":"green"});
			}
		});
		
		$("#passwordCheck").keyup(e=> {
			const inputPw = $("#password").val();
			let pwCheck = $(e.target).val();
			if(inputPw==pwCheck) {
				$(e.target).next("span").text("비밀번호가 일치합니다.");
				$(e.target).next("span").css({"color":"green"});
			}else {
				$(e.target).next("span").text("비밀번호가 일치하지않습니다.");
				$(e.target).next("span").css({"color":"red"});
			}
		});
		let pwdReg = /"^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*#?&])[a-z\d@$!%*#?&]{8,}$"/;
		$("#nextEnroll").click(e=> {
			const type = $("#type").val();
			const email = $("#email").val();
			const userName = $("#userName").val();
			const nickName = $("#userNickName").val();
			const pwd = $("#password").val();
			const pwdChe = $("#passwordCheck").val();
			if(pwd.length<8) {
				alert("비밀번호는 영문자,숫자,특수기호를 포함한 8자리 이상을 입력해주세요");
			}else {
				if(pwd==pwdChe) {
					$.ajax({
						url : "<%= request.getContextPath() %>/enrolldetail",
						type : "get",
						data : {"type":type,"email":email,"userName":userName,"nickName":nickName,"password":pwd},
						dataType : "html",
						success : data=> {
							$("section").html(data);
						}
					});
				}
			}
		});
	</script>
