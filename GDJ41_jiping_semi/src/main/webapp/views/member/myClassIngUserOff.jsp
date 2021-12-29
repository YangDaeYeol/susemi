<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jiping.lecture.model.vo.Lecture" %>
<%
	
	Member m=(Member)request.getAttribute("loginMember");
	List<Lecture> list=(List)request.getAttribute("lectureList");
	int count=(int)request.getAttribute("count");
	/* DecimalFormat formatter = new DecimalFormat("###,###"); */

%>
<%@ include file="/views/common/header.jsp"%>
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
                                  <li><a href="<%=request.getContextPath()%>/member/myclassEnd.do?email=<%=m.getEmail()%>">- 수강완료 클래스</a></li>
                              </ul>
                          </nav>
                          <li><a href="<%=request.getContextPath()%>/member/dropMember.do?email=<%=m.getEmail()%>">· 회원탈퇴</a></li>
                      </ul>                    
                    </div>
                </div>   
                <div id="mypage-content" class="inlineblock">
                    <div class="flex">
                        <img id="info-icon" src="<%=request.getContextPath() %>/img/presentation.png" width="30px" height="30px" class="inlineblock" style="margin-bottom: 10px;">
                        <h4 class="inlineblock" style="margin-bottom: 0; margin-left: 10px;" >마이 클래스</h4>
                        <div id="ing-class-btn-d">
                            <button class="btn-basic ing-class-btn">오프라인</button>
                            <button class="btn-pink ing-class-btn" onclick="location.assign('<%=request.getContextPath()%>/member/myclassIngVod.do?email=<%=m.getEmail()%>')">VOD</button>
                        </div>
                    </div>
                    <div class="line"></div>
                    
                    <div class="classAll">
                        <div class="flex" id="ing-class">
                            <h5>수강중인 클래스 - 오프라인</h5>
                            <p class="relative" style="left:540px">총 <%=count %>개의 클래스</p> 
                        </div>
                        <div id="ing-class-list">
                        <%if(!list.isEmpty()){ %>    
	                            <%for(int i=0; i<list.size(); i++){ %>
		                            <div class="col inlineblock class-margin">
		                                <div class="class-hover" onclick="location.assign('<%=request.getContextPath()%>/lecture/lecture.do?lectureNo=<%=list.get(i).getLectureNo()%>')">
		                                    <img src="<%=request.getContextPath()%>/upload/<%=list.get(i).getThumbNail()%>" alt="2021-12-16-21-57-58" 
		                                        height="150px" width="200px" ><br>
		                                    <div id="title" style="font-size: 18px;"><%=list.get(i).getLectureTitle() %></div>
		                                    <div id="price">￦ <%=list.get(i).getPrice() %></div>
		                                    <!-- <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12" width="80px" style="margin-right: 70px;"> -->		                                    
		                                </div>                           
		                            </div>
	                            <%} %>
                        <%}else{ %>
                        		<p style="margin-top:50px;"><strong><%=m.getNickname() %></strong>님이 현재 수강중인 클래스가 없습니다.</p>
                       	<%} %>    
                        </div>
                    </div>                      
                </div>
            </div>
        </section>

<%@ include file="/views/common/footer.jsp"%>    
<script>
//마이클래스 서브메뉴!!
$("#sub-menu").hide();
$(".nav-sub").mouseenter(e=>{
    $("#sub-menu").show();
})  
$(".nav-sub").mouseleave(e=>{
    $("#sub-menu").hide();
});
</script>