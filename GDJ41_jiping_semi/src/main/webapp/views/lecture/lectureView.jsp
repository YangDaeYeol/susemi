<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.jiping.lecture.model.vo.Lecture,
				com.jiping.lecture.model.vo.LectureContent,
				com.jiping.lecture.model.vo.LectureSchedule,
				com.jiping.lecture.model.vo.LectureImg,
				com.jiping.tutor.model.vo.Tutor,
				com.jiping.member.model.vo.Member,
				com.jiping.tutor.model.vo.Certificate,
				java.util.List " %>
<%
	Lecture le= (Lecture)request.getAttribute("le");
	LectureContent content= (LectureContent)request.getAttribute("content");
	/* LectureSchedule sc = (LectureSchedule)request.getAttribute("schedule"); */
	List<LectureSchedule> list= (List)request.getAttribute("scList");
	List<LectureImg> imgList= (List)request.getAttribute("imgList");
	Tutor tutor=(Tutor)request.getAttribute("tutor");
	Member m=(Member)request.getAttribute("m");
	List<Certificate> cList= (List)request.getAttribute("c");
 	System.out.println("jsp:"+ cList); 

%>

<section>
    <div class="container">
        <div id="mainInfo" class="row">
            <!--보라 1-->
            <div id="left" class="col-7">
                <div id="info_class">
                    <p class="card-text"><small class="text-muted">이 클래스는 <%=le.getLectureType() %>클래스 입니다. </small>
                    </p>
                    <h5 class="card-title">
                        <%=le.getLectureTitle() %>
                    </h5>
                    <!--class="card-title"-->
                     <div class="card">
                        <div class="card-body">
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="<%=request.getContextPath()%>/upload/<%=imgList.get(0).getLectureFileName()%>" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/upload/<%=imgList.get(1).getLectureFileName()%>" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/upload/<%=imgList.get(2).getLectureFileName()%>" class="d-block w-100" alt="...">
                                    </div>
                                </div>
                                <button class="carousel-control-prev" type="button"
                                    data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button"
                                    data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div> 
                        </div>
                    </div>
                </div>

                <div id="info_notice">
                    <h5 class="card-title">클래스 상세소개</h5>
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text">
                                <%=content.getLectureIntroduce() %>
                            </p>
                        </div>
                    </div>
                </div>
                <div id="info_basic">
                    <h5 class="card-title">클래스 진행방식</h5>
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text">
                                <%=content.getCurriculum() %>
                            </p>
                        </div>
                    </div>

                </div>
                <div id="info_recommend">
                    <h5 class="card-title">이런사람에게 추천합니다!</h5>
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text">
                                <%=content.getRecommend() %>
                            </p>
                        </div>
                    </div>

                </div>
                <div id="info_extracost">
                    <h5 class="card-title">잠깐! 이 수업은 준비물이 필요합니다.</h5>
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text">
                                <%=content.getLectureNotice() %>
                            </p>
                        </div>
                    </div>
                </div>
            </div> 
            <!-- -------------- -->

            <div id="right" class="col">
                <div id="tutor" style="margin-top: 39px;">
                    <h5 class="card-title">튜터를 소개합니다!</h5>
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div name="flex-shrink-0">
                                    <img src="<%=request.getContextPath() %>/upload/<%=m.getProfileImg() %>" alt="..." class="img_basic img_tutor">
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <span><%=tutor.getNickname() %> </span><br>
                                    <span>연락처 : <%=tutor.getPhone() %> </span><br>
                                    <a href="<%=tutor.getInsta() %>"><img
                                            src="https://thedaylightaward.com/wp-content/uploads/2019/12/instagram-icon.png"
                                            alt="instagram" class="socialImg">
                                    </a>
                                    <a href="<%=tutor.getFacebook() %>"><img src="https://cdn.worldvectorlogo.com/logos/facebook-icon-1.svg"
                                            alt="facebook" class="socialImg">
                                    </a>
                                    <a href="<%=tutor.getBlog() %>"><img src="https://www.coolstay.co.kr/img/main/naver.png" alt="blog"
                                            class="socialImg">
                                    </a>
                                </div>
                            </div>
                            <br>
                            <div class="flex-grow-1 ms-3">
                                <span>경력</span>
                                <ul>
                                <%for(Certificate c: cList) { %>
                                    <li><%=c.getCertificateText() %></li>
                                <%} %>
                                </ul>
                                <span>튜터의 한마디</span>
                                <p class="tutorbox_info"><%=tutor.getTutorMsg() %></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 금요일 여기 for문이랑 수강신청 구현 -->
                <div id="class_schedule">
                    <h5 class="card-title">수업일정</h5>
                    <div class="list-group">
                        <%for(LectureSchedule lesc: list) { %>
                            <label class="list-group-item">
                                <input id="innerboxcheck" class="form-check-input me-1" type="checkbox" value="<%=lesc.getScheduleNo()%>">
                                <div class="schedule-text">
                                    <span class="class-date">
                                        <%=lesc.getLectureDate() %>
                                    </span>
                                    <span style="padding-left:30px">
                                        <%=lesc.getStartDate()+"-"+lesc.getEndDate() %>
                                    </span>
                                    <br>
                                    <span>
                                        <%=lesc.getLectureAddress() %>
                                    </span>
                                </div>
                                <span class="class-region">
                                    <%=lesc.getLectureLocation() %>
                                </span>
                            </label>
                            <%} %>
                                <div id="scheduleBtn" class="d-flex justify-content-center">
                                    <button id="wish" type="button" class="btn btn-primary btn-lg btn-pink ">♥ 찜 하
                                        기</button>
                                    <button id="apply" type="button" class="btn btn-primary btn-lg btn-basic">수 강 신
                                        청</button>
                                </div>
                    </div>
                </div>
                <div id="class_submit" style="display: none;">
                    <h5 class="card-title">수강신청</h5>
                    <div class="card">
                        <div class="card-body apply">
                            <div id="apply-class">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="schedule-text">
                                            <span id="apply-title" class="class-date">타이틀</span><br>
                                      		<span id="apply-date" class="class-date">날짜 </span>
                                      		<span id="apply-time" style="padding-left:30px"> 시작시간-끝시간</span><br>
                                            <span id="apply-adr">주소</span>
                                        </div>
                                    </div>
                                </div>
                                <div id="applycount">
                                    <h6>수강신청 현황</h6>
                                    <span>14/15</span>
                                </div>
                                <div>
                                    <h6>튜터에게 전하는 말</h6>
                                    <div id="tutor-message">
                                        <textarea id="totutor" class="card msgbox" cols="43" rows="7"
                                            placeholder="예) 초보니까 쉽게 가르쳐주세요!"></textarea>
                                        <div id="check-word-count" style="float: right;">(0/70)</div>
                                    </div>
                                </div>
                                <div>
                                    <p>총 결제금액</p>
                                    <p id="apply-cost" style="float: right;">가격</p>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div>
                        <button type="button" class="btn btn-primary btn-lg btn-basic" style="float: right;">결 제
                            하 기</button>
                    </div>
                </div>
            </div>


            <script>
                let scheduleNo;
                $("input[type=checkbox]").change(e => {
                    scheduleNo = $(e.target).val();
                    console.log(scheduleNo);
                })

                $("#apply").click(e => {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/lecture/scheduleInfo.do",
                        type: "get",
                        dataType: "json",
                        data: { "scheduleNo": scheduleNo },
                        success: data => {
                            const title = $("#apply-title").html("<%=le.getLectureTitle() %>");
                            const date = $("#apply-date").html(data["lectureDate"]);
                            const time = $("#apply-time").html(data["startDate"]+"-"+data["endDate"]);
                            const address= $("#apply-adr").html(data["lectureAddress"]);
                            const cost= $("#apply-cost").html(data["lecturePrice"]);
                            $("#class_submit").show();
                        }
                    })
                });
                
                $("#totutor").keyup(e=>{
                	let length=$(e.target).val().length;
                	$("#check-word-count").html("("+length+"/70)");
                });

            </script> 

            <div id="review" class="row-1">
                <!--보라 2-->
                <div class="line"></div>
                <div class="review-enroll card">
                    <div class="card-body">
                        <!-- -------------------------------------------------- -->
                        <div class="review-head">
                            <div id="title"><%=le.getLectureTitle() %></div>
                            <div id="tutor-review">튜터이름</div>
                        </div>
                        <div id="starrate">
                            <div>
                                <img class="img_basic img_review" src="https://post-phinf.pstatic.net/MjAxOTEyMTJfMTMy/MDAxNTc2MTM4NTc5MjAy.d6qoHmyl15AA4MjNVN7uOMbOJplPrhTktLxfMQXze9Ig.Ui8K9n80tzLCRsYmAK1VGmFxcRJ6-fndALhaNI69n9Ug.JPEG/%EC%A4%80%ED%98%81_%284%29.jpg?type=w1200
                         ">
                                <span>닉네임(로그인한 사람)/결제여부로 분기처리?</span>
                            </div>
                            <div>
                                <fieldset class="rating">
                                    <span>평점:</span>
                                    <input type="radio" id="star5" name="rating" value="5" /><label class="full"
                                        for="star5" title="Awesome - 5 stars"></label>
                                    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half"
                                        for="star4half" title="Pretty good - 4.5 stars"></label>
                                    <input type="radio" id="star4" name="rating" value="4" /><label class="full"
                                        for="star4" title="Pretty good - 4 stars"></label>
                                    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half"
                                        for="star3half" title="Meh - 3.5 stars"></label>
                                    <input type="radio" id="star3" name="rating" value="3" /><label class="full"
                                        for="star3" title="Meh - 3 stars"></label>
                                    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half"
                                        for="star2half" title="Kinda bad - 2.5 stars"></label>
                                    <input type="radio" id="star2" name="rating" value="2" /><label class="full"
                                        for="star2" title="Kinda bad - 2 stars"></label>
                                    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half"
                                        for="star1half" title="Meh - 1.5 stars"></label>
                                    <input type="radio" id="star1" name="rating" value="1" /><label class="full"
                                        for="star1" title="Sucks big time - 1 star"></label>
                                    <input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half"
                                        for="starhalf" title="Sucks big time - 0.5 stars"></label>
                                </fieldset>
                            </div>
                        </div>
                        <div class="card">
                            <textarea class="card-body msgbox" id="totutor-review" cols="43" rows="3"
                                placeholder="강의에대한 솔직한 평가를 남겨주세요! &#13;&#10;*악의적인 비방은 무통보 삭제가 될 수 있습니다."></textarea>
                        </div>
                        <span id="review-count" style="float: right;">(0/100)</span> <br>
                        <button type="submit" class="btn btn-primary btn-lg btn-basic" style="float: right; ">리뷰
                            등록하기</button>
                    </div>
                </div>
                <script>
 	                $("#totutor-review").keyup(e=>{
	                	let length=$(e.target).val().length;
	                	$("#review-count").html("("+length+"/100)");
	                }); 
                
                </script>
                
                
                

                <div id="review-list">
                    <h5 class="card-title ">수강생 리뷰</h5>
                    <div class="card">
                        <div class="card-body ">
                            <!-- 리뷰시작 -->
                            <div class="d-flex ">
                                <div name="review flex-shrink-0">
                                    <img class="img_basic img_review" src="https://post-phinf.pstatic.net/MjAxOTEyMTJfMTMy/MDAxNTc2MTM4NTc5MjAy.d6qoHmyl15AA4MjNVN7uOMbOJplPrhTktLxfMQXze9Ig.Ui8K9n80tzLCRsYmAK1VGmFxcRJ6-fndALhaNI69n9Ug.JPEG/%EC%A4%80%ED%98%81_%284%29.jpg?type=w1200
                                                 ">
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <div style="float: right;">
                                        <span>2021.12.14 </span><span id="report"><a href=""> 신고</a></span>
                                        <!-- 신고사유팝업 연결 -->
                                    </div>
                                    <span>★★★★★</span><br>
                                    <span>홍대불주먹</span><br>
                                    <p>
                                        1월부터 변경된 지침~ 1/3일부터는 수업시간이 변경되고 한시적으로 시행했던 훈련장려금도 복원된다고 하네요.
                                        아쉽다.. 훈련 시작일로부터 산정해주면 좋을텐데 왜 수업일 기준으로 보나요~ 이것에 대한 건의는..고노부에 직접 하도록 하세요~!
                                        1월부터 변경된 지침~ 1/3일부터는 수업시간이 변경되고 한시적으로 시행했던 훈련장려금도 복원된다고 하네요.
                                        아쉽다.. 훈련 시작일로부터 산정해주면 좋을텐데 왜 수업일 기준으로 보나요~ 이것에 대한 건의는..고노부에 직접 하도록 하세요~!
                                        1월부터 변경된 지침~ 1/3일부터는 수업시간이 변경되고 한시적으로 시행했던 훈련장려금도 복원된다고 하네요.
                                        아쉽다.. 훈련 시작일로부터 산정해주면 좋을텐데 왜 수업일 기준으로 보나요~ 이것에 대한 건의는..고노부에 직접 하도록 하세요~!
                                    </p>
                                </div>
                            </div>
                            <!-- 리뷰끝 -->
                        </div>
                    </div> 
                </div>
            </div> 
        </div>
    </div>
</section>

<%@ include file="/views/common/footer.jsp" %>