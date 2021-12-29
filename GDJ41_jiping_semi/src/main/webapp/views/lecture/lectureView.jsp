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
				com.jiping.payment.model.vo.Payment,
				com.jiping.lecture.model.vo.LectureComment,
				com.jiping.lecture.model.vo.VodLecture,
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
LectureComment lc= (LectureComment)request.getAttribute("lc");
List<LectureComment> lcList= (List)request.getAttribute("lcList");
List<VodLecture> vodList=(List)request.getAttribute("vodList");
List<Payment> payList=(List)request.getAttribute("payList");
boolean flag = false;


	/* System.out.println("jsp:"+ list);  */
%>

<section>
        <div class="container">
            <div id="mainInfo" class="row">
                <!--보라 1-->
         <div id="left" class="col-7">
             <div id="info_class">
                 <p class="card-text"><small class="text-muted">이 클래스는 <%=le.getLectureType() %>클래스 입니다. </small>
                 </p>
                 <%if(loginMember!=null&&loginMember.getNickname().equals(tutor.getNickname())) { %>
                     <div class="tutor-btn">
                         <h5 class="card-title">
                             <%=le.getLectureTitle() %>
                         </h5>
                         <button type="button" class="btn-tutor btn btn-primary btn-basic">클래스 상세정보 수정</button>
                     </div>
                     <%} %>
                     <!--class="card-title"-->
                     <div class="card">
                         <div class="card-body">
                             <div id="carouselExampleControls" class="carousel slide"
                                 data-bs-ride="carousel">
                                 <div class="carousel-inner">
                                     <div class="carousel-item active">
                                         <img src="<%=request.getContextPath()%>/upload/<%=imgList.get(0).getLectureFileName()%>"
                                             class="d-block w-100" alt="...">
                                     </div>
                                     <div class="carousel-item">
                                         <img src="<%=request.getContextPath()%>/upload/<%=imgList.get(1).getLectureFileName()%>"
                                             class="d-block w-100" alt="...">
                                     </div>
                                     <div class="carousel-item">
                                         <img src="<%=request.getContextPath()%>/upload/<%=imgList.get(2).getLectureFileName()%>"
                                             class="d-block w-100" alt="...">
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
         </div>col-7
         <!-- --------------------------------------------------------------------------오른쪽 -->

         <div id="right" class="col">
             <div id="tutor" style="margin-top: 39px;">
                 <h5 class="card-title">튜터를 소개합니다!</h5>
                 <div class="card">
                     <div class="card-body">
                         <div class="d-flex align-items-center">
                             <div name="flex-shrink-0">
                                 <img src="<%=request.getContextPath() %>/upload/<%=m.getProfileImg() %>"
                                     alt="..." class="img_basic img_tutor">
                             </div>
                             <div class="flex-grow-1 ms-3">
                                 <span>
                                     <%=tutor.getNickname() %>
                                 </span><br>
                                 <span>연락처 : <%=tutor.getPhone() %> </span><br>
                                 <a href="<%=tutor.getInsta() %>"><img
                                         src="https://thedaylightaward.com/wp-content/uploads/2019/12/instagram-icon.png"
                                         alt="instagram" class="socialImg">
                                 </a>
                                 <a href="<%=tutor.getFacebook() %>"><img
                                         src="https://cdn.worldvectorlogo.com/logos/facebook-icon-1.svg"
                                         alt="facebook" class="socialImg">
                                 </a>
                                 <a href="<%=tutor.getBlog() %>"><img
                                         src="https://www.coolstay.co.kr/img/main/naver.png" alt="blog"
                                         class="socialImg">
                                 </a>
                             </div>
                         </div>
                         <br>
                         <div class="flex-grow-1 ms-3">
                             <span>경력</span>
                             <ul>
                                 <%for(Certificate c: cList) { %>
                                     <li>
                                         <%=c.getCertificateText() %>
                                     </li>
                                     <%} %>
                             </ul>
                             <span>튜터의 한마디</span>
                             <p class="tutorbox_info">
                                 <%=tutor.getTutorMsg() %>
                             </p>
                         </div>
                     </div>
                 </div>
             </div>
             
