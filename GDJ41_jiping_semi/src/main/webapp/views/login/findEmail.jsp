<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
    
    .form-signin {
      width: 400px;
      padding: 60px 15px 25px 15px;
      margin: auto;
      border: 1px solid #c4c4c4;
    }
    
    .form-signin .checkbox {
      font-weight: 400;
    }
    
    .form-signin input[type="text"] {
      margin-bottom: 10px;
      
    }
    
    .loginContent{
        margin-left: 10px;
        margin-bottom: 5px;
        display: block;
        text-align: left;
        color: #c4c4c4;
    }
    
    .userName-container{
        margin-top: 40px;
        margin-bottom: 40px;
        margin-left: 10px;
        text-align: left;
    }
    .phone-container{
        margin-bottom: 50px;
        margin-left: 10px;
        text-align: left;
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
    
    main.form-signin input[type="text"] {
        display: block;
        width: 95%;
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
    
    main.form-signin input::placeholder{
        font-size:12px;
        color: #c4c4c4c4;
    }
    
    main.form-signin input::placeholder{
        color: #c4c4c4;
    }
    
    
    </style>
    
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