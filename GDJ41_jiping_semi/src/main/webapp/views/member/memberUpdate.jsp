<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	Member m=(Member)request.getAttribute("loginMember");
	Member checkM=(Member)request.getAttribute("nickCheckMember");
	System.out.println(m);
	
	/* 관심분야 */	
		String[] categories;
		String[] largeCategories;
		String[] smallCategories;
		/* if(m.getMemberGrade().equals("수강생")){ */
		categories=m.getMemberCategory().split(",");
		largeCategories=new String[categories.length];
		smallCategories=new String[categories.length];

		for(int i=0; i<categories.length; i++){
			largeCategories[i]=categories[i].substring(0,categories[i].indexOf(" "));
			smallCategories[i]=categories[i].substring(categories[i].indexOf(" ")).trim();
			
			System.out.println(largeCategories[i]);
			System.out.println(smallCategories[i]);
		
		}

	
		/* 관심지역 */
		String[] categories2;
		String[] largeCategories2;
		String[] smallCategories2;
		
		categories2=m.getMemberLocation().split(",");
		largeCategories2=new String[categories2.length];
		smallCategories2=new String[categories2.length];
		
		for(int i=0; i<categories2.length; i++){
			largeCategories2[i]=categories2[i].substring(0,categories2[i].indexOf(" "));
			smallCategories2[i]=categories2[i].substring(categories2[i].indexOf(" ")).trim();
			
			System.out.println(largeCategories2[i]);
			System.out.println(smallCategories2[i]);
		}


