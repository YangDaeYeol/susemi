<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/admin/adminCommonMenu.jsp"%>
<%@ page import="java.util.List,com.jiping.lecture.model.vo.Lecture" %>
<%
	List<Lecture> apprList = (List)request.getAttribute("apprList");
%> 
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
                                <th scope="col">강사 닉네임</th>
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
                                    <%-- <button onclick="location.assign('<%=request.getContextPath() %>/admin/classAppr?lectureNo=<%=apprList.get(i).getLectureNo()%>')">클래스 승인</button> --%>                                    
                                    <button class="apprBtn" value="<%=apprList.get(i).getLectureNo()%>">클래스 승인</button>
                                    <button class="refuBtn">클래스 거부</button>
                                </td>
                              </tr>
                              <%} %>
                              <td colspan="4">
								<div id="pagebar" class="d-block">
									<%=request.getAttribute("pageBar") %>
								</div>
                              </td>
                            </tbody>
                          </table>
                        </div>  
                    </div>    
            </div>
        </section>
<script>
	$(".apprBtn").click(e=>{
		/* console.log($(e.target).parent().parent()[0]);
		console.log($(e.target).val()); */
		let lectureNo=$(e.target).val();
		if(confirm('클래스를 정말 승인하시겠습니까?')){
			location.assign('<%=request.getContextPath() %>/admin/classAppr?lectureNo='+lectureNo);
		}   
	});
	$(".refuBtn").click(e=>{
		let lectureNo=$(e.target).val();
		if(confirm('클래스를 정말 승인을 거부하시겠습니까? 승인 거부 시 클래스가 삭제됩니다.')){
			location.assign('<%=request.getContextPath() %>/admin/classDrop?lectureNo='+lectureNo);
		}   
	});
	
</script>
<%@ include file="/views/common/footer.jsp"%>z
<!-- <script>
        // 마이클래스 서브메뉴!!
        $("#sub-menu").hide();
        $(".nav-sub").mouseenter(e=>{
            $("#sub-menu").show();
        })  
        $(".nav-sub").mouseleave(e=>{
            $("#sub-menu").hide();
        });
</script> -->