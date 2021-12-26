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
    }
    .pw-container{
        margin-bottom: 50px;
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
    .pd_5{
        padding-top: 5px;
        padding-bottom: 5px;
    }
    a {
        text-decoration: none;
        color: black;
    }
    .warningMsg{
        display:block; 
        text-align: left; 
        margin: 3px 0px 0px 5px; 
        color: red; 
        font-size: 10px;
    }
    
    </style>
    <section style="margin: 100px auto; text-align: center">
        <main class="form-signin">
          <form id="loginFrm" action="<%=request.getContextPath()%>/member/login.do" method="post">           
            <h4 class="h4 fw-normal">
            로그인하고 지핑에서<br>
            다양한 경험을 만끽해보세요
            </h4>        
            <div class="email-container">
                <span class="loginContent fs_14">이메일</span>
                  <input type="email" class="form-control" id="email" name="email" placeholder="이메일 주소를 입력해주세요">               
            </div>
            <div class="pw-container">
                <span class="loginContent fs_14">비밀번호</span>
                  <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
                <!-- <span class="warningMsg">이메일 또는 비밀번호가 일치하지 않습니다.</span> -->
            </div>
        
            <button class="w-100 btn btn-lg btn_mint mb-3" type="submit">로그인</button>
            <div class="row fs_14">
                <div class="col-6 col-md-4 border-right pd_5 likebtn"><a href="<%=request.getContextPath()%>/views/login/findEmail.jsp">아이디 찾기</a></div>
                <div class="col-6 col-md-4 border-right pd_5 likebtn"><a href="<%=request.getContextPath()%>/views/login/findPassword.jsp">비밀번호 찾기</a></div>
                <div class="col-6 col-md-4 pd_5 likeBtn"><a href="">회원가입</a></div>
            </div>
          </form>
        </main>
    </section>
<%@ include file="/views/common/footer.jsp" %>