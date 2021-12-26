<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
<%
	List<String> list = (List)request.getAttribute("emailList");
	String email = "";
	for(String s : list) {
		email += s + ",";
	}
%>
	<section>
        <main class="form-signin">
            
            <h4 class="h4 fw-normal">
            이메일 인증 후 <br>
            회원 가입이 진행됩니다.
            </h4>
            
            <div class="email-container">
            <span class="loginContent fs_14">이메일 주소</span>
            <input type="email" class="form" id="email" placeholder="인증 받을 이메일 주소를 입력해주세요"><button class="btn btn_mint mb-1" id="sendEmail">번호 전송</button>
            <span class="warningMsg"></span>
            
            </div>
            
            <div class="CN-container">
            <span class="loginContent fs_14">인증 번호</span>
            <input type="text" class="form" id="Certification_Number" placeholder="인증 번호를 입력해주세요"><button class="btn btn_mint mb-1" id="number">인증</button>
            <span class="warningMsg"></span>
            </div>
        
            <button class="w-100 btn btn-lg btn_mint mb-3" id="enrollNext">확인</button>
            
        </main>
    <script>
    	let flag = false;
    	const email = ("<%= email %>").split(",");
    	$("#sendEmail").click(e=> {
    		const val = $("#email").val();
    		if(email.includes(val)) {
    			$(e.target).next("span").text("이미 존재하는 이메일입니다.");
    		}else {
    			$(e.target).next("span").text("입력하신 이메일로 인증번호가 발송되었습니다.");
    			$(e.target).next("span").css({"color":"green"});
    			$.ajax({
    				url : "<%= request.getContextPath() %>/sendEmail",
    				dataType : "get",
    				data : {"val" : val}
    			});
    		}	
    	});
    	$("#number").click(e=> {
    		const val = $("#Certification_Number").val();
    		$.ajax({
    			url : "<%= request.getContextPath() %>/certificationNumber",
    			type : "get",
    			dataType : "json",
    			data : {"val" : val},
    			success : data => {
    				alert(data["msg"]);
    				flag = data["flag"];
    			},
    			error : (a,b,c) => {
    				console.log(a);
    				console.log(b);
    				console.log(c);
    			} 
    		});
    	});
    	$("#enrollNext").click(e=> {
    		if(true) {
    			$.ajax({
    				url : "<%= request.getContextPath() %>/enrollMemberSecond",
    				dataType : "html",
    				success : data => {
    					$("section").html(data);
    				}
    			});
    		}else {
    			alert("이메일인증을 해주세요.");
    		}
    	});
    </script>
    </section>
    <%@ include file="/views/common/footer.jsp" %>
