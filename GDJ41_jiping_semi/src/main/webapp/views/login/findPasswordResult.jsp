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
        margin-left: 5px;
        margin-bottom: 20px;
        text-align: left;
        color: #c4c4c4;
        
    }
    
    .fs_14{
        font-size: 14px;
    }
    .btn_mint{
        background-color: #94d5de;
        color: white;
    }
    .ws-4{
        word-spacing: -4px;
    }
    
    
    
    </style>
    <section style="margin: 100px auto; text-align: center">
        <main class="form-signin">
          <form>
            
            <h4 class="h4 fw-normal ws-4">
                입력하신 이메일로 <br>
                임시 비밀번호가 전송되었습니다.<br><br>
                로그인 후 임시 비밀번호를<br> 
                꼭 변경해주세요
            </h4>
    
            <button class="w-100 btn btn-lg btn_mint mb-3 mt-5" type="submit">확인</button>
    
          </form>
        </main>
    </section>
<%@ include file="/views/common/footer.jsp" %>