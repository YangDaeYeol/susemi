<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/views/common/header.jsp"%>     
<%
	Member m=(Member)request.getAttribute("loginMember");
	System.out.println(m);
	
	/* 관심분야 */	
		String[] categories;
		String[] largeCategories;
		String[] smallCategories;
	if(m.getMemberGrade().equals("수강생") && m.getMemberCategory()!=null){
		categories=m.getMemberCategory().split(",");
		largeCategories=new String[categories.length];
		smallCategories=new String[categories.length];

		for(int i=0; i<categories.length; i++){
			largeCategories[i]=categories[i].substring(0,categories[i].indexOf(" "));
			smallCategories[i]=categories[i].substring(categories[i].indexOf(" ")).trim();
			
			System.out.println(largeCategories[i]);
			System.out.println(smallCategories[i]);
			
		}
	}
	
	/* 관심지역 */
	String[] categories2;
	String[] largeCategories2;
	String[] smallCategories2;
	if(m.getMemberGrade().equals("수강생") && m.getMemberLocation()!=null){		
		categories2=m.getMemberLocation().split(",");
		largeCategories2=new String[categories2.length];
		smallCategories2=new String[categories2.length];
		
		for(int i=0; i<categories2.length; i++){
			largeCategories2[i]=categories2[i].substring(0,categories2[i].indexOf(" "));
			smallCategories2[i]=categories2[i].substring(categories2[i].indexOf(" ")).trim();
			
			System.out.println(largeCategories2[i]);
			System.out.println(smallCategories2[i]);
	}
	
		
	}
	
	
	
	
	
%>
<!-- 수강생 마이페이지 -->    
<%if(m.getMemberGrade().equals("수강생")){ %>    
<section id="sectionMargin">
      <div id="mypage-container" class="flex">
          <div class=" inlineblock overflow" id="mypage-menu">          
                  <h3>MY PAGE</h3>
                  <div class="" id="my-menu" >
                      <ul id="menu-list">
                          <li><a href="<%=request.getContextPath()%>/member/mypage.do?email=<%=m.getEmail()%>">· 나의정보</a></li>
                          <li><a href="<%=request.getContextPath()%>/member/updateMember.do?email=<%=m.getEmail()%>">· 정보수정</a></li>
                          <nav class="nav-sub">
                              <li>· 마이클래스</li>
                              <ul id="sub-menu">
                                  <li><a href="<%=request.getContextPath()%>/member/myclassIngOff.do?email=<%=m.getEmail()%>">- 수강중인 클래스</a></li>
                                  <li><a href="<%=request.getContextPath()%>/member/myclassHeart.do?email=<%=m.getEmail()%>">- 찜한 클래스</a></li>
                                  <li><a href="<%=request.getContextPath()%>/member/myclassEnd.do?email=<%=m.getEmail()%>">- 수강완료 클래스</a></li>
                              </ul>
                          </nav>
                          <li><a href="<%=request.getContextPath()%>/member/dropMember.do?email=<%=m.getEmail()%>">· 회원탈퇴</a></li>
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
                  <div class="info-content inlineblock"><img src="<%=request.getContextPath() %>/img/<%=m.getProfileImg()%>"></div>
              </div>
              <div class="menu-margin margin-left" id="tutor-email" >
                      <div class="info-title inlineblock">
                      	<span class="margin-right menu-list-name">이메일</span>
                      </div>
                      <div class="info-content inlineblock">
                      	<input type="text" readonly name="" placeholder="<%=m.getEmail()%>" class="placeholder-center" size="25">
                      </div>
              </div>
              <div class="menu-margin margin-left" id="tutor-name">
                      <div class="info-title inlineblock">
                     		<span class="margin-right menu-list-name">이름</span>
                      </div>
                      <div class="info-content inlineblock">
                      	<input type="text"  readonly name="" placeholder="<%=m.getMemberName()%>" class="placeholder-center" size="25">
                      </div>
              </div> 
              <div class="menu-margin margin-left" id="tutor-nick">
                      <div class="info-title inlineblock">
                          <span class="margin-right menu-list-name">닉네임</span>
                      </div>
                      <div class="info-content inlineblock">
                          <input type="text"  readonly name="" placeholder="<%=m.getNickname()%>" class="placeholder-center " size="25">
                      </div>
              </div> 
              <div class="menu-margin margin-left" id="tutor-phone">
                      <div class="info-title inlineblock"><span class="margin-right menu-list-name">전화번호</span></div>
                      <div class="info-content inlineblock">
                          <input type="text"  readonly name="" placeholder="<%=m.getPhone() %>" class="placeholder-center" size="25">
                      </div>
              </div> 
              <div class="menu-margin margin-left" id="inter-field">
                  <div class="info-title inlineblock" style="vertical-align: top; line-height: 150px">
                  		<span class="margin-right menu-list-name" >관심 분야</span>
                  </div>
                  <div class="info-content inlineblock" >                           
                  <%-- <%if(categories!=null){ %>    
                       <%for(int i=0; i<categories.length; i++) {%>
                       		<div>
	                           <input type="text" readonly name="" placeholder="<%=largeCategories[i] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                           <input type="text" readonly name="" placeholder="<%=smallCategories[i] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                      		</div>
                       <%}
                       
                       }%> --%>
                       <%-- <div>
                           <input type="text" readonly name="" placeholder="<%if(largeCategories[0]==null){ %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                           <input type="text" readonly name="" placeholder="<%=smallCategories[0] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                       </div>
                       <div>
                           <input type="text" readonly name="" placeholder="<%=largeCategories[1] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                           <input type="text" readonly name="" placeholder="<%=smallCategories[1] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                       </div>
                       <div>
                           <input type="text" readonly name="" placeholder="<%=largeCategories[2] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                           <input type="text" readonly name="" placeholder="<%=smallCategories[2] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                       </div>                                                       
                  </div>
              </div> 
              <div class="menu-margin margin-left" id="tutor-area">
                      <div class="info-title inlineblock" style="vertical-align: top; line-height: 150px">
                          <span class="margin-right menu-list-name">관심 지역</span>
                      </div>
                      <div class="info-content inlineblock">
                          <%-- <div>
                               <input type="text" readonly name="" placeholder="<%=largeCategories2[0] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                               <input type="text" readonly name="" placeholder="<%=smallCategories2[0] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                           </div>
                           <div>
                               <input type="text" readonly name="" placeholder="<%=largeCategories2[1] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                               <input type="text" readonly name="" placeholder="<%=smallCategories2[1] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                           </div>
                           <div>
                               <input type="text" readonly name="" placeholder="<%=largeCategories2[2] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                               <input type="text" readonly name="" placeholder="<%=smallCategories2[2] %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
                           </div> --%>
                          
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
	                       <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;">ss</div>
                          <%} %>
                  </div>  
              </div>
              <div class="line"></div>
          </div>
      </div>