%>
<%if(m.getMemberGrade().equals("수강생")){ %>

<section id="updateSection">
        <div id="mypage-container" class="flex">
            <div class="inlineblock overflow" id="mypage-menu">          
                    <h3>MY PAGE</h3>
                    <div class="" id="my-menu" >
                        <ul id="menu-list">
                            <li><a href="<%=request.getContextPath()%>/member/mypage.do?email=<%=m.getEmail()%>">· 나의정보</a></li>
                            <li><a href="<%=request.getContextPath()%>/member/updateMember.do?email=<%=m.getEmail()%>">· 정보수정</a></li>
                            <nav class="nav-sub">
                                <li >· 마이클래스</li>
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
                    <img id="info-icon" src="<%=request.getContextPath() %>/img/setting.png" width="20px" height="20px" class="inlineblock" style="margin-bottom: 10px;">
                    <h4 class="inlineblock" style="margin-bottom: 0;">정보수정</h4> 
                </div>
                <div class="line"></div>
                <div style="margin-left: 80px;">
	            <form id="userUpdateFrm" action="<%=request.getContextPath()%>/member/updateMember.do" method="post">
                    <div class="menu-margin margin-left" id="tutor-img" >
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">사진</span></div>
                        <div class="info-content inlineblock" id="newImg"><img src="<%=request.getContextPath() %>/upload/<%=m.getProfileImg()%>"></div>
                        <div class="inlineblock" style="margin-left: 10px;"  id="uploadBtn-user">
                            <input type="button" value="기본이미지" onclick="deleteImg();">
                            <input type="file" name="profileImg" id="" value="파일 선택" class="" width="">
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
                                <p class="guide">※ 아이디(이메일)는 변경이 불가능합니다.</p>
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
                            <input type="password" id="oriPw" name="oriPw"  class="placeholder-center " size="25">
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-afterPw">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">새로운 비밀번호</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" id="newPw" name="newPw"  class="placeholder-center " size="25">
                        </div>
                        <div class="inlineblock">
                            <p class="guide">※ 영문자, 숫자, 특수기호를 포함하여 8글자 이상 입력하세요.</p>
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-pwCheck">
                        <div class="info-title inlineblock">
                            <span class="margin-right menu-list-name">새로운 비밀번호 확인</span>
                        </div>
                        <div class="info-content inlineblock">
                            <input type="password" id="newPwCheck" name="newPwCheck" class="placeholder-center " size="25">
                        </div>                       
                        <span id="pwCheckMsg"></span>
                        <script>
                        	$("#newPw").blur(e=>{
                        		const str=/^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*#?&])[a-z\d@$!%*#?&]{8,}$/;
                        		let password=$("#newPw").val();
                        		
                        		if(!str.test(password)){                       				                       		
                        			alert("영문자, 숫자, 특수기호를 포함하여 8글자 이상 입력하세요.");
                        			$("#newPw").val('');
                        			/* $("#newPw").focus(); */
                        			
                        		}else{
                        			
                        		}
                        	});
                        	
                        	
                        	$("#newPwCheck").blur(e=>{
                        		if($("#newPw").val()==$("#newPwCheck").val()){
                        			$("#pwCheckMsg").html("새로운 비밀번호 일치").css('color','green');
                        		
                        		}else{
                        			$("#pwCheckMsg").html("새로운 비밀번호 불일치").css('color','red');
                        		
                        		}
                        	});
                        	                                               
                        </script>                                               
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-nick">
                            <div class="info-title inlineblock">
                                <span class="margin-right menu-list-name">닉네임</span>
                            </div>
                            <div class="info-content inlineblock">
                                <input id="newNick" type="text" name="newNick" placeholder="<%=m.getNickname() %>" class="placeholder-center " size="25">
                            </div>
                            <div class="inlineblock">
                                <button id="nickDuplicateBtn" style="margin-left: 10px;">닉네임 중복 확인</button>
                            </div>
                            <%-- <script>
	                            $(()=>{
	                        		$("#nickDuplicateBtn").click(e=>{
	                        			let newNick=$("#newNick").val();
	                        			const url="<%=request.getContextPath()%>/member/nicknameDuplicate.do?nickname=newNick";
	                    				const title="nickDuplicate";
	                    				const style="width=300,height=200";
	                    				open("",title,style);	                        			
	                        		});
                            
                            </script> --%>
                            <script>
                        	$("#nickDuplicateBtn").click(e=>{
                        		let newNick=$("#newNick").val();
                        		console.log(newNick);
                        		open("<%=request.getContextPath()%>/member/nicknameDuplicate.do?newNick=newNick");
                        		/* if(checkM==null){
                        			alert('사용 가능한 닉네임입니다.');
                        			$("#newnickname").focus();                        			
                        		}else{
                        			alert('이미 사용중인 닉네임입니다.');	
                        			$("#newnickname").empty();
                        		}   */                     		
                        	});
                        	
                        		
                        	
                        
                        </script>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-phone">
                            <div class="info-title inlineblock"><span class="margin-right menu-list-name">전화번호</span></div>
                            <div class="info-content inlineblock">
                                <input type="text" id="newPhone" name="newPhone" placeholder="<%=m.getPhone() %>" class="placeholder-center" size="25">
                            </div>
                    </div>
                    <div class="menu-margin margin-left" id="inter-field">
                        <div class="info-title inlineblock" style="vertical-align: top; line-height: 150px">
                            <span class="margin-right menu-list-name">관심 분야</span>
                        </div>
                        <div class="info-content inlineblock">                           
                             <%if(categories.length==3){%>
	                  <%for(int i=0; i<3; i++) {%>
	                  		<div>
		                       <input type="text" readonly name="newLCategory+<%=i%>" placeholder="<%=largeCategories[i]!=null?largeCategories[i]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                       <input type="text" readonly name="newSCategory+<%=i%>" placeholder="<%=smallCategories[i]!=null?smallCategories[i]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
			                 	<%if(i==2){ %>	
		                  		<button style="position:inlineblock;">관심분야 수정하기</button>    
		                  		<%} %>              
	                 		</div>
	                  <%}%>	
                  <%}else if(categories.length==2){%>
                  		<%for(int i=0; i<2; i++){ %>
                   			<div>
		                        <input type="text" readonly name="newLCategory+<%=i%>" placeholder="<%=largeCategories[i]!=null?largeCategories[i]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                        <input type="text" readonly name="newSCategory+<%=i%>" placeholder="<%=smallCategories[i]!=null?smallCategories[i]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                 		</div>	                 		
                       	<%} %>
	                 		<div>
		                        <input type="text" readonly name="newLCategory2" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                        <input type="text" readonly name="newSCategory2" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                 			<button>관심분야 수정하기</button>
	                 		</div>
                  <%}else if(categories.length==1){ %>
                  		<div>
	                       <input type="text" readonly name="newLCategory0" placeholder="<%=largeCategories[0]!=null?largeCategories[0]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                       <input type="text" readonly name="newSCategory0" placeholder="<%=smallCategories[0]!=null?smallCategories[0]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                 	</div>
	                 	<div>
	                       <input type="text" readonly name="newSCategory1" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                       <input type="text" readonly name="newSCategory1" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                 	</div>
	                 	<div>
	                       <input type="text" readonly name="newSCategory2" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                       <input type="text" readonly name="newSCategory2" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                 	   <button>관심분야 수정하기</button>
	                 	</div>
                  <%} %>                                                                                                                     
                        </div>
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-area">
                        <div class="info-title inlineblock" style="vertical-align: top; line-height: 150px">
                            <span class="margin-right menu-list-name">관심 지역</span>
                        </div>
                        <div class="info-content inlineblock">
                            <%if(categories2.length==3){%>
		                  <%for(int i=0; i<3; i++) {%>
		                  		<div>
			                       <input type="text" readonly name="newLLocation+<%=i%>" placeholder="<%=largeCategories2[i]!=null?largeCategories2[i]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
			                       <input type="text" readonly name="newSLocation+<%=i%>" placeholder="<%=smallCategories2[i]!=null?smallCategories2[i]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                 		</div>
					            <button>관심지역 수정하기</button>
		                  <%}%>
	                  
                  	  <%}else if(categories2.length==2){%>
                  		  <%for(int i=0; i<2; i++){ %>
	                   			<div>
			                       <input type="text" readonly name="newLLocation+<%=i%>" placeholder="<%=largeCategories2[i]!=null?largeCategories2[i]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
			                       <input type="text" readonly name="newSLocation+<%=i%>" placeholder="<%=smallCategories2[i]!=null?smallCategories2[i]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                 		</div>	                 		
                       	<%} %>
	                 		<div>
		                       <input type="text" readonly name="newLLocation2" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                       <input type="text" readonly name="newSLocation2" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                 		<button id="abc">관심지역 수정하기</button>
	                 		</div>
	                 	
	                 		
                  	<%}else if(categories2.length==1){ %>
                  		<div>
	                       <input type="text" readonly name="newLLocation0" placeholder="<%=largeCategories2[0]!=null?largeCategories2[0]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                       <input type="text" readonly name="newSLocation0" placeholder="<%=smallCategories2[0]!=null?smallCategories2[0]:"" %>" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                 	</div>
	                 	<div>
	                       <input type="text" readonly name="newLLocation1" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                       <input type="text" readonly name="newSLocation1" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                 	</div>
	                 	<div>
	                       <input type="text" readonly name="newLLocation2" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
	                       <input type="text" readonly name="newSLocation2" placeholder="미선택" class="placeholder-center mypage-category" size="20" style="margin-right:10px; margin-bottom:20px;">
		                 	<button>관심지역 수정하기</button>
	                 	</div>
                  	<%} %>                             
                        </div>
                </div>  
                    <div class="menu-margin margin-left" id="tutor-gender">
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name ">성별</span></div>
                        <div class="info-content inlineblock">
                        <%if(m.getGender().equals("남자")) {%>
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
                              <input type="checkbox" name="toggle1" id="toggle1" value="on"  checked>
                              <label for="toggle1"></label>
                          </div>
                          <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                          <%}else{ %>
                          	  <input type="checkbox" name="toggle1" id="toggle1" value="off" >
                              <label for="toggle1"></label>
	                       </div>
	                       <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                          <%} %>
                    </div>
                     
                </div>
                
                <div class="line"></div>
                <div id="save-info">
                    <button type="submit" id="saveBtn" style="margin-bottom:30px;">저장하기</button>
                </div>
                </form>
                
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
                    <img id="info-icon" src="<%=request.getContextPath() %>/img/setting.png" width="20px" height="20px" class="inlineblock" style="margin-bottom: 10px;">
                    <h4 class="inlineblock" style="margin-bottom: 0;">정보수정</h4> 
                </div>
                <div class="line"></div>
                <div style="margin-left: 80px;">
                <div class="menu-margin margin-left" id="tutor-img" >
                        <div class="info-title inlineblock"><span class="margin-right menu-list-name">사진</span></div>
                        <div class="info-content inlineblock"><img id="deleteImg" src=" <%=request.getContextPath() %>/upload/<%=m.getProfileImg() %>"></div>
                        <div class="inlineblock" style="margin-left: 10px;" id="uploadBtn-tutor">
                            <input type="button" value="기본이미지" onclick="deleteImg();">
                            <input type="file" name="" id="" value="파일 선택" class="" width="">
                        </div>
                    </div>
                    <div class="menu-margin margin-left" id="tutor-email" >
                            <div class="info-title inlineblock">
                                <span class="margin-right menu-list-name">이메일</span>
                            </div>
                            <div class="info-content inlineblock">
                                <input type="text" readonly name="" placeholder="<%=m.getEmail()%>" class="placeholder-center" size="25">
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
                            <input id="newnickname" type="text" name="newNick" placeholder="<%=m.getNickname() %>" class="placeholder-center " size="25">
                        </div>
                        <div class="inlineblock">
                            <button id="nicknameDuplicate" style="margin-left: 10px;">닉네임 중복확인</button>
                        </div>
                        
                    </div> 
                    <div class="menu-margin margin-left" id="tutor-phone">
                            <div class="info-title inlineblock"><span class="margin-right menu-list-name">전화번호</span></div>
                            <div class="info-content inlineblock">
                                <input type="text" name="" placeholder="<%=m.getPhone()%>" class="placeholder-center" size="25">
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
                    <div class="menu-margin margin-left" id="tutor-marketing" >
                          <div class="info-title inlineblock">
                          		<span class="margin-right menu-list-name">마케팅 정보수신</span>
                          </div>
                          <div class="info-content inlineblock"></div>
                          <div class="toggle" id="marketingBtn" style="vertical-align: middle;">
                          <%if(m.getMarketing()=='Y'){ %>
                              <input type="checkbox" name="toggle1" id="toggle1" value="on"  checked>
                              <label for="toggle1"></label>
                          </div>
                          <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                          <%}else{ %>
                          	  <input type="checkbox" name="toggle1" id="toggle1" value="off" >
                              <label for="toggle1"></label>
	                       </div>
	                       <div id="onOff" style="margin: 0px; width: 20px; display: inline-block; margin-left: 10px;"></div>
                          <%} %>
                    </div>  
                </div>
                <div class="line"></div>
                <div id="save-info">
                    <button onclick="updateMember();" id="saveBtn">저장하기</button>
                </div>
            </div>
        </div>
    </section>
<%} %>

<%@ include file="/views/common/footer.jsp"%>
 <script>
 
 	/* 유저 기본이미지로 변경 */
	const deleteImg=()=>{
		$("#newImg").find("img").attr("src","<%=request.getContextPath()%>/upload/userimg.png");		
	}
	/*  */
	
	
	
 	
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

</script>		