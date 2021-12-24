<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<style>
    *{
      font-family: "서울남산체";
    }
    
        html,
    body {
      height: 100%;
      
    }
    
    body {
      
      padding-bottom: 40px;
      background-color: white;
      text-align: center;
    }
    
    section{
      margin: 100px auto;
    }
    
    .form-signin {
      width: 400px;
      padding: 60px 15px 25px 15px;
      margin: auto;
      border: 1px solid #c4c4c4;
    }
    
    .form-signin .checkbox {
      font-weight: 400;
    }
    
    .loginContent{
        margin-left: 10px;
        margin-bottom: 5px;
        display: block;
        text-align: left;
        color: #c4c4c4;
    }
    
    .email-container{
        margin-top: 40px;
        margin-bottom: 40px;
        text-align: left;
    }
    .CN-container{
        margin-bottom: 50px;
        text-align: left;
    }
    
    .fs_14{
        font-size: 14px;
    }
    .btn_mint{
        background-color: #94d5de;
        color: white;
    }
    
    input.form {
        display: inline-block;
        width: 70%;
        padding: 0.375rem 0.75rem;
        margin-top: 5px;
        margin-right: 10px;
        font-size: 1rem;
        line-height: 1.5;
        color: #212529;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        appearance: none;
        border-radius: 0.25rem;
        
    }
    
    input::placeholder{
        font-size:12px;
        color: #c4c4c4c4;
    }
    
    .warningMsg{
        display:block; 
        text-align: left; 
        margin: 3px 0px 0px 5px; 
        color: red; 
        font-size: 10px;
    }
    
    </style>
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
        
            <button class="w-100 btn btn-lg btn_mint mb-3" type="submit">확인</button>
            
        </main>
    </section>
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
    			data : {"val" : val},
    			success : data => {
    				alert(data);
    				flag = true;
    				console.log(flag);
    			},
    			error : (a,b,c) => {
    				console.log(a);
    				console.log(b);
    				console.log(c);
    			} 
    		});
    	});
    </script>