<!-- ----------------------------------------------------------------------------   수업일정 -->
<!-- ----------------------------------------------------------------------------   원데이일때 -->
             <%if(le.getLectureType().equals("원데이")) {%>
                 <div id="class_schedule">
                     <h5 class="card-title">수업일정</h5>
                     <div class="list-group">
                         <%for(LectureSchedule lesc: list) { %>
                             <label class="list-group-item">
                                 <input id="innerboxcheck" class="form-check-input me-1" type="checkbox"
                                     value="<%=lesc.getScheduleNo()%>">
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
                             <button id="wish" type="button" class="btn btn-primary btn-lg btn-pink ">♥ 찜
                                 하
                                 기</button>
                             <button id="apply" type="button" class="btn btn-primary btn-lg btn-basic">수
                                 강 신
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
                                     <div>
                                         <textarea id="totutor" class="msgbox" cols="43" rows="7"
                                             placeholder="예) 초보니까 쉽게 가르쳐주세요!"></textarea>
                                         <div id="check-word-count" style="float: right;">(0/70)</div>
                                     </div>
                                 </div>
                                 <div>
                                     <p>총 결제금액</p>
                                     <p id="apply-cost" style="float: right;">가격</p>
                                 </div>
                             </div>apply-class

                         </div> apply

                         <div>
                             <form action="<%=request.getContextPath()%>/lecture/lecturePayment">
                                 <input type="hidden" name="thumbnail"
                                     value="<%=imgList.get(0).getLectureFileName()%>">
                                 <input type="hidden" name="lectureType" value="<%=le.getLectureType() %>">
                                 <input type="hidden" name="lectureTitle" value="<%=le.getLectureTitle() %>">
                                 <input type="hidden" name="tutorImg" value="<%=m.getProfileImg() %>">
                                 <input type="hidden" name="tutorNickName" value="<%=tutor.getNickname() %>">
                                 <input type="hidden" name="lecturePrice" value="<%=le.getPrice() %>">
                                 <input type="hidden" name="lectureDate" value="">
                                 <input type="hidden" name="lectureAddr" value="">
                                 <button type="submit" class="btn btn-primary btn-lg btn-basic"
                                     style="float: right;">결 제 하 기</button>
                                 </form>
                         </div>
                     </div>card
                 </div>submit
                 <%} %>

                     
<!-- ----------------------------------------------------------------------------   vod일때 -->
                     <%if(le.getLectureType().equals("VOD")) { %>
                         <div id="class_schedule">
                             <h5 class="card-title">수업일정</h5>
                             <div class="list-group">
                                 <%for(int i=0; i<vodList.size(); i++) { %>
                                     <div class="list-group-item">
                                         <span id="innerboxcheck">
                                             <%=i+1 %>강.
                                         </span>
                                         <div class="schedule-text">
                                             <span class="class-date">
                                                 <%=vodList.get(i).getVodTitle() %>
                                             </span> <!-- <span> 19:30-21:00</span> -->
                                         </div>
                                     </div>
                                     <!-- </div> -->
                                     <%} %>
                                         <%for(Payment p: payList) {
                                             if(loginMember!=null&&loginMember.getEmail().equals(p.getEmail())) {
                                             flag=true; }%>
                                             <%} %>
                                                 <% if(flag==false) { %>
                                                     <div id="scheduleBtn" class="d-flex justify-content-center">
                                                         <button id="wish" type="button"
                                                             class="btn btn-primary btn-lg btn-pink ">♥ 찜 하
                                                             기</button>
                                                         <button id="apply" type="button"
                                                             class="btn btn-primary btn-lg btn-basic">수 강 신
                                                             청</button>
                                                     </div>

                                                     <%} else if(flag==true) {%>
                             </div>
                         </div>
                         <button type="submit" class="btn btn-primary btn-lg btn-basic" style="float: right;"
                             onclick="location.assign('<%=request.getContextPath()%>/lecture/vodroom.do?lectureNo=<%=le.getLectureNo()%>')">강
                             의 실 입 장</button>
                         <% } %>
<!-- -------------------------------------------------------------------------  vod 끝 -->

                             <div id="class_submit" style="display: none;">
                                 <h5 class="card-title">수강신청</h5>
                                 <div class="card">
                                     <div class="card-body apply">
                                         <div id="apply-class">
                                             <div id="applycount">
                                                 <h6>이 강좌는 무기한으로 수강이 가능합니다.</h6>
                                             </div>
                                             <div>
                                                 <p>총 결제금액</p>
                                                 <p id="apply-cost" style="float: right;">
                                                     <%=vodList.get(0).getVodPrice() %>
                                                 </p>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                                 <div>
                                     <form action="<%=request.getContextPath()%>/lecture/lecturePayment">
                                         <input type="hidden" name="thumbnail"
                                             value="<%=imgList.get(0).getLectureFileName()%>">
                                         <input type="hidden" name="lectureType"
                                             value="<%=le.getLectureType() %>">
                                         <input type="hidden" name="lectureTitle"
                                             value="<%=le.getLectureTitle() %>">
                                         <input type="hidden" name="tutorImg" value="<%=m.getProfileImg() %>">
                                         <input type="hidden" name="tutorNickName"
                                             value="<%=tutor.getNickname() %>">
                                         <input type="hidden" name="lecturePrice"
                                             value="<%=vodList.get(0).getVodPrice() %>">
                                         <button type="submit" class="btn btn-primary btn-lg btn-basic"
                                             style="float: right;">결 제 하
                                             기</button>
                                     </form>
                                 </div>
                             </div>
         </div>col              
          <!-- ------------------- 수강신청 끝 -->
         
     </div> row
     <script>
         $("#totutor").keyup(e => {
             let length = $(e.target).val().length;
             $("#check-word-count").html("(" + length + "/70)");
         });

         $("#apply").click(e => {
             $("#class_submit").show();
         });

     </script>
     <%} %>
         <!-- ----------------------------------------------- -->
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
                     <%if (loginMember != null && loginMember.getNickname().equals(tutor.getNickname())) { %>
                             alert("해당 강좌의 튜터님은 수강신청이 불가능합니다.");
                         <%} else { %>
                             $("input[name=lectureDate]").val(data["lectureDate"]);
                             $("input[name=lectureAddr]").val(data["lectureAddress"]);
                             const title = $("#apply-title").html("<%=le.getLectureTitle() %>");
                             const date = $("#apply-date").html(data["lectureDate"]);
                             const time = $("#apply-time").html(data["startDate"] + "-" + data["endDate"]);
                             const address = $("#apply-adr").html(data["lectureAddress"]);
                             const cost = $("#apply-cost").html(data["lecturePrice"]);
                             $("#applycount").find("span").html(data["lecturePersons"]);
                             $("#class_submit").show();
                             console.log(data);
                             studentCount(data["scheduleNo"]);
                     <%}%>
                 }
                 })
             });
             
             function studentCount(sendData) {
            	 $.ajax({
            		url : "<%= request.getContextPath() %>/checkStudentCount",
            		data : {"scheduleNo":sendData},
            		dataType : "json",
            		success : data => {
            			let text = $("#applycount").find("span").text();
            			$("#applycount").find("span").html(data["count"] + "/" + text);
            		}
            	 });
             }

             $("#totutor").keyup(e => {
                 let length = $(e.target).val().length;
                 if (length > 70) {
                     alert("입력가능한 글자 수를 초과하였습니다.");
                     let temp = $(e.target).val().substring(0, length - 1);
                     $(e.target).val(temp);
                 }
                 $("#check-word-count").html("(" + length + "/70)");
             });

         </script>

         
     </div>row-1
     <div id="review" class="row-1">
          	<!--보라 2-->
		   <div class="line"></div>
		   <div class="review-enroll card">
		       <div class="card-body">
		           <!-- -------------------------------------------------- -->
		           <form action="<%=request.getContextPath() %>/lecture/review.do" method="post">
		               <div class="review-head">
		                   <div id="lecture-title">
		                       <%=le.getLectureTitle() %>
		                   </div>
		                   <div id="tutor-review">
		                       <%=le.getNickName() %> 튜터
		                   </div>
		               </div>
		               <%if(loginMember!=null) { %>
		                   <div id="starrate">
		                       <div>
		                           <img class="img_basic img_review"
		                               src="<%=request.getContextPath()%>/upload/<%=loginMember.getProfileImg()%>">
		                           <span>
		                               <%=loginMember.getNickname() %>
		                           </span>
		                       </div>
		                       <div>
		                           <fieldset class="rating">
		                               <span>평점:</span>
		                               <input type="radio" id="star5" name="rating" value="5" /><label
		                                   class="full" for="star5" title="Awesome - 5 stars"></label>
		                               <input type="radio" id="star4half" name="rating" value="4.5" /><label
		                                   class="half" for="star4half"
		                                   title="Pretty good - 4.5 stars"></label>
		                               <input type="radio" id="star4" name="rating" value="4" /><label
		                                   class="full" for="star4" title="Pretty good - 4 stars"></label>
		                               <input type="radio" id="star3half" name="rating" value="3.5" /><label
		                                   class="half" for="star3half" title="Meh - 3.5 stars"></label>
		                               <input type="radio" id="star3" name="rating" value="3" /><label
		                                   class="full" for="star3" title="Meh - 3 stars"></label>
		                               <input type="radio" id="star2half" name="rating" value="2.5" /><label
		                                   class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
		                               <input type="radio" id="star2" name="rating" value="2" /><label
		                                   class="full" for="star2" title="Kinda bad - 2 stars"></label>
		                               <input type="radio" id="star1half" name="rating" value="1.5" /><label
		                                   class="half" for="star1half" title="Meh - 1.5 stars"></label>
		                               <input type="radio" id="star1" name="rating" value="1" /><label
		                                   class="full" for="star1" title="Sucks big time - 1 star"></label>
		                               <input type="radio" id="starhalf" name="rating" value="0.5" /><label
		                                   class="half" for="starhalf"
		                                   title="Sucks big time - 0.5 stars"></label>
		                           </fieldset>
		                       </div>
		                   </div>
		                   <%} %>
		                	<textarea id="input-review" class="card-body msgbox" id="totutor-review"
		                    name="commentContent" cols="43" rows="3"
		                    placeholder="강의에대한 솔직한 평가를 남겨주세요! &#13;&#10;*악의적인 비방은 무통보 삭제가 될 수 있습니다."></textarea>
		                	<input type="hidden" name="level" value="1">
		                <%if(loginMember!=null) {%>
		                  <input type="hidden" name="writer" value="<%=loginMember.getNickname()%>">
		                  <%} %>
		                  <input type="hidden" name="letureNo" value="<%=le.getLectureNo()%>">
		                  <input type="hidden" name="lecutreCommentRef" value="0">
		                  <input type="hidden" name="lectureType"
		                      value="<%=le.getLectureType()%>">
		                  <div>
		                      <span id="review-count" style="float: right;">(0/100)</span> <br>
		                      <button type="submit" class="btn btn-primary btn-lg btn-basic"
		                          style="float: right; ">리뷰
		                          등록하기</button>
		                  </div>	
		           </form>
		       </div>
             </div>
             </div>
             <script>
                 $("#input-review").keyup(e => {
                     let length = $(e.target).val().length;
                     if (length > 100) {
                         alert("입력가능한 글자 수를 초과하였습니다.");
                         let temp = $(e.target).val().substring(0, length - 1);
                         $(e.target).val(temp);
                     }
                     $("#review-count").html("(" + length + "/100)");
                 });

                 $("#input-review").keyup(e => { //focus안되는거 질문
                     $.ajax({
                         url: "<%=request.getContextPath()%>/lecture/lecturePaymentAjax",
                         dataType: "json",
                         data: { "lectureNo": "<%=le.getLectureNo()%>", "paymentEmail": "<%=loginMember!=null?loginMember.getEmail():""%>"},
                         success: data => {
                             if (data == null) {
                                 alert("리뷰등록은 수강생만 가능합니다.");
                                 $("#input-review").val("");

                             }
                         }
                     })
                 })

             </script>


