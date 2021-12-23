<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section id="sectionMargin">
        <div id="mypage-container" class="flex">
            <div class=" inlineblock overflow" id="mypage-menu">          
                    <h3>MY PAGE</h3>
                    <div class="" id="my-menu" >
                        <ul id="menu-list">
                            <li><a href="">· 나의정보</a></li>
                            <li><a href="">· 정보수정</a></li>
                            <nav class="nav-sub">
                                <li ><a href="">· 클래스</a></li>
                                <ul id="sub-menu">
                                    <li><a>- 운영중인 클래스</a></li>
                                    <li><a>- 운영종료 클래스</a></li>
                                </ul>
                            </nav>
                            <li><a href="">· 회원탈퇴</a></li>
                        </ul>                  
                    </div>
            </div>   
            <div id="mypage-content" class="inlineblock">
                <div class="">
                    <img id="info-icon" src="<%=request.getContextPath() %>/img/information.png" width="20px" height="20px" class="inlineblock" style="margin-bottom: 10px;">
                    <h4 class="inlineblock" style="margin-bottom: 0;">나의정보</h4> 
                </div>
                <div class="line"></div>
                <div style="margin-left: 80px;">
                <div class="menu-margin margin-left" id="tutor-img" >
                    <div class="info-title inlineblock"><span class="margin-right menu-list-name">사진</span></div>
                    <div class="info-content inlineblock"><img src="<%=request.getContextPath() %>/img/김수현.jpg"></div>
                </div>
                <div class="menu-margin margin-left" id="tutor-email" >
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">이메일</span></div>
                        <div class="info-content inlineblock"><input type="text" readonly name="" placeholder="prince@naver.com" class="placeholder-center" size="25"></div>
                </div>
                <div class="menu-margin margin-left" id="tutor-name">
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">이름</span></div>
                        <div class="info-content inlineblock"><input type="text"  readonly name="" placeholder="김수현" class="placeholder-center" size="25"></div>
                </div> 
                <div class="menu-margin margin-left" id="tutor-nick">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">닉네임</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="text"  readonly name="" placeholder="도민준" class="placeholder-center " size="25">
                        </div>
                </div> 
                <div class="menu-margin margin-left" id="tutor-phone">
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">전화번호</span></div>
                        <div class="info-content inlineblock">
                            <input type="text"  readonly name="" placeholder="010-3788-3333" class="placeholder-center" size="25">
                        </div>
                </div> 
                <div class="menu-margin margin-left" id="tutor-gender">
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name ">성별</span></div>
                        <div class="info-content inlineblock">
                            <label>남자<input value="man" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled checked></label>
                            <label>여자<input value="woman" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled></label>
                            <!--DB에서 남자면 여자 disabled 여자면 남자 disabled -->
                        </div>
                </div> 
                <div class="menu-margin margin-left flex" id="tutor-marketing" >
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">마케팅 정보수신</span>
                        </div>
                        <div class="info-content inlineblock"></div>
                        <div class="toggle" id="marketingBtn">
                            <input type="checkbox" name="toggle1" id="toggle1" value="on" onclick="return false;" checked>
                            <label for="toggle1"></label>
                        </div>
                        <div id="onOff"></div>
                </div>  
                </div>
                <div class="line"></div>
            </div>
        </div>
    </section>
    <%@ include file="/views/common/footer.jsp"%>
<script>
 	// 마이클래스 서브메뉴!!
    $("#sub-menu").hide();
    $(".nav-sub").mouseenter(e=>{
        $("#sub-menu").show();
    })  
    $(".nav-sub").mouseleave(e=>{
        $("#sub-menu").hide();
    });

    const check=document.getElementById("toggle1");
    if(check.checked){
            $("#onOff").html("on").css({"color":"#94D5DE","font-size":"15px", "font-weight":"bold"});
        }else{
            $("#onOff").html("off").css({"color":"black","font-size":"15px", "font-weight":"bold" });
        }
    
</script>