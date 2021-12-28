<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jiping.tutor.model.vo.*" %>
<%
	Tutor t = (Tutor)request.getAttribute("tutor"); 
	List<Certificate> list = (List)request.getAttribute("certificate");
	Certificate[] cerArray = new Certificate[5];
	for(int i=0; i<list.size(); i++) {
		cerArray[i] = list.get(i);
	}
%>
<body>
	<div id="container">
		<%@ include file="/views/common/header.jsp"%>
		<link rel="stylesheet"
			href="<%=request.getContextPath() %>/css/getClassInformation.css">
		<section>
			<%if (!(loginMember==null)) {%>

			<div class="bs-stepper">
				<div class="mainContents">
					<div class="mb-5 p-4 bg-white shadow-sm">
						<h3>클래스 등록</h3>
						<div id="stepper1" class="bs-stepper">
							<div class="bs-stepper-header" role="tablist">
								<div class="step" data-target="#test-l-1">
									<button type="button" class="step-trigger" role="tab"
										id="stepper1trigger1" aria-controls="test-l-1">
										<span class="bs-stepper-circle">1</span> <span
											class="bs-stepper-label">튜터 소개</span>
									</button>
								</div>
								<div class="bs-stepper-line"></div>
								<div class="step" data-target="#test-l-2">
									<button type="button" class="step-trigger" role="tab"
										id="stepper1trigger2" aria-controls="test-l-2">
										<span class="bs-stepper-circle">2</span> <span
											class="bs-stepper-label">클래스 유형</span>
									</button>
								</div>
								<div class="bs-stepper-line"></div>
								<div class="step" data-target="#test-l-3">
									<button type="button" class="step-trigger" role="tab"
										id="stepper1trigger3" aria-controls="test-l-3">
										<span class="bs-stepper-circle">3</span> <span
											class="bs-stepper-label">클래스 제목 및 커버</span>
									</button>
								</div>
								<!-- 클래스 상세 설명 -->
								<div class="bs-stepper-line"></div>
								<div class="step" data-target="#test-l-4">
									<button type="button" class="step-trigger" role="tab"
										id="stepper1trigger4" aria-controls="test-l-4">
										<span class="bs-stepper-circle">4</span> <span
											class="bs-stepper-label">클래스 설명</span>
									</button>
								</div>
								<!-- 기타 -->
								<div class="bs-stepper-line"></div>
								<div class="step" data-target="#test-l-5">
									<button type="button" class="step-trigger" role="tab"
										id="stepper1trigger5" aria-controls="test-l-5">
										<span class="bs-stepper-circle">5</span> <span
											class="bs-stepper-label">기타</span>
									</button>
								</div>
							</div>
							<div class="bs-stepper-content">
								<form enctype="multipart/form-data" method="post"
									onsubmit="return false" id="toSendForm">
									<!-- 여기가 진짜 폼 시작하는곳이야  -->

									<div class="mainContent">
										<div class="first"></div>
										<div class="middle">
											<!-- 폼 내용 START -->
											<div id="test-l-1" role="tabpanel" class="bs-stepper-pane"
												aria-labelledby="stepper1trigger1">
												<div class="form-group">
													<!-- 1. 튜터 소개 본문 내용 시작 -->
													<div>
														<div id="tutorTitle">튜터 소개</div>

														<div>프로필 사진</div>
														<div id="profilePic">얼굴이 나온 튜터님의 사진을 등록해주세요. (png,
															gif, jpeg, jpg만 가능)</div>

<<<<<<< HEAD
														<div class="image-upload">
															<label for="file-input"> <img
																src="https://i.ibb.co/j4n8j8L/2021-12-17-18-59-18.png"
																id="imgTest" alt="2021-12-17-18-59-18" width="100px"
																height="100px" style="border-radius: 50%;">
															</label> <input id="file-input" name="tutorImgFile" type="file"
																accept="image/png, image/gif, image/jpeg, image/jpg">
														</div>
														<div id="resultTutorImg" style="margin-bottom: 30px;"></div>
														<div>튜터의 한마디</div>
														<div id="tutorComment">
															<textarea name="tutorComment" cols="58" rows="5"
																id="tutorIntroduction"
																onkeyup="limit500(event, 'introlimit')"></textarea>
															<div id="introlimit">(0/500)</div>
														</div>
=======
													<div class="image-upload">
														<label for="file-input">
														<% if(!loginMember.getProfileImg().equals("userimg.png")) {%>
														 <img src="<%= request.getContextPath() %>/upload/<%= loginMember.getProfileImg() %>" id="imgTest"
															alt="2021-12-17-18-59-18" width="100px" height="100px" style="border-radius:50%;">
														<% }else { %>
														<img src="https://i.ibb.co/j4n8j8L/2021-12-17-18-59-18.png" id="imgTest"
															alt="2021-12-17-18-59-18" width="100px" height="100px" style="border-radius:50%;">
														<% } %>
														</label> <input id="file-input" name="tutorImgFile" type="file"
															accept="image/png, image/gif, image/jpeg, image/jpg">
													</div>
													<div id="resultTutorImg" style="margin-bottom: 30px;"></div>
													<div>튜터의 한마디</div>
													<div id="tutorComment">
														<textarea name="tutorComment" cols="58" rows="5"
														id="tutorIntroduction"
														onkeyup="limit500(event, 'introlimit')" ><%= t!=null?t.getTutorMsg():"" %></textarea>
														<div id="introlimit">(0/500)</div>
													</div>
>>>>>>> branch 'master' of https://github.com/YangDaeYeol/susemi.git

														<div id="snsInfo">
															<div>
																소셜미디어 <span class="sugg">(권장사항)</span>
															</div>
															<div id="insta">
																<img
																	src="https://thedaylightaward.com/wp-content/uploads/2019/12/instagram-icon.png"
																	alt="instagram" class="socialImg" width="18px"
																	height="18px"><input type="text" name="instaAddr"
																	placeholder="인스타그램 주소를 입력해주세요" class="snsInputBox">
															</div>
															<div id="facebook">
																<img
																	src="https://cdn.worldvectorlogo.com/logos/facebook-icon-1.svg"
																	alt="facebook" class="socialImg" width="18px"
																	height="18px"><input type="text"
																	name="facebookAddr" placeholder="페이스북 주소를 입력해주세요"
																	class="snsInputBox">
															</div>
															<div id="blog">
																<img src="https://www.coolstay.co.kr/img/main/naver.png"
																	alt="blog" class="socialImg" width="18px" height="18px"><input
																	type="text" name="blogAddr"
																	placeholder="블로그 주소를 입력해주세요" class="snsInputBox">
															</div>
														</div>
<<<<<<< HEAD

=======
														<div id="insta">
															<img
																src="https://thedaylightaward.com/wp-content/uploads/2019/12/instagram-icon.png"
																alt="instagram" class="socialImg" width="18px"
																height="18px"><input type="text" name="instaAddr"
																placeholder="인스타그램 주소를 입력해주세요" class="snsInputBox" value="<%= t!=null?t.getInsta():"" %>">
														</div>
														<div id="facebook">
															<img
																src="https://cdn.worldvectorlogo.com/logos/facebook-icon-1.svg"
																alt="facebook" class="socialImg" width="18px"
																height="18px"><input type="text"
																name="facebookAddr" placeholder="페이스북 주소를 입력해주세요"
																class="snsInputBox" value="<%= t!=null?t.getFacebook():"" %>">
														</div>
														<div id="blog">
															<img src="https://www.coolstay.co.kr/img/main/naver.png"
																alt="blog" class="socialImg" width="18px" height="18px"><input
																type="text" name="blogAddr" placeholder="블로그 주소를 입력해주세요"
																class="snsInputBox" value="<%= t!=null?t.getBlog():"" %>">
														</div>
													</div>
													
>>>>>>> branch 'master' of https://github.com/YangDaeYeol/susemi.git

														<div>
															자격증 및 경력 <span class="sugg">(권장사항, 최대 5개)</span>
														</div>
														<div id="toGetCarrerInformation">
															<div class="image-career" id="image-career1">
																<input type="text" name="text-career1"
																	placeholder="입력 후 관련 증빙서류를 첨부파일로 업로드 해주세요. (png, gif, jpeg, jpg만 가능)"
																	class="careerInputBox" value="<%= cerArray[0]!=null?cerArray[0].getCertificateText():"" %>"> <label
																	class='fileCareerFileInputLabel' for="file-career1">

																	<img
																	src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeBtr7ihSssh94yDpW4xXAu5LKwD9EL-Mgwpc5ygTkD3IA0Bh4PH8dKGgfdSSw3ts6Lhg&usqp=CAU"
																	alt="2021-12-17-18-59-18" width="18px" height="18px"
																	class="carrerimage" />
																</label> <input id="file-career1" name="file-career1"
																	type="file" value="<%= cerArray[0]!=null?cerArray[0].getCertificateImg():"" %>"
																	accept="image/png, image/gif, image/jpeg, image/jpg" />
															</div>

															<div class="image-career" id="image-career2">
																<input type="text" name="text-career2"
																	placeholder="입력 후 관련 증빙서류를 첨부파일로 업로드 해주세요. (png, gif, jpeg, jpg만 가능)"
																	class="careerInputBox" value="<%= cerArray[1]!=null?cerArray[1].getCertificateText():"" %>"> <label
																	class="fileCareerFileInputLabel" for="file-career2">

																	<img
																	src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeBtr7ihSssh94yDpW4xXAu5LKwD9EL-Mgwpc5ygTkD3IA0Bh4PH8dKGgfdSSw3ts6Lhg&usqp=CAU"
																	alt="2021-12-17-18-59-18" width="18px" height="18px"
																	class="carrerimage"
																	accept="image/png, image/gif, image/jpeg, image/jpg" />
																</label> <input id="file-career2" name="file-career2" value="<%= cerArray[1]!=null?cerArray[1].getCertificateImg():"" %>"
																	type="file" />
															</div>
															<div class="image-career" id="image-career3"
																style="display: none;">
																<input type="text" name="text-career3"
																	placeholder="입력 후 관련 증빙서류를 첨부파일로 업로드 해주세요. (png, gif, jpeg, jpg만 가능)"
																	class="careerInputBox" value="<%= cerArray[2]!=null?cerArray[2].getCertificateText():"" %>"> <label
																	class="fileCareerFileInputLabel" for="file-career3">

																	<img
																	src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeBtr7ihSssh94yDpW4xXAu5LKwD9EL-Mgwpc5ygTkD3IA0Bh4PH8dKGgfdSSw3ts6Lhg&usqp=CAU"
																	alt="2021-12-17-18-59-18" width="18px" height="18px"
																	class="carrerimage"
																	accept="image/png, image/gif, image/jpeg, image/jpg" />
																</label> <input id="file-career3" name="file-career3" value="<%= cerArray[2]!=null?cerArray[2].getCertificateImg():"" %>"
																	type="file" />
															</div>
															<div class="image-career" id="image-career4"
																style="display: none;">
																<input type="text" name="text-career4"
																	placeholder="입력 후 관련 증빙서류를 첨부파일로 업로드 해주세요. (png, gif, jpeg, jpg만 가능)"
																	class="careerInputBox" value="<%= cerArray[3]!=null?cerArray[3].getCertificateText():"" %>"> <label
																	class="fileCareerFileInputLabel" for="file-career4">

																	<img
																	src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeBtr7ihSssh94yDpW4xXAu5LKwD9EL-Mgwpc5ygTkD3IA0Bh4PH8dKGgfdSSw3ts6Lhg&usqp=CAU"
																	alt="2021-12-17-18-59-18" width="18px" height="18px"
																	class="carrerimage"
																	accept="image/png, image/gif, image/jpeg, image/jpg" />
																</label> <input id="file-career4" name="file-career4" value="<%= cerArray[3]!=null?cerArray[3].getCertificateImg():"" %>"
																	type="file" />
															</div>
															<div class="image-career" id="image-career5"
																style="display: none;">
																<input type="text" name="text-career5"
																	placeholder="입력 후 관련 증빙서류를 첨부파일로 업로드 해주세요. (png, gif, jpeg, jpg만 가능)"
																	class="careerInputBox" value="<%= cerArray[4]!=null?cerArray[4].getCertificateText():"" %>"> <label
																	class="fileCareerFileInputLabel" for="file-career5">

																	<img
																	src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeBtr7ihSssh94yDpW4xXAu5LKwD9EL-Mgwpc5ygTkD3IA0Bh4PH8dKGgfdSSw3ts6Lhg&usqp=CAU"
																	alt="2021-12-17-18-59-18" width="18px" height="18px"
																	class="carrerimage"
																	accept="image/png, image/gif, image/jpeg, image/jpg" />
																</label> <input id="file-career5" name="file-career5" value="<%= cerArray[4]!=null?cerArray[4].getCertificateImg():"" %>"
																	type="file" />
															</div>

														</div>
														<div id="addCareer">
															<button onclick="addCareerArea();">+ 이력 추가</button>
														</div>

														<div id="tutorCareerFile"
															style="margin-bottom: 20px; font-size: 12px;"></div>

														<!-- kj 소개 본문 내용 끝 -->
														<button class="pageBtn" onclick="stepper1.next()">다음</button>
													</div>
												</div>
											</div>
											<div id="test-l-2" role="tabpanel" class="bs-stepper-pane"
												aria-labelledby="stepper1trigger2">

												<div class="form-group">
													<!-- 2. 클래스 유형 본문 내용 시작 -->
													<div id="chooseCategory">클래스 유형</div>

													<div id="introBox2">


														<div>
															<input type="radio" id="control_01" name="classType"
																value="1"> <label for="control_01"
																class="selectClass"> 원데이 클래스 </label>
														</div>
														<div>
															<input type="radio" id="control_02" name="classType"
																value="2"> <label for="control_02"
																class="selectClass"> 다회차 클래스 </label>
														</div>
														<div>
															<input type="radio" id="control_03" name="classType"
																value="3"> <label for="control_03"
																class="selectClass"> VOD </label>
														</div>



													</div>
													<!-- 카테고리 선택 -->
													<div id="categoryDiv">카테고리 선택</div>
													<div
														style="display: flex; justify-content: space-between; margin-bottom: 40px;">
														<select name="bigCategory" id="bigCategory"
															class="categoryClass" style="flex-grow: 1;"></select> <select
															name="smallCategory" id="smallCategory"
															style="flex-grow: 1; margin-right: 0;"
															class="categoryClass"></select>
													</div>

													<!-- 클래스 유형 본문 내용 끝 -->
													<div style="display: flex;">
														<button class="pageBtn" style="margin-right: 5px;"
															onclick="stepper1.previous()">이전</button>
														<button class="pageBtn" onclick="stepper1.next()">다음</button>
													</div>
												</div>
											</div>
											<div id="test-l-3" role="tabpanel" class="bs-stepper-pane"
												aria-labelledby="stepper1trigger3">
												<div class="form-group">
													<!-- 3. 클래스 제목 및 커버 본문 내용 시작 -->
													<div id="classTitleHead">클래스 제목</div>
													<div id="classTitle">
														<!-- 텍스트박스 -->

														<div id="classTitleText">
															<input type="text"
																placeholder="튜터님의 클래스를 잘 표현하는 제목을 지어주세요!"
																id="setClassTitle1" name="lectureTitle"
																onkeyup="limit30(event, 'showMeTheLimitOfTitleLength1')">
															<div id="showMeTheLimitOfTitleLength1">(0/30)</div>
														</div>
													</div>

													<!-- <form onsubmit="return false" id="toSendForm"> -->
													<div id="classImgeHead">클래스 이미지</div>
													<div id="classImgContent">이미지 파일만 가능합니다. (png, gif,
														jpeg, jpg)</div>
													<!-- 인풋파일 업로드 시작 -->

													<div id="previewImgcontainer">
														<!-- 이미지 업로드 시작 -->
														<div class="imageUpload">

															<div id="uploadImageBtn">
																<label for="toUploadClassImg" id="classImageUpload">
																	이미지를 선택 <input type="file" name="classImageFiles"
																	id="toUploadClassImg" multiple>

																</label>
															</div>
															<div class="files">
																선택된 이미지
																<table>
																	<ul id="selectedImg"></ul>
																</table>
															</div>



														</div>
														<div id="resultImg"
															style="display: flex; justify-content: center; margin-bottom: 40px;"></div>


														<!-- 이미지 업로드 끝 -->
													</div>
													<!-- 인풋파일 업로드 끝 -->

													<!-- 클래스 제목 및 커버 본문 내용 끝 -->
												</div>
												<div style="display: flex;">
													<button class="pageBtn" style="margin-right: 5px;"
														onclick="stepper1.previous()">이전</button>
													<button class="pageBtn" onclick="stepper1.next()">다음</button>
												</div>
											</div>
											<div id="test-l-4" role="tabpanel" class="bs-stepper-pane"
												aria-labelledby="stepper1trigger4">
												<div class="form-group">
													<!-- 4. 클래스 상새 소게 페이지 -->
													<div class="classDetailHead">클래스 상세 소개</div>
													<div id="classComment1">
														<textarea cols="58" rows="5" id="classIntroduction1"
															name="lectureIntroduce"
															placeholder="ex) 클래스의 목적과 목표 / 다른 클래스와의 차별점"
															style="margin-top: 5px; margin-left: 5px;"
															onkeyup="limit500(event, 'detailInfoLengthLimit1')"></textarea>
														<div id="detailInfoLengthLimit1">(0/500)</div>
													</div>


													<div class="classDetailHead">강의추천 / 비추천 대상</div>
													<div id="classComment2">
														<textarea cols="58" rows="5" id="classIntroduction2"
															name="recommend" placeholder="ex) 이런 사람들에게 추천합니다"
															style="margin-top: 5px; margin-left: 5px;"
															onkeyup="limit500(event, 'detailInfoLengthLimit2')"></textarea>
														<div id="detailInfoLengthLimit2">(0/500)</div>
													</div>


													<div class="classDetailHead">클래스 진행 방식</div>
													<div id="classComment3">
														<textarea cols="58" rows="5" id="classIntroduction3"
															name="curriculum" placeholder="ex) 회차별 커리큘럼"
															style="margin-top: 5px; margin-left: 5px;"
															onkeyup="limit500(event, 'detailInfoLengthLimit3')"></textarea>
														<div id="detailInfoLengthLimit3">(0/500)</div>
													</div>


													<div class="classDetailHead">유의사항</div>
													<div id="classComment4">
														<textarea cols="58" rows="5" id="classIntroduction4"
															name="lectureNotice" placeholder="ex) 유의사항 / 준비물"
															style="margin-top: 5px; margin-left: 5px;"
															onkeyup="limit500(event, 'detailInfoLengthLimit4')"></textarea>
														<div id="detailInfoLengthLimit4">(0/500)</div>
													</div>


													<!-- 클래스 상세 소개 페이지 끝 -->
												</div>
												<div style="display: flex;">
													<button class="pageBtn" style="margin-right: 5px;"
														onclick="stepper1.previous()">이전</button>
													<button class="pageBtn" onclick="stepper1.next()">다음</button>
												</div>
											</div>
											<div id="test-l-5" role="tabpanel" class="bs-stepper-pane"
												aria-labelledby="stepper1trigger5">
												<div class="form-group">
													<!-- 5. 기타 페이지 시작 -->
													<!-- 원데이 시작 -->
													<div id="selectedOnedayClass" style="display: none;">

														<h5 class="classCetegory">원데이 클래스</h5>
														<div class="multipleClassPrice"
															style="padding-bottom: 20px;">
															<div>
																<div class="pricePerClass1">총 클래스 횟수</div>
																<div>
																	<select name="numOfClass1" id="numOfClass1"
																		class="categoryClass"
																		style="flex-grow: 1; margin-bottom: 20px;"
																		onchange="toGetValue(this.value)">
																		<option value="1">1회</option>
																		<option value="2">2회</option>
																		<option value="3">3회</option>
																		<option value="4">4회</option>
																		<option value="5">5회</option>
																		<option value="6">6회</option>
																		<option value="7">7회</option>
																		<option value="8">8회</option>
																		<option value="9">9회</option>
																		<option value="10">10회</option>

																	</select>
																</div>
															</div>
															<!-- 회차에 따라서 펼쳐지는 날짜와 시간들 시작  -->
															<div id="selectMultipleDates0" style="display: block;">
																<div style="padding-top: 20px; margin-bottom: 10px;">
																	<span>1회 날짜 : </span><input type="date"
																		name="classDate0" style="border-radius: 7px;">
																</div>
																<div
																	style="padding-bottom: 20px; border-bottom: 1px solid black;">
																	시작 시간 : <input type="time" name="startTime0"
																		style="border-radius: 7px;">&nbsp;&nbsp; 종료 시간
																	: <input type="time" name="endTime0"
																		style="border-radius: 7px;">
																</div>
															</div>
															<div style="padding-top: 20px;">
																<div class="totalClass1" style="border-bottom: 10px;">
																	회차당 가격(,없이 숫자만 적어주세요)</div>
																<div
																	style="border: 1px solid black; border-radius: 10px; height: 34px; padding-top: 5px; width: 38%;"
																	class="classIntBox" id="inputBoxOfOneDayTimes">
																	<input type="text" class="classIntInputBox"
																		name="onedayClassPrice" id="classTxtBox1"><span
																		class="won">원</span>
																</div>

															</div>
														</div>
														<!-- 가격받기 끝 -->
														<div class="classLocationTitle">클래스 위치</div>
														<div
															style="display: flex; justify-content: space-between; margin-bottom: 10px;">
															<select name="sido1" id="sido1" class="categoryClass"
																style="flex-grow: 1"></select> <select name="gugun1"
																id="gugun1" class="categoryClass" style="flex-grow: 1"></select>
														</div>
														<div id="detailPlace2">
															<input type="text" placeholder="세부 장소를 입력해주세요"
																name="address1" id="setClassTitle4"> <span
																id="showMeTheLimitOfTitleLength3"> (0/50) </span>
														</div>
														<div class="classLocationTitle">최대 참여 인원</div>
														<div
															style="display: flex; justify-content: space-between; margin-bottom: 10px;">
															<select name="peopleNum2" id="peopleNum2"
																class="categoryClass"
																style="flex-grow: 1; margin-bottom: 40px;"></select>
														</div>
														<div style="margin-bottom: 40px;">관리자의 승인 후 클래스가
															등록됩니다.</div>
								</form>
							</div>
							<!-- 원데이 끝 -->
							<div id="selectedMultipleClass" style="display: none;">
								<!-- 다회차 시작 -->
								<h5 class="classCetegory">다회차 클래스</h5>
								<div class="multipleClassPrice"
									style="display: table-cell; vertical-align: middle; padding-bottom: 20px;">
									<div style="display: inline-block;">
										<div class="pricePerClass1">총 클래스 횟수</div>
										<div>
											<select name="numOfClass2" id="numOfClass2"
												class="categoryClass" style="flex-grow: 1"
												onchange="toGetValue2(this.value)">
												<option value="2">2회</option>
												<option value="3">3회</option>
												<option value="4">4회</option>
												<option value="5">5회</option>
												<option value="6">6회</option>
												<option value="7">7회</option>
												<option value="8">8회</option>
												<option value="9">9회</option>
												<option value="10">10회</option>

											</select>
										</div>
									</div>
									<div class="times" style="display: inline-block;"></div>
									<div style="display: inline-block;">
										<div id="selectMultipleDatesTwo0" style="display: block;">
											<div style="padding-top: 20px; margin-bottom: 10px;">
												<span>1회 날짜 : </span><input type="date" name="classDateTwo0"
													style="border-radius: 7px;">
											</div>
											<div
												style="padding-bottom: 20px; border-bottom: 1px solid black;">
												시작 시간 : <input type="time" name="startTimeTwo0"
													style="border-radius: 7px;">&nbsp;&nbsp; 종료 시간 : <input
													type="time" name="endTimeTwo0" style="border-radius: 7px;">
											</div>
										</div>
										<div id="selectMultipleDatesTwo1" style="display: block;">
											<div style="padding-top: 20px; margin-bottom: 10px;">
												<span>2회 날짜 : </span><input type="date" name="classDateTwo1"
													style="border-radius: 7px;">
											</div>
											<div
												style="padding-bottom: 20px; border-bottom: 1px solid black;">
												시작 시간 : <input type="time" name="startTimeTwo1"
													style="border-radius: 7px;">&nbsp;&nbsp; 종료 시간 : <input
													type="time" name="endTimeTwo1" style="border-radius: 7px;">
											</div>
										</div>
										<div class="totalClass1">회차당 가격(,없이 숫자만 적어주세요)</div>
										<div
											style="display: inline-block; border: 1px solid black; border-radius: 10px; height: 34px; padding-top: 5px;"
											class="classIntBox" id="inputBoxOfTimes">
											<input type="text" class="classIntInputBox"
												name="multipleDayClassPrice" id="classTxtBox2" onchange="checkString(e);"><span
												class="won">원</span>
												<script>
												const checkString=(e)=>{
													let inputBox = document.getElementById("classTxtBox2");
													let eng = /[a-zA-Z]/;
													let etc = /[~!@#$%^&*()_+|<>?:{}]/;
													let kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
													alert("???");

												}
												</script>
										</div>
									</div>
								</div>
								<!-- 가격받기 끝 -->
								<div class="classLocationTitle">클래스 위치</div>
								<div
									style="display: flex; justify-content: space-between; margin-bottom: 10px;">
									<select name="sido2" id="sido2" class="categoryClass"
										style="flex-grow: 1"></select> <select name="gugun2"
										id="gugun2" class="categoryClass" style="flex-grow: 1"></select>
								</div>
								<div id="detailPlace1">
									<input type="text" placeholder="세부 장소를 입력해주세요" name="address2"
										id="setClassTitle3"> <span
										id="showMeTheLimitOfTitleLength2"> (0/50) </span>
								</div>
								<div class="classLocationTitle">최대 참여 인원</div>
								<div
									style="display: flex; justify-content: space-between; margin-bottom: 10px;">
									<select name="peopleNum1" id="peopleNum1" class="categoryClass"
										style="flex-grow: 1; margin-bottom: 40px;"></select>
								</div>
								<div style="margin-bottom: 40px;">관리자의 승인 후 클래스가 등록됩니다.</div>
							</div>
							<!-- 다회차 끝 -->
							<!-- VOD 시작 -->
							<div id="selectedVOD" style="display: none;">
								<!-- url주소 / 제목 / 강의내용 입력 디브 -->
								<h5 class="classCetegory">VOD</h5>
								<div class="pricePerClass1">총 클래스 횟수</div>
								<div>
									<select name="numOfClass3" id="numOfClass3"
										class="categoryClass"
										style="flex-grow: 1; margin-bottom: 20px;"
										onchange="toGetVodValue(this.value)">
										<option value="1">1회</option>
										<option value="2">2회</option>
										<option value="3">3회</option>
										<option value="4">4회</option>
										<option value="5">5회</option>
										<option value="6">6회</option>
										<option value="7">7회</option>
										<option value="8">8회</option>
										<option value="9">9회</option>
										<option value="10">10회</option>

									</select>
								</div>
								<div id="selectVodDates0"
									style="padding-bottom: 20px; border-bottom: 1px solid black;">
									<div id="infoPerClass"
										style="margin-bottom: 10px; margin-top: 20px;">1회차 수업 정보
										입력</div>
									<div style="display: flex;">
										<div class="inputVODinfoTxtBox" style="display: flex;">
											<input type="text" placeholder="url주소 입력"
												name="VODurlAddress0" id="inputUrlAddress1"
												class="inputUrlAddress"> <span
												class="vodEachClassUrlAddressLimit"
												id="vodEachClassUrlAddressLimitId1"> (0/50) </span>
										</div>
										<div class="inputVODinfoTxtBox" style="display: flex;">
											<input type="text" id="inputSmallTitle1"
												name="VODTitlePerClass0" placeholder="회차당 제목 입력"
												class="inputSmallTitle"> <span
												class="vodEachClassTitleLimit"> (0/50) </span>
										</div>
									</div>

									<div class="vodEachClassInformationDiv">
										<textarea id="" cols="58" name="vodEachClassInformation0"
											rows="5" placeholder="해당 회차 강의 내용에 대해 설명을 적어주세요"
											class="vodEachClassInformation"></textarea>
										<div class="vodEachClassInfoLimit">(0/200)</div>
									</div>
								</div>



								<!-- url주소 / 제목 / 강의내용 입력 끝 -->
								<!-- 클래스 가격 입력 시작 -->
								<div id="vodClassPrice"
									style="display: table-cell; vertical-align: middle; padding-bottom: 20px; padding-top: 20px">
									<div style="display: inline-block;">
										<div class="pricePerClass1" style="border-bottom: 10px;">클래스
											가격</div>
										<div id="pricePerClass2" class="classIntBox">
											<input type="text" class="classIntInputBox"
												name="vodTotalClassPrice" id="classPri"><span
												class="won">원</span>
										</div>
									</div>
								</div>
								<div style="margin-bottom: 40px;">관리자의 승인 후 클래스가 등록됩니다.</div>
								<!-- 클래스 가격 입력 끝 -->


							</div>
							<!-- VOD 끝 -->





							<!-- 기타 페이지 끝 -->
							<div style="display: flex;">
								<button class="pageBtn" style="margin-right: 5px;"
									onclick="stepper1.previous()">이전</button>
								<button type="button" class="pageBtn" id="submitAllInfo"
									onclick="toSubmit()">제출</button>
							</div>
						</div>
						<!-- 폼 내용 END -->
					</div>
					<div class="last"></div>

				</div>
			</div>
			<!-- </form>이게 진짜 폼 끝이야! -->
	</div>
	</div>
	</div>
	</div>
	</div>
	<%} else { %>
	튜터로 로그인 한 후 이용 가능합니다.
	<%} %>
	</section>
	<%@ include file="/views/common/footer.jsp"%>
	</div>


	<script>

        const area0 = ["시/도 선택", "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"];
        const area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
        const area2 = ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];
        const area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
        const area4 = ["광산구", "남구", "동구", "북구", "서구"];
        const area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
        const area6 = ["남구", "동구", "북구", "중구", "울주군"];
        const area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"];
        const area8 = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
        const area9 = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];
        const area10 = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"];
        const area11 = ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군"];
        const area12 = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
        const area13 = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
        const area14 = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
        const area15 = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
        const area16 = ["서귀포시", "제주시", "남제주군", "북제주군"];

        const category0 = ["대분류", "취미/공예", "액티비티", "커리어", "디자인"];
        const category1 = ["사진", "취미미술", "디지털드로잉", "요리/베이킹", "커피/차/술", "보컬", "악기", "작곡/디제잉"];
        const category2 = ["방송댄스", "연기/무용", "스포츠/레저", "이색 액티비티"];
        const category3 = ["업무역량", "마케팅", "취업/이직/진로", "엑셀", "파워포인트", "스피치", "데이터 분석", "앱개발", "컴퓨터 공학", "자격증/시험"];
        const category4 = ["건축", "그래픽디자인", "UX/UI 디자인", "제품 디자인", "영상편집", "영상제작"];


        // initialize
        $(function () {
        });

        

     // render functions
        const renderFileList = () => {
            let fileMap = state.filesArr.map((file, index) => {
            	console.debug('index ' + index, file)
            	console.debug('index2 ' + index, file.name)
                let suffix = "bytes";
                let size = file.size;
                if (size >= 1024 && size < 1024000) {
                    suffix = "KB";
                    size = Math.round(size / 1024 * 100) / 100;
                } else if (size >= 1024000) {
                    suffix = "MB";
                    size = Math.round(size / 1024000 * 100) / 100;
                }

                return `<li key=${'${index}'}>${'${file.name}'}<span class="file-size">${'${size}'} ${'${suffix}'}</span><i class="material-icons md-48">delete</i></li>`;
            });
            
            console.debug('filemap', fileMap);
            $("#selectedImg").html(fileMap);
        }

        // Multiple images preview in browser
        const imagesPreviewMultiple = function (input, placeToInsertImagePreview) {
            if (input.files) {
                var filesAmount = input.files.length;
                for (i = 0; i < filesAmount; i++) {
                    if (i == 4) {
                        return false;
                    }
                    var reader = new FileReader();

                    reader.onload = function (event) {
                        $($.parseHTML('<img>')).attr('src', event.target.result).attr('width', "150px").attr('height', "100px").appendTo(placeToInsertImagePreview);
                    }
                    reader.readAsDataURL(input.files[i]);
                }
            }

        };
        
      //첨부이미지 파일 이름 보여주기
        const imagesPreview = function (input, placeToInsertImagePreview, id) {
            if (input.files) {
                var filesAmount = input.files.length;
                for (i = 0; i < 1; i++) {
                    var reader = new FileReader();
                    reader.onload = function (event) {
                        $($.parseHTML($("#" + id).val().replace(/.*(\/|\\)/, ''))).appendTo(placeToInsertImagePreview)
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        };

        
        $("input#file-input").on('change', function () {
        	let output = document.getElementById('imgTest');
        	output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
              URL.revokeObjectURL(output.src) // free memory
            }
            imagesPreview(this, '#resultTutorImg', 'file-input');
        });
        
        $("input#file-career1").on('change', function () {
        	imagesPreview(this, "#tutorCareerFile", 'file-career1');
        });
        
        $("input#file-career2").on('change', function () {
        	imagesPreview(this, "#tutorCareerFile", 'file-career2');
        });
        
        $("input#file-career3").on('change', function () {
        	imagesPreview(this, "#tutorCareerFile", 'file-career3');
        });
        
        $("input#file-career4").on('change', function () {
        	imagesPreview(this, "#tutorCareerFile", 'file-career4');
        });
        
        $("input#file-career5").on('change', function () {
        	imagesPreview(this, "#tutorCareerFile", 'file-career5');
        });

        let oneday = document.getElementById("selectedOnedayClass");
        let multi = document.getElementById("selectedMultipleClass");
        let vod = document.getElementById("selectedVOD");
        // 선택한거대로 페이지 뜨게 하는 스크립트
        $("input[id='control_01']").click(function () {
            oneday.style.display = "block";
            multi.style.display = "none";
            vod.style.display = "none";
        });

        $("input[id='control_02']").click(function () {
        	oneday.style.display = "none";
            multi.style.display = "block";
            vod.style.display = "none";
        });

        $("input[id='control_03']").click(function () {
        	oneday.style.display = "none";
            multi.style.display = "none";
            vod.style.display = "block";
        });
        
        
        const limit500 = (e, countLimitinfoId) => {
            
            let inputLength = $(e.target).val().length;
            if (inputLength > 500) {
                Swal.fire({
                    icon: 'error',
                    title: '글자는 500자까지 입력 가능합니다.',
                    text: '다시 입력해주세요.',
                });
                return false;
            }
            $("#" + countLimitinfoId).html("(" + inputLength + "/500)");
        }

        const limit30 = (e, countLimitinfoId) => {
            
            let inputLength = $(e.target).val().length;
            if (inputLength > 30) {
                Swal.fire({
                    icon: 'error',
                    title: '글자는 30자까지 입력 가능합니다.',
                    text: '다시 입력해주세요.',
                });
                return false;
            }
            $("#" + countLimitinfoId).html("(" + inputLength + "/30)");
        }

        // 대분류 선택 박스 초기화
        $("select[name^=bigCategory]").each(function () {
            $selCategory = $(this);
            $.each(eval(category0), function () {
                $selCategory.append("<option value='" + this + "'>" + this + "</option>");
            });
            $selCategory.next().append("<option value=''>소분류</option>");
        });



        // 대분류 선택시 소분류 설정
        $("select[name^=bigCategory]").change(function () {
            var category = "category" + $("option", $(this)).index($("option:selected", $(this))); // 대분류의 소분류 Array
            var $smallCategory = $(this).next(); // 선택영역 소분류 객체
            $("option", $smallCategory).remove(); // 소분류 초기화

            if (category == "category0")
                $smallCategory.append("<option value=''>소분류</option>");
            else {
                $.each(eval(category), function () {
                    $smallCategory.append("<option value='" + this + "'>" + this + "</option>");
                });
            }
        });


        // no react or anything
        let state = {};

        // state management
        const updateState = (newState) => {
            state = { ...state, ...newState };
        }

        // event handlers
        $("#toUploadClassImg").change(function (e) {
            let files = $("#toUploadClassImg")[0].files;
            let filesArr = Array.from(files);
            updateState({ files: files, filesArr: filesArr });
            renderFileList();
        });

        //미리보기 스크립트 시작
        $(".files").on("click", "li>i", function (e) {
            let key = $(this)
                .parent()
                .attr("key");
            let curArr = state.filesArr;
            curArr.splice(key, 1);
            updateState({ filesArr: curArr });
            renderFileList();
        });

        $("#toUploadClassImg").on('change', function () {
            imagesPreviewMultiple(this, "#resultImg");
        });
        //미리보기 스크립트 끝
    </script>

	<script>
        toGetValue = (val) => {
            for (let i = 1; i < 10; i++) {
                let deleteCon = "#selectMultipleDates" + i;
                $("div").remove(deleteCon);
            }
            for (let i = 1; i < val; i++) {
                let dateContainer = $("#selectMultipleDates0").clone();
                dateContainer.attr({ "id": "selectMultipleDates" + i });
                dateContainer.find("input[name='classDate0']").attr({ "name" : "classDate" + i});
                dateContainer.find("input[name='startTime0']").attr({ "name" : "startTime" + i});
                dateContainer.find("input[name='endTime0']").attr({ "name" : "endTime" + i});
                dateContainer.find("span").text((i + 1) + "회 날짜 : ");

                if (i == 1) {
                    $("#selectMultipleDates0").after(dateContainer);
                } else {
                    $("#selectMultipleDates" + (i - 1)).after(dateContainer);
                }
            }
        }
        toGetValue2 = (val) => {
            for (let i = 1; i < 10; i++) {
                let deleteCon = "#selectMultipleDatesTwo" + i;
                $("div").remove(deleteCon);
            }
            for (let i = 1; i < val; i++) {
                let dateContainer = $("#selectMultipleDatesTwo0").clone();
                dateContainer.attr({ "id": "selectMultipleDatesTwo" + i });
                dateContainer.find("input[name='classDateTwo0']").attr({ "name" : "classDateTwo" + i});
                dateContainer.find("input[name='startTimeTwo0']").attr({ "name" : "startTimeTwo" + i});
                dateContainer.find("input[name='endTimeTwo0']").attr({ "name" : "endTimeTwo" + i});
                dateContainer.find("span").text((i + 1) + "회 날짜 : ");

                if (i == 1) {
                    $("#selectMultipleDatesTwo0").after(dateContainer);
                } else {
                    $("#selectMultipleDatesTwo" + (i - 1)).after(dateContainer);
                }
            }
        }
    </script>

	<script>
        $('document').ready(function () {

            // 시/도 선택 박스 초기화

            $("select[name=sido2]").each(function () {
                $selsido = $(this);
                $.each(eval(area0), function () {
                    $selsido.append("<option value='" + this + "'>" + this + "</option>");
                });
                $selsido.next().append("<option value=''>구/군 선택</option>");
            });



            // 시/도 선택시 구/군 설정
            $("select[name^=sido]").change(function () {
                var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
                var $gugun = $(this).next(); // 선택영역 군구 객체
                $("option", $gugun).remove(); // 구군 초기화

                if (area == "area0")
                    $gugun.append("<option value=''>구/군 선택</option>");
                else {
                    $.each(eval(area), function () {
                        $gugun.append("<option value='" + this + "'>" + this + "</option>");
                    });
                }
            });


        });
    </script>

	<script>
        $("#setClassTitle3").keyup(e => {
            let inputLength = $(e.target).val().length;
            if (inputLength > 50) {
                Swal.fire({
                    icon: 'error',
                    title: '글자는 50자까지 입력 가능합니다.',
                    text: '다시 입력해주세요.',
                });
                return false;
            }
            $("#showMeTheLimitOfTitleLength2").html("(" + inputLength + "/50)");


        })
    </script>

	<script>
        $('document').ready(function () {
            // 시/도 선택 박스 초기화

            $("select[name=sido1]").each(function () {
                $selsido = $(this);
                $.each(eval(area0), function () {
                    $selsido.append("<option value='" + this + "'>" + this + "</option>");
                });
                $selsido.next().append("<option value=''>구/군 선택</option>");
            });



            // 시/도 선택시 구/군 설정

            $("select[name=sido1]").change(function () {
                var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
                var $gugun = $(this).next(); // 선택영역 군구 객체
                $("option", $gugun).remove(); // 구군 초기화

                if (area == "area0")
                    $gugun.append("<option value=''>구/군 선택</option>");
                else {
                    $.each(eval(area), function () {
                        $gugun.append("<option value='" + this + "'>" + this + "</option>");
                    });
                }
            });


        });
    </script>

	<script>
        $("#setClassTitle4").keyup(e => {
            let inputLength = $(e.target).val().length;
            if (inputLength > 50) {
                Swal.fire({
                    icon: 'error',
                    title: '글자는 50자까지 입력 가능합니다.',
                    text: '다시 입력해주세요.',
                });
                return false;
            }
            $("#showMeTheLimitOfTitleLength3").html("(" + inputLength + "/50)");


        })
    </script>

	<script>
        var chooseNumOfClassStudent = ["5", "10", "15", "20", "25", "30", "35", "40", "45", "50"];

        $('document').ready(function () {
           
            // 인원 선택 박스에 value값 넣기

            $("select[name=peopleNum1]").each(function () {
                $numberOfppl = $(this);
                $.each(eval(chooseNumOfClassStudent), function () {
                    $numberOfppl.append("<option value='" + this + "'>" + this + "</option>");
                });
            });
            $("select[name=peopleNum2]").each(function () {
                $numberOfppl = $(this);
                $.each(eval(chooseNumOfClassStudent), function () {
                    $numberOfppl.append("<option value='" + this + "'>" + this + "</option>");
                });
            });


        })


    </script>

	<script>

        keyupEvent();
        function keyupEvent() {
            $(".inputVODinfoTxtBox>input[type=text]").keyup(e => {
                let inputLenghth = $(e.target).val().length;
                $(e.target).next("span").text("(" + inputLenghth + "/50)");
                if (inputLenghth > 50) {
                    let temp = $(e.target).val().substring(0, inputLenghth - 1);
                    $(e.target).val(temp);
                    Swal.fire({
                    icon: 'error',
                    title: '글자는 50자까지 입력 가능합니다.',
                    text: '다시 입력해주세요.',
                });
                    $(e.target).focus();
                }
            });
            $(".vodEachClassInformationDiv>textarea").keyup(e => {
                let inputLenghth = $(e.target).val().length;
                $(e.target).next("div").text("(" + inputLenghth + "/200)");
                if (inputLenghth > 200) {
                    let temp = $(e.target).val().substring(0, inputLenghth - 1);
                    $(e.target).val(temp);
                    Swal.fire({
                    icon: 'error',
                    title: '글자는 200자까지 입력 가능합니다.',
                    text: '다시 입력해주세요.',
                });
                    $(e.target).focus();
                }
            });
        }

        toGetVodValue = (val) => {
            for (let i = 1; i < 10; i++) {
                let deleteCon = "#selectVodDates" + i;
                $("div").remove(deleteCon);
            }
            for (let i = 1; i < val; i++) {
                let dateContainer = $("#selectVodDates0").clone();
                dateContainer.attr({ "id": "selectVodDates" + i });
                dateContainer.find("input[name='VODurlAddress0']").attr({ "name" : "VODurlAddress" + i});
                dateContainer.find("input[name='VODTitlePerClass0']").attr({ "name" : "VODTitlePerClass" + i});
                dateContainer.find("textarea[name='vodEachClassInformation0']").attr({ "name" : "vodEachClassInformation" + i});
                
                dateContainer.find("#infoPerClass").text((i + 1) + "회차 수업 정보 입력");

                if (i == 1) {
                    $("#selectVodDates0").after(dateContainer);
                } else {
                    $("#selectVodDates" + (i - 1)).after(dateContainer);
                }
            }
            keyupEvent();
        }
    </script>
	<script>
        var stepper1
        document.addEventListener('DOMContentLoaded', function () {
            stepper1 = new Stepper(document.querySelector('#stepper1'))
        })
		$("#tutorComment>textarea").focus(e => {
            $("#tutorComment").css({ "border": "1px rgb(162, 221, 220) solid" });
        });
        $("#tutorComment>textarea").blur(e => {
            $("#tutorComment").css({ "border": "1px black solid" });
        });
        $("#insta>input").focus(e => {
            $("#insta").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#insta>input").blur(e => {
            $("#insta").css({ "border": "1px black solid" });
        })
        $("#facebook>input").focus(e => {
            $("#facebook").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#facebook>input").blur(e => {
            $("#facebook").css({ "border": "1px black solid" });
        })
        $("#blog>input").focus(e => {
            $("#blog").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#blog>input").blur(e => {
            $("#blog").css({ "border": "1px black solid" });
        })
        $("#image-career1>input").focus(e => {
            $("#image-career1").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#image-career1>input").blur(e => {
            $("#image-career1").css({ "border": "1px black solid" });
        })
        $("#image-career2>input").focus(e => {
            $("#image-career2").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#image-career2>input").blur(e => {
            $("#image-career2").css({ "border": "1px black solid" });
        })
        $("#image-career3>input").focus(e => {
            $("#image-career3").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#image-career3>input").blur(e => {
            $("#image-career3").css({ "border": "1px black solid" });
        })
        $("#image-career4>input").focus(e => {
            $("#image-career4").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#image-career4>input").blur(e => {
            $("#image-career4").css({ "border": "1px black solid" });
        })
        $("#image-career5>input").focus(e => {
            $("#image-career5").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#image-career5>input").blur(e => {
            $("#image-career5").css({ "border": "1px black solid" });
        })
        // 페이지1에 있는 내용 입력시 border설정 끝

        // 페이지2에 있는 내용 입력시 border설정 시작
        $("#classTitleText>input").focus(e => {
            $("#classTitle").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#classTitleText>input").blur(e => {
            $("#classTitle").css({ "border": "1px black solid" });
        })
        // 페이지4에 있는 내용 입력시 border설정 시작
        $("#classComment1>#classIntroduction1").focus(e => {
            $("#classComment1").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#classComment1>#classIntroduction1").blur(e => {
            $("#classComment1").css({ "border": "1px black solid" });
        })
        $("#classComment2>#classIntroduction2").focus(e => {
            $("#classComment2").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#classComment2>#classIntroduction2").blur(e => {
            $("#classComment2").css({ "border": "1px black solid" });
        })
        $("#classComment3>#classIntroduction3").focus(e => {
            $("#classComment3").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#classComment3>#classIntroduction3").blur(e => {
            $("#classComment3").css({ "border": "1px black solid" });
        })
        $("#classComment4>#classIntroduction4").focus(e => {
            $("#classComment4").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#classComment4>#classIntroduction4").blur(e => {
            $("#classComment4").css({ "border": "1px black solid" });
        })
        // 페이지5에 있는 내용 입력시 border설정 시작

        $("#inputBoxOfTimes>#classTxtBox2").focus(e => {
            $("#inputBoxOfTimes").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#inputBoxOfTimes>#classTxtBox2").blur(e => {
            $("#inputBoxOfTimes").css({ "border": "1px black solid" });
        })

        $("#pricePerClass3>#classTxtBox1").focus(e => {
            $("#pricePerClass3").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#pricePerClass3>#classTxtBox1").blur(e => {
            $("#pricePerClass3").css({ "border": "1px black solid" });
        })
        $("#detailPlace2>#detailTxtBox").focus(e => {
            $("#detailPlace2").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#detailPlace2>#detailTxtBox").blur(e => {
            $("#detailPlace2").css({ "border": "1px black solid" });
        })
         $("#detailPlace1>#setClassTitle3").focus(e => {
            $("#detailPlace1").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#detailPlace1>#setClassTitle3").blur(e => {
            $("#detailPlace1").css({ "border": "1px black solid" });
        })
        
        
        $("#inputBoxOfOneDayTimes>#classTxtBox1").focus(e => {
            $("#inputBoxOfOneDayTimes").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#inputBoxOfOneDayTimes>#classTxtBox1").blur(e => {
            $("#inputBoxOfOneDayTimes").css({ "border": "1px black solid" });
        })
         $("#detailPlace2>#setClassTitle4").focus(e => {
            $("#detailPlace2").css({ "border": "1px rgb(162, 221, 220) solid" });
        })
        $("#detailPlace2>#setClassTitle4").blur(e => {
            $("#detailPlace2").css({ "border": "1px black solid" });
        })
        
		var numItems = 3;
        const addCareerArea = () => {
        	
            
            if (numItems == 6) {
                Swal.fire({
                    icon: 'error',
                    title: '자격증 및 경력은 최대 5개까지 작성 가능합니다.'
                });
                return false;
            }
            $("#image-career" + numItems).css("display","block");
            numItems++;
            /* $("#toGetCarrerInformation").append('<div class="image-career" id="image-career' + numItems + '"><input type="text"name="text-career' + numItems + '"placeholder="입력 후 관련 증빙서류를 첨부파일로 업로드 해주세요. (png, gif, jpeg, jpg만 가능)"class="careerInputBox"><label for="file-career"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeBtr7ihSssh94yDpW4xXAu5LKwD9EL-Mgwpc5ygTkD3IA0Bh4PH8dKGgfdSSw3ts6Lhg&usqp=CAU"alt="2021-12-17-18-59-18" width="18px" height="18px"class="carrerimage" /></label><input id="file-career"name="file-career' + numItems + '"type="file"accept="image/png, image/gif, image/jpeg, image/jpg/></div>'); */
        }
        
       const toSubmit = () => {
    	   //toSendForm
    	   //testForm
    	   console.debug('toSubmit');
    	   var form = $('#toSendForm')[0];
    	   console.debug('form', form);
    	   
    	 var data = new FormData(form);
    	   console.debug('data', data);
    	   
    	    const frm = new FormData(form);
	   		const fileInput=$("input[name=classImageFiles]");
	   		for(let i=0; i<fileInput[0].files.length;i++) {
	   			frm.append("upfile"+i,fileInput[0].files[i]);
	   		}
    	   
    	   // FormData의 값 확인 
    	   for (var pair of frm.entries()) { 
   		   	console.debug(pair[0], pair[1]); 
   		   }
    	   
    	    
    	   $.ajax({             
    	   	   type: "POST",          
    	       enctype: 'multipart/form-data',  
    	       url: "<%=request.getContextPath()%>/lecture/enrolllecture.do",        
    	       data: frm,          
    	       processData: false,    
    	       contentType: false,      
    	       cache: false,           
    	       timeout: 600000,       
    	       success:data=>{
    	    		console.log(data);   
    	    	  /*  alert(data>0?"등록성공":"등록실패"); */
    	    	   <%-- window.location.href = "<%=request.getContextPath()%>"; --%>
    	       },error:e=>{
    	    	   console.log(e);
    	    	   console.log(e.responseText);
    	    	   
    	       }   
    	      
	    	});
   		   //return false;
    	  
<%--     	   var url = '<%=request.getContextPath()%>/index.jsp'; //A local page

           function load(url, callback) {
             var xhr = new XMLHttpRequest();

             xhr.onreadystatechange = function() {
               if (xhr.readyState === 4) {
                 callback(xhr.response);
               }
             }

             xhr.open('GET', url, true);
             xhr.send('');  
       		} --%>
       }
       
       

    </script>

</body>
</html>