</section>
<!-- 튜터 로그인 -->
<%}else { %>
<section id="sectionMargin">
        <div id="mypage-container" class="flex">
            <div class=" inlineblock overflow" id="mypage-menu">          
                    <h3>MY PAGE</h3>
                    <div class="" id="my-menu" >
                        <ul id="menu-list">
                            <li><a href="<%=request.getContextPath()%>/member/mypage.do?email=<%=m.getEmail()%>">· 나의정보</a></li>
                            <li><a href="<%=request.getContextPath()%>/member/updateMember.do?email=<%=m.getEmail()%>">· 정보수정</a></li>
                            <nav class="nav-sub">
                                <li >· 클래스</li>
               	                 <ul id="sub-menu">
                                    <li><a href="<%=request.getContextPath()%>/member/tutorRunClass.do?email=<%=m.getEmail()%>">- 운영중인 클래스</a></li>
                                    <li><a href="<%=request.getContextPath()%>/member/tutorEndClass.do?email=<%=m.getEmail()%>">- 운영종료 클래스</a></li>
                                </ul>
                            </nav>
                            <li><a href="<%=request.getContextPath()%>/member/dropMember.do?email=<%=m.getEmail()%>">· 회원탈퇴</a></li>
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
                    <div class="info-content inlineblock"><img src="<%=request.getContextPath() %>/img/<%=m.getProfileImg() %>"></div>
                </div>
                <div class="menu-margin margin-left" id="tutor-email" >
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">이메일</span></div>
                        <div class="info-content inlineblock"><input type="text" readonly name="" placeholder="<%=m.getEmail() %>" class="placeholder-center" size="25"></div>
                </div>
                <div class="menu-margin margin-left" id="tutor-name">
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">이름</span></div>
                        <div class="info-content inlineblock"><input type="text"  readonly name="" placeholder="<%=m.getMemberName() %>" class="placeholder-center" size="25"></div>
                </div> 
                <div class="menu-margin margin-left" id="tutor-nick">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">닉네임</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="text"  readonly name="" placeholder="<%=m.getNickname() %>" class="placeholder-center " size="25">
                        </div>
                </div> 
                <div class="menu-margin margin-left" id="tutor-phone">
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">전화번호</span></div>
                        <div class="info-content inlineblock">
                            <input type="text"  readonly name="" placeholder="<%=m.getPhone() %>" class="placeholder-center" size="25">
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
	                       <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;">ss</div>
                          <%} %>
                  </div>  
                </div>
                <div class="line"></div>
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
      $("#onOff").html("off").css({"color":"black","font-size":"15px", "font-weight":"bold" });
  }
  
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