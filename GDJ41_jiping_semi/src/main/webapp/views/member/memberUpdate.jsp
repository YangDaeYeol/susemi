<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	Member m=(Member)request.getAttribute("loginMember");

%>
<%if(loginMember.getMemberGrade().equals("수강생")){ %>
<section>
        <div id="mypage-container" class="flex">
            <div class="inlineblock overflow" id="mypage-menu">          
                    <h3>MY PAGE</h3>
                    <div class="" id="my-menu" >
                        <ul id="menu-list">
                            <li><a href="<%=request.getContextPath()%>/member/mypage.do">· 나의정보</a></li>
                            <li><a href="<%=request.getContextPath()%>/member/updateMember.do">· 정보수정</a></li>
                            <nav class="nav-sub">
                                <li ><a href="">· 마이클래스</a></li>
                                <ul id="sub-menu">
                                    <li><a>- 수강중인 클래스</a></li>
                                    <li><a>- 찜한 클래스</a></li>
                                    <li><a>- 수강완료 클래스</a></li>
                                </ul>
                            </nav>
                            <li><a href="<%=request.getContextPath()%>/member/dropMember.do">· 회원탈퇴</a></li>
                        </ul>                  
                    </div>
            </div>   
            <div id="mypage-content" class="inlineblock">
                <div class="">
                    <img id="info-icon" src="<%=request.getContextPath() %>/img/setting.png" width="20px" height="20px" class="inlineblock" style="margin-bottom: 10px;">
                    <h4 class="inlineblock" style="margin-bottom: 0;">정보수정</h4> 
                </div>
                <div class="line"></div>
                <div style="margin-left: 80px;">
                    <div class="menu-margin margin-left" id="tutor-img" >
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">사진</span></div>
                        <div class="info-content inlineblock"><img src="<%=request.getContextPath() %>/img/<%=m.getProfileImg()%>"></div>
                        <div class="inlineblock" style="margin-left: 10px;"  id="uploadBtn-user">
                            <input type="button" value="기본이미지">
                            <input type="file" name="" id="" value="파일 선택" class="" width="">
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-email" >
                            <div class="info-title inlineblock">
                                <span class="margin-right menu-list-name">이메일</span>
                            </div>
                            <div class="info-content inlineblock">
                                <input type="text" readonly name="" placeholder="<%=m.getEmail() %>" class="placeholder-center" size="25">
                            </div>
                            <div class="inlineblock">
                                <p class="guide">※ 아이디는 변경이 불가능합니다.</p>
                            </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-name">
                            <div class="info-title inlineblock"><span class="margin-right menu-list-name">이름</span></div>
                            <div class="info-content inlineblock"><input type="text"  readonly name="" placeholder="<%=m.getMemberName() %>" class="placeholder-center" size="25"></div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-beforePw">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">현재 비밀번호</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" name=""  class="placeholder-center " size="25">
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-afterPw">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">새로운 비밀번호</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" name=""  class="placeholder-center " size="25">
                        </div>
                        <div class="inlineblock">
                            <p class="guide">※ 대/소문자, 숫자, 특수기호를 포함하여 8글자 이상 입력하세요.</p>
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-pwCheck">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">새로운 비밀번호 확인</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" name=""  class="placeholder-center " size="25">
                        </div>
                        <div class="inlineblock">
                            <button onclick="" style="margin-left: 10px;">비밀번호 확인</button>
                        </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-nick">
                            <div class="info-title inlineblock">
                                <span class="margin-right menu-list-name">닉네임</span>
                            </div>
                            <div class="info-content inlineblock">
                                <input type="text" name="" placeholder="<%=m.getNickname() %>" class="placeholder-center " size="25">
                            </div>
                            <div class="inlineblock">
                                <button onclick="" style="margin-left: 10px;">닉네임 중복 확인</button>
                            </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-phone">
                            <div class="info-title inlineblock"><span class="margin-right menu-list-name">전화번호</span></div>
                            <div class="info-content inlineblock">
                                <input type="text" name="" placeholder="<%=m.getPhone() %>" class="placeholder-center" size="25">
                            </div>
                    </div>
                    <div class="menu-margin margin-left" id="inter-field">
                        <div class="info-title inlineblock" >
                            <span class="margin-right menu-list-name" style="vertical-align: middle; line-height: 150px">관심 분야</span>
                        </div>
                        <div class="info-content inlineblock" style="vertical-align: middle; line-height: 150px">                           
                                <div class="categorydiv flex">
                                    <select name="largeCategory" class="form-select" id="largeCategory">
                                        <option value="0" selected="selected">대분류</option>
                                        <option value="1">취미/공예</option>
                                        <option value="2">액티비티</option>
                                        <option value="3">커리어</option>
                                        <option value="4">디자인</option>
                                    </select>
                                    <select name="smallCategory" class="form-select" id="smallCategory">
                                        <option value="0" selected="selected">소분류</option>
                                        <!-- 취미/공예 -->
                                        <option value="picture" class="sc1">사진/미술</option>
                                        <option value="drawing" class="sc1">드로잉</option>
                                        <option value="cooking" class="sc1">요리/베이킹</option>
                                        <option value="music" class="sc1">음악</option>
                                        <!-- 액티비티 -->
                                        <option value="dance" class="sc2">댄스/무용</option>
                                        <option value="act" class="sc2">연기</option>
                                        <option value="sports" class="sc2">스포츠/레저</option>
                                        <option value="exotic_sports" class="sc2">이색 액티비티</option>
                                        <!-- 커리어 -->
                                        <option value="competency" class="sc3">업무 역량</option>
                                        <option value="marketing" class="sc3">마케팅</option>
                                        <option value="programming" class="sc3">프로그래밍</option>
                                        <option value="certificate" class="sc3">자격증/시험</option>
                                        <option value="employment" class="sc3">취업/이직/진로</option>
                                        <!-- 디자인 -->
                                        <option value="architecturalD" class="sc4">건축</option>
                                        <option value="graphicD" class="sc4">그래픽 디자인</option>
                                        <option value="productD" class="sc4">제품 디자인</option>
                                        <option value="videoD" class="sc4">영상 편집/제작</option>   
                                    </select>
                                </div>
                                
                                <div class="categorydiv flex">
                                    <select name="largeCategory" class="form-select" id="largeCategory">
                                        <option value="0" selected="selected">대분류</option>
                                        <option value="1">취미/공예</option>
                                        <option value="2">액티비티</option>
                                        <option value="3">커리어</option>
                                        <option value="4">디자인</option>
                                    </select>
                                    <select name="smallCategory" class="form-select" id="smallCategory">
                                        <option value="0" selected="selected">소분류</option>
                                        <!-- 취미/공예 -->
                                        <option value="picture" class="sc1">사진/미술</option>
                                        <option value="drawing" class="sc1">드로잉</option>
                                        <option value="cooking" class="sc1">요리/베이킹</option>
                                        <option value="music" class="sc1">음악</option>
                                        <!-- 액티비티 -->
                                        <option value="dance" class="sc2">댄스/무용</option>
                                        <option value="act" class="sc2">연기</option>
                                        <option value="sports" class="sc2">스포츠/레저</option>
                                        <option value="exotic_sports" class="sc2">이색 액티비티</option>
                                        <!-- 커리어 -->
                                        <option value="competency" class="sc3">업무 역량</option>
                                        <option value="marketing" class="sc3">마케팅</option>
                                        <option value="programming" class="sc3">프로그래밍</option>
                                        <option value="certificate" class="sc3">자격증/시험</option>
                                        <option value="employment" class="sc3">취업/이직/진로</option>
                                        <!-- 디자인 -->
                                        <option value="architecturalD" class="sc4">건축</option>
                                        <option value="graphicD" class="sc4">그래픽 디자인</option>
                                        <option value="productD" class="sc4">제품 디자인</option>
                                        <option value="videoD" class="sc4">영상 편집/제작</option>   
                                    </select>
                                </div>
                                <div class="categorydiv flex">
                                    <select name="largeCategory" class="form-select" id="largeCategory">
                                        <option value="0" selected="selected">대분류</option>
                                        <option value="1">취미/공예</option>
                                        <option value="2">액티비티</option>
                                        <option value="3">커리어</option>
                                        <option value="4">디자인</option>
                                    </select>
                                    <select name="smallCategory" class="form-select" id="smallCategory">
                                        <option value="0" selected="selected">소분류</option>
                                        <!-- 취미/공예 -->
                                        <option value="picture" class="sc1">사진/미술</option>
                                        <option value="drawing" class="sc1">드로잉</option>
                                        <option value="cooking" class="sc1">요리/베이킹</option>
                                        <option value="music" class="sc1">음악</option>
                                        <!-- 액티비티 -->
                                        <option value="dance" class="sc2">댄스/무용</option>
                                        <option value="act" class="sc2">연기</option>
                                        <option value="sports" class="sc2">스포츠/레저</option>
                                        <option value="exotic_sports" class="sc2">이색 액티비티</option>
                                        <!-- 커리어 -->
                                        <option value="competency" class="sc3">업무 역량</option>
                                        <option value="marketing" class="sc3">마케팅</option>
                                        <option value="programming" class="sc3">프로그래밍</option>
                                        <option value="certificate" class="sc3">자격증/시험</option>
                                        <option value="employment" class="sc3">취업/이직/진로</option>
                                        <!-- 디자인 -->
                                        <option value="architecturalD" class="sc4">건축</option>
                                        <option value="graphicD" class="sc4">그래픽 디자인</option>
                                        <option value="productD" class="sc4">제품 디자인</option>
                                        <option value="videoD" class="sc4">영상 편집/제작</option>   
                                    </select>
                                </div>                       
                             </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-area">
                        <div class="info-title inlineblock" style="vertical-align: top; line-height: 150px">
                            <span class="margin-right menu-list-name">관심 지역</span>
                        </div>
                        <div class="info-content inlineblock">
                            <div class="location-container " style="vertical-align: middle; line-height: 150px">
                                <div class="locationdiv block">
                                    <form id="nsdiSearchForm" action="#" class="form_data flex" onsubmit="return false;search();">                                        
                                        <select id="sido_code" class="form-select margint-rb-10px"  style="width: 200px;" value="안녕">
                                            <option>선택</option>
                                        </select>
                                        <select id="sigoon_code" class="form-select margint-rb-10px" style="width: 200px;">
                                            <option>선택</option>
                                        </select>
                                    </form>
                                    <form id="nsdiSearchForm2" action="#" class="form_data flex" onsubmit="return false;search();">                                        
                                        <select id="sido_code2" class="form-select margint-rb-10px" style="width: 200px;">
                                            <option>선택</option>
                                        </select>
                                        <select id="sigoon_code2" class="form-select margint-rb-10px" style="width: 200px;">
                                            <option>선택</option>
                                        </select>
                                    </form>
                                    <form id="nsdiSearchForm3" action="#" class="form_data flex" onsubmit="return false;search();">                                        
                                        <select id="sido_code3" class="form-select margint-rb-10px" style="width: 200px;">
                                            <option>선택</option>
                                        </select>
                                        <select id="sigoon_code3" class="form-select margint-rb-10px" style="width: 200px;">
                                            <option>선택</option>
                                        </select>
                                    </form>
                                </div>
                             </div>
                             
                        </div>
                </div>  
                    <div class="menu-margin margin-left" id="tutor-gender">
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name ">성별</span></div>
                        <div class="info-content inlineblock">
                        <%if(m.getGender()=='남') {%>
                          <label>남자<input value="man" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled checked></label>
                          <label>여자<input value="woman" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled></label>
                        <%}else{ %>
                          <label>남자<input value="man" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled></label>
                          <label>여자<input value="woman" type="checkbox" name="gender" class="checkbox1" onclick="checkOnlyOne(this)" disabled checked></label>
                        <%} %>
                        </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-marketing" >
                          <div class="info-title inlineblock">
                          		<span class="margin-right menu-list-name">마케팅 정보수신</span>
                          </div>
                          <div class="info-content inlineblock"></div>
                          <div class="toggle" id="marketingBtn" style="vertical-align: middle;">
                          <%if(m.getMarketing()=='Y'){ %>
                              <input type="checkbox" name="toggle1" id="toggle1" value="on" onclick="return false;" checked>
                              <label for="toggle1"></label>
                          </div>
                          <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                          <%}else{ %>
                          	  <input type="checkbox" name="toggle1" id="toggle1" value="off" onclick="return false;">
                              <label for="toggle1"></label>
	                       </div>
	                       <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                          <%} %>  
                    </div>  
                </div>
                <div class="line"></div>
                <div id="save-info">
                    <button onclick="" id="saveBtn">저장하기</button>
                </div>
            </div>
        </div>
    </section>
<!-- 튜터	정보수정페이지 -->
<%}else{ %>
	<section id="sectionMargin">
        <div id="mypage-container" class="flex">
            <div class="inlineblock overflow" id="mypage-menu">          
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
                    <img id="info-icon" src="<%=request.getContextPath() %>/img/setting.png" width="20px" height="20px" class="inlineblock" style="margin-bottom: 10px;">
                    <h4 class="inlineblock" style="margin-bottom: 0;">정보수정</h4> 
                </div>
                <div class="line"></div>
                <div style="margin-left: 80px;">
                <div class="menu-margin margin-left" id="tutor-img" >
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">사진</span></div>
                        <div class="info-content inlineblock"><img src=" <%=request.getContextPath() %>/img/김수현.jpg"></div>
                        <div class="inlineblock" style="margin-left: 10px;" id="uploadBtn-tutor">
                            <input type="button" value="기본이미지">
                            <input type="file" name="" id="" value="파일 선택" class="" width="">
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-email" >
                            <div class="info-title inlineblock">
                                <span class="margin-right menu-list-name">이메일</span>
                            </div>
                            <div class="info-content inlineblock">
                                <input type="text" readonly name="" placeholder="prince@naver.com" class="placeholder-center" size="25">
                            </div>
                            <div class="inlineblock">
                                <p class="guide">※ 아이디는 변경이 불가능합니다.</p>
                            </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-name">
                            <div class="info-title inlineblock"><span class="margin-right menu-list-name">이름</span></div>
                            <div class="info-content inlineblock"><input type="text"  readonly name="" placeholder="김수현" class="placeholder-center" size="25"></div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-beforePw">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">현재 비밀번호</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" name=""  class="placeholder-center " size="25">
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-afterPw">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">새로운 비밀번호</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" name=""  class="placeholder-center " size="25">
                        </div>
                        <div class="inlineblock">
                            <p class="guide">※ 대/소문자, 숫자, 특수기호를 포함하여 8글자 이상 입력하세요.</p>
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-pwCheck">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">새로운 비밀번호 확인</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" name=""  class="placeholder-center " size="25">
                        </div>
                        <div class="inlineblock">
                            <button onclick="" style="margin-left: 10px;">비밀번호 확인</button>
                        </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-nick">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">닉네임</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="text" name="" placeholder="도민준" class="placeholder-center " size="25">
                        </div>
                        <div class="inlineblock">
                            <button onclick="" style="margin-left: 10px;">닉네임 중복확인</button>
                        </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-phone">
                            <div class="info-title inlineblock"><span class="margin-right menu-list-name">전화번호</span></div>
                            <div class="info-content inlineblock">
                                <input type="text" name="" placeholder="010-3788-3333" class="placeholder-center" size="25">
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
                                <input type="checkbox" name="toggle1" id="toggle1" value="on">
                                <label for="toggle1"></label>
                            </div>
                            <div id="onOff"></div>
                            <div class="inlineblock">
                                <span class="guide" id="marketingInfo">※ 수신 동의 설정 시 다양한 이벤트 및 혜택 정보를 제공받을 수 있습니다.</span>
                            </div>
                    </div>  
                </div>
                <div class="line"></div>
                <div id="save-info">
                    <button onclick="" id="saveBtn">저장하기</button>
                </div>
            </div>
        </div>
    </section>
<%} %>

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
    	        $("#onOff").html("off").css({"color":"black","font-size":"15px", "font-weight":"bold"});
    	    }
    	$("#toggle1").click(e=>{
    	    if(check.checked){
    	        $("#onOff").html("on").css({"color":"#94D5DE","font-size":"15px", "font-weight":"bold"});
    	    }else{
    	        $("#onOff").html("off").css({"color":"black","font-size":"15px", "font-weight":"bold"});
    	    }
    	});
      //주소 api
        $(function(){
           $.ajax({
              type: "get",
              url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIDO_INFO",
              async: false,
              dataType: 'jsonp',
              success: function(data) {
                 let html = "<option>선택</option>";

                 data.response.result.featureCollection.features.forEach(function(f){
                    console.log(f.properties)
                    let 행정구역코드 = f.properties.ctprvn_cd;
                    let 행정구역명 = f.properties.ctp_kor_nm;
                    
                    html +="<option value='"+f.properties.ctprvn_cd+"'>"+f.properties.ctp_kor_nm+"</option>"
                    
                 })
                 
                    $('#sido_code').html(html);
                 $('#sido_code2').html(html);
                    $('#sido_code3').html(html);
                 
              },
              error: function(xhr, stat, err) {}
           });
           
           
           $(document).on("change","#sido_code",function(){
              let thisVal = $(this).val();      

              $.ajax({
                 type: "get",
                 url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
                 data : {attrfilter : 'sig_cd:like:'+thisVal},
                 async: false,
                 dataType: 'jsonp',
                 success: function(data) {
                    let html = "<option>선택</option>";

                    data.response.result.featureCollection.features.forEach(function(f){
                       console.log(f.properties)
                       let 행정구역코드 = f.properties.sig_cd;
                       let 행정구역명 = f.properties.sig_kor_nm;
                       
                       html +="<option value='"+f.properties.sig_cd+"'>"+f.properties.sig_kor_nm+"</option>"
                       
                    })
                       $('#sigoon_code').html(html);
                    
                 },
                 error: function(xhr, stat, err) {}
              });
           });
           
           $(document).on("change","#sigoon_code",function(){ 
              
              let thisVal = $(this).val();      

              $.ajax({
                 type: "get",
                 url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
                 data : {attrfilter : 'emd_cd:like:'+thisVal},
                 async: false,
                 dataType: 'jsonp',
                 success: function(data) {
                    let html = "<option>선택</option>";

                    data.response.result.featureCollection.features.forEach(function(f){
                       console.log(f.properties)
                       let 행정구역코드 = f.properties.emd_cd;
                       let 행정구역명 = f.properties.emd_kor_nm;
                       html +="<option value='"+f.properties.emd_cd+"'>"+f.properties.emd_kor_nm+"</option>"
                       
                    })
                       $('#dong_code').html(html);
                    
                 },
                 error: function(xhr, stat, err) {}
              });

           });

           $(document).on("change","#sido_code2",function(){
              let thisVal = $(this).val();      

              $.ajax({
                 type: "get",
                 url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
                 data : {attrfilter : 'sig_cd:like:'+thisVal},
                 async: false,
                 dataType: 'jsonp',
                 success: function(data) {
                    let html = "<option>선택</option>";

                    data.response.result.featureCollection.features.forEach(function(f){
                       console.log(f.properties)
                       let 행정구역코드 = f.properties.sig_cd;
                       let 행정구역명 = f.properties.sig_kor_nm;
                       
                       html +="<option value='"+f.properties.sig_cd+"'>"+f.properties.sig_kor_nm+"</option>"
                       
                    })
                       $('#sigoon_code2').html(html);
                    
                 },
                 error: function(xhr, stat, err) {}
              });
           });
           
           $(document).on("change","#sigoon_code2",function(){ 
              
              let thisVal = $(this).val();      

              $.ajax({
                 type: "get",
                 url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
                 data : {attrfilter : 'emd_cd:like:'+thisVal},
                 async: false,
                 dataType: 'jsonp',
                 success: function(data) {
                    let html = "<option>선택</option>";

                    data.response.result.featureCollection.features.forEach(function(f){
                       console.log(f.properties)
                       let 행정구역코드 = f.properties.emd_cd;
                       let 행정구역명 = f.properties.emd_kor_nm;
                       html +="<option value='"+f.properties.emd_cd+"'>"+f.properties.emd_kor_nm+"</option>"
                       
                    })
                       $('#dong_code2').html(html);
                    
                 },
                 error: function(xhr, stat, err) {}
              });

           });

           $(document).on("change","#sido_code3",function(){
              let thisVal = $(this).val();      

              $.ajax({
                 type: "get",
                 url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
                 data : {attrfilter : 'sig_cd:like:'+thisVal},
                 async: false,
                 dataType: 'jsonp',
                 success: function(data) {
                    let html = "<option>선택</option>";

                    data.response.result.featureCollection.features.forEach(function(f){
                       console.log(f.properties)
                       let 행정구역코드 = f.properties.sig_cd;
                       let 행정구역명 = f.properties.sig_kor_nm;
                       
                       html +="<option value='"+f.properties.sig_cd+"'>"+f.properties.sig_kor_nm+"</option>"
                       
                    })
                       $('#sigoon_code3').html(html);
                    
                 },
                 error: function(xhr, stat, err) {}
              });
           });
           
           $(document).on("change","#sigoon_code3",function(){ 
              
              let thisVal = $(this).val();      

              $.ajax({
                 type: "get",
                 url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
                 data : {attrfilter : 'emd_cd:like:'+thisVal},
                 async: false,
                 dataType: 'jsonp',
                 success: function(data) {
                    let html = "<option>선택</option>";

                    data.response.result.featureCollection.features.forEach(function(f){
                       console.log(f.properties)
                       let 행정구역코드 = f.properties.emd_cd;
                       let 행정구역명 = f.properties.emd_kor_nm;
                       html +="<option value='"+f.properties.emd_cd+"'>"+f.properties.emd_kor_nm+"</option>"
                       
                    })
                       $('#dong_code3').html(html);
                    
                 },
                 error: function(xhr, stat, err) {}
              });

           });
        })   

        </script>