<!-- ------------------------------------리뷰출력 시작 --->

             <div id="review-list">
                 <h5 class="card-title ">수강생 리뷰</h5>
                 <div class="card">
                 	<div class="card-body ">
                 	<%if(lcList.isEmpty()) {%>
                 		<p>등록된 리뷰가 없습니다. 첫 수강생이 되어 첫 리뷰의 영광을 가져보세요 ^^</p>
                 		
               		<%} else {%>
                 		
                     <%for(LectureComment co: lcList) { 
                    	 if(co.getCommentLevel()==1) {%>
                         <div class="card-body reviewDiv">
                             <div name="review flex-shrink-0">
                                 <img class="img_basic img_review" src="<%=request.getContextPath()%>/upload/<%=co.getProfileImg()%>
                                             ">
                             </div>
                             <div class="flex-grow-1 ms-3">
                                 <div style="float: right;">
                                     <span><%=co.getEnrollDate() %></span><span id="report"><a href=""> 신고</a></span>
                                     <!-- 신고사유팝업 연결 -->
                                 </div>
                                 <span class="img-stars">
                                     <img
                                         src="<%=request.getContextPath() %>/img/star/star<%=co.getStarRate() %>.png">
                                 </span><br>
                                 <span>
                                     <%=co.getWriter() %>
                                 </span><br>
                                 <p>
                              		<%=co.getCommentContent() %>
                                 <button class="btn tutorReply btn-enrollReply"
                                     value="<%=co.getCommentNo() %>" style="float: right;">답글달기</button>
                                 <%if(loginMember!=null&&loginMember.getNickname().equals(co.getWriter()))
                                     {%>
                                    <button type="button" class="btn tutorReply deleteReply"
                                        style="float: right;" value="<%=co.getCommentNo()%>">삭제</button>
                                    <%} %>
                                 </p>

                             </div>
                         </div> d-flex card-body
                             <%}else if(co.getCommentLevel()==2) {%>
 <!--                             <div id="tutorReplyDiv"> 여기출력ㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ -->
                             	<div class="card-body reviewDiv">
                             		<div name="review flex-shrink-0">
                                 		<img class="img_basic img_review" src="<%=request.getContextPath()%>/upload/<%=co.getProfileImg()%>
                                             ">
                             		</div>
	                            	<div class="flex-grow-1 ms-3">
	                                	<div style="float: right;">
	                                    <span><%=co.getEnrollDate() %></span><span id="report"><a hreㅕㅓf=""> 신고</a></span>
	                                    <!-- 신고사유팝업 연결 -->
	                                	</div>
	                                	<span class="img-stars">
	                                    	<img
	                                        	src="<%=request.getContextPath() %>/img/star/star<%=co.getStarRate() %>.png">
	                                	</span><br>
		                                <span>
		                                    <%=co.getWriter() %>
		                                </span><br>
		                                <p>
		                             	<%=co.getCommentContent() %>
		                                
	                                	</p>
	                            	</div>			
	                         	</div>
	                         <!-- </div> -->
                             <%} %>
                             <%} %>
                                 <!-- 리뷰끝 -->
                                 <!-- 대댓글 -->
				   	 <div class="review-enroll card enroll-reply" style="display:none"> <!-- ------------------------대댓글 창 -->
				        <form action="<%=request.getContextPath() %>/lecture/review.do" method="post">
				        <%if(loginMember!=null) { %>
				        <div id="starrate">
				            <div>
				                <img class="img_basic img_review"
				                    src="<%=request.getContextPath()%>/upload/<%=m.getProfileImg()%>">
				                <span>
				                    <%=tutor.getNickname() %>
				                </span>
				            </div>
				        </div>
				        <%} %>
				        <div class="card">
				        <textarea id="input-review" class="card-body msgbox" id="totutor-review"
				            name="commentContent" cols="43" rows="3"
				            placeholder="강의에대한 솔직한 평가를 남겨주세요! &#13;&#10;*악의적인 비방은 무통보 삭제가 될 수 있습니다."></textarea>
				        </div>
				        <input type="hidden" name="level" value="1">
				        <%if(loginMember!=null) {%>
				        <input type="hidden" name="writer"
				            value="<%=loginMember.getNickname()%>">
				        <%} %>
				        <input type="hidden" name="letureNo"
				            value="<%=le.getLectureNo()%>">
				        <input type="hidden" name="lecutreCommentRef" value="0">
				        <input type="hidden" name="lectureType"
				            value="<%=le.getLectureType()%>">
				        <div>
				            <span id="review-count" style="float: right;">(0/100)</span>
				            <br>
				            <button type="submit" 
				                class="btn btn-primary btn-lg btn-basic"
				                style="float: right; ">답글 등록하기</button>
				        </div>
				    </form>
				    </div>
				<%} %> 
				    <!-- 대댓글 끝 -->
                	<script>
                   $(".btn-enrollReply").click(e => { //답글달기를 누르면 
                    	const form = $(".enroll-reply>form").clone(); //새로 만든 폼태그를 보여줘, 여기서 버튼을 누르면 레벨2로 등록됨
                        console.log(form);
                        form.find("input[name=level]").val("2");
                        form.find("input[name=lecutreCommentRef]").val($(e.target).val());
                        console.log(form);
                        let div = $("<div>");
                        div.append(form);
                        $(e.target).parents(".reviewDiv").append(div);
                    }) 
                    
                    $(".deleteReply").click(e=>{
                    	alert("adaf");
                     	console.log($(e.target));
                    	let num=$(e.target).val();
                     	location.assign("<%=request.getContextPath()%>/deleteLeview?commentNo="+num+"&lectureNo=<%=le.getLectureNo()%>");
                      })
                </script>								
                </div> card-body
            </div> card
        </div> review-list
    </div>container
</section>
<script>
<%-- 	report=(e)=> {
		const commentNo = $(e.targer)
		const nickName = 
		const url = "<%= request.getContextPath() %>/report?nickname=";
		const title = "신고하기";
		const style = "width300, height=200";
		open("",title,style)
	} --%>
</script>

<%@ include file="/views/common/footer.jsp" %>