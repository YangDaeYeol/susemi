<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.jiping.member.model.vo.*" %>
<% 
	Member m = (Member)request.getAttribute("member");
%>
<style>

    *{
      font-family: "서울남산체";
    }
    
        html,
    body {
      height: 100%;
      
    }
    
    body {
      
      padding-top: 40px;
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
    
    .border-right{
        border-right: 1px solid black;
    }
    .fs_14{
        font-size: 14px;
    }
    .btn_mint{
        background-color: #94d5de;
        color: white;
    }
    
    input::placeholder{
        color: #c4c4c4;
    }
    
    
    
    </style>
    
    <section>
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