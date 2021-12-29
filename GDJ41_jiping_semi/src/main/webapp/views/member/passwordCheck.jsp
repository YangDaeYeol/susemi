<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%

	Member m=(Member)request.getAttribute("loginMember");

%>
<section id="updateSection">
	<div id="mypage-container" class="flex">
		<div class="inlineblock overflow" id="mypage-menu">          
			<h3>MY PAGE</h3>
			<div class="" id="my-menu" >
				<ul id="menu-list">
					<li><a href="<%=request.getContextPath()%>/member/mypage.do?email=<%=m.getEmail()%>">· 나의정보</a></li>
                    <li><a href="<%=request.getContextPath()%>/member/updateMember.do?email=<%=m.getEmail()%>">· 정보수정</a></li>
                    <nav class="nav-sub">
						<li>· 마이클래스</li>
							<ul id="sub-menu">
                            	<li><a href="<%=request.getContextPath()%>/member/myclassIngOff.do?email=<%=m.getEmail()%>">- 수강중인 클래스</a></li>
                                <li><a href="<%=request.getContextPath()%>/member/myclassEnd.do?email=<%=m.getEmail()%>">- 수강완료 클래스</a></li>
                            </ul>
                    </nav>
                    <li><a href="<%=request.getContextPath()%>/member/dropMember.do?email=<%=m.getEmail()%>">· 회원탈퇴</a></li>
				</ul>                  
			</div>
		</div>   
			<div id="mypage-content" class="inlineblock">
				<div class="">
					<img id="info-icon" src="<%=request.getContextPath() %>/img/setting.png" width="20px" height="20px" class="inlineblock" style="margin-bottom: 10px;">
	                <h4 class="inlineblock" style="margin-bottom: 0;">비밀번호 확인</h4> 
	            </div>
            	<div class="line"></div>
                <form action="<%=request.getContextPath()%>/member/passwordCheckEnd.do?email=<%=m.getEmail()%>" id="pwCheckFrm" method="post">    
                    <div class="menu-margin margin-left" id="pwCheck-container">
            			<h4 style="text-align:center; margin-bottom:50px; margin-top:50px;">※ 현재 비밀번호를 확인 후 정보 수정 페이지로 이동이 가능합니다.</h4>
                        <div class="info-title inlineblock">
                            <span class=" menu-list-name">현재 비밀번호</span>
                        </div>
                        <div class=" inlineblock">
                            <input type="password" id="password" name="password"  class="placeholder-center " size="25" required">
                        </div><br>
						<input type="submit" id="pwCheckBtn" value="비밀번호 확인" >                 
                    </div>
                </form>    
				</div>
			</div>
		</div>
	</div>
</section>
<style>
	#pwCheck-container{
	text-align:center;
	}
	#pwCheckBtn{
		margin:0 auto; 
		background-color:#94D5DE; 
		color:white; border:none;
		height:35px;
		border-weight:bold;
		font-size:20px;
		border-radius:3px;
		margin-top:60px;
		margin-bottom:80px;
	}
	#pwCheckBtn:hover{
		background-color:#5fc8d6; 
	}
</style>
<%@ include file="/views/common/footer.jsp"%>


 <script>
<%--  $("#pwCheckBtn").click(e=>{
	location.assign("<%=request.getContextPath()%>/member/passwordCheckEnd.do?email=<%=m.getEmail()%>");
	 
 }); --%>
 <!-- 비밀번호 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->                   
 	$("#newPw").blur(e=>{
 		const str=/^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*#?&])[a-z\d@$!%*#?&]{8,}$/;
 		let password=$("#newPw").val();
 		
 		if(!str.test(password)){                       				                       		
 			alert("영문자, 숫자, 특수기호를 포함하여 8글자 이상 입력하세요.");
 			$("#newPw").val('');
 		}
 	});
 	$("#newPwCheck").blur(e=>{
 		if($("#newPw").val()==$("#newPwCheck").val()){
 			$("#pwCheckMsg").html("새로운 비밀번호 일치").css('color','green');
 		
 		}else{
 			$("#pwCheckMsg").html("새로운 비밀번호 불일치").css('color','red');
 		}
 	});
 <!-- 비밀번호 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --> 
 
	// 마이클래스 서브메뉴!!
   $("#sub-menu").hide();
   $(".nav-sub").mouseenter(e=>{
       $("#sub-menu").show();
   })  
   $(".nav-sub").mouseleave(e=>{
       $("#sub-menu").hide();
   });
</script>		