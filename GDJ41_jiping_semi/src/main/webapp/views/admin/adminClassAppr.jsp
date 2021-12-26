<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.jiping.lecture.model.vo.Lecture" %>
<%
	List<Lecture> apprList = (List)request.getAttribute("apprList");
	
%>
	<section id="sectionMargin">
            <div id="mypage-container" class="flex">
                <div class=" inlineblock overflow" id="mypage-menu">          
                    <h3>MANAGER</h3>                           
                    <div class="" id="my-menu" >
                        <ul id="menu-list">
                            <nav class="nav-sub">
                                <li ><a href="">· 클래스관리</a></li>
                                <ul id="sub-menu">
                                    <li><a href="<%=request.getContextPath()%>/admin/adminClassAppr">- 클래스 승인</a></li>
                                    <li><a href="<%=request.getContextPath()%>/views/admin/adminClassDrop.jsp">- 클래스 삭제</a></li>
                                </ul>
                            </nav>
                            <li><a href="<%=request.getContextPath()%>/views/admin/adminComment.jsp">· 댓글 관리</a></li>
                        </ul>                  
                    </div>
                </div>   
                <div id="mypage-content" class="inlineblock">
                    <div class="flex">
                        <img src="<%=request.getContextPath() %>/img/management.png" alt="" width="30px" height="30px">
                        <h4 class="inlineblock" style="margin-bottom: 0; margin-left: 5px;" >클래스 승인</h4>
                    </div>
                    <div class="line"></div>
                        <div class="flex" id="admin-class-appr">
                        <table class="table" id="class-appr-tbl">
                            <thead>
                              <tr>
                                <th scope="col">클래스 번호</th>
                                <th scope="col">클래스명</th>
                                <th scope="col">강사 이메일</th>
                                <th scope="col">클래스 승인여부</th>
                              </tr>
                            </thead>
                            <tbody>
                              <!-- 불러온 값 -->
                              <%for(int i=0;i<apprList.size();i++){ %>
                              
                              <tr>
                                <th scope="row"><%=apprList.get(i).getLectureNo()%></th>
                                <td><%=apprList.get(i).getLectureTitle()%></td>
                                <td><%=apprList.get(i).getNickName()%></td>
                                <td>
                                    <button onclick="location.assign('<%=request.getContextPath() %>/admin/classAppr?lectureNo=<%=apprList.get(i).getLectureNo()%>')">클래스 승인</button>
                                    <button>클래스 거부</button>
                                </td>
                              </tr>
                              <%} %>
                            </tbody>
                          </table>
                        </div>  
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
</script>