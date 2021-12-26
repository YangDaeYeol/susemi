<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">       
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