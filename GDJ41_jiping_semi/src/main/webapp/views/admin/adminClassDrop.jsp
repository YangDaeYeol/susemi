<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/admin/adminCommonMenu.jsp"%>  
<%@ page import="java.util.List,com.jiping.lecture.model.vo.Lecture" %>
<%
	List<Lecture> letuceAllList = (List)request.getAttribute("letuceAllList");
%>
                <div id="mypage-content" class="inlineblock">
                    <div class="flex">
                        <img src="<%=request.getContextPath() %>/img/management.png" alt="" width="30px" height="30px">
                        <h4 class="inlineblock" style="margin-bottom: 0; margin-left: 5px;" >클래스 삭제</h4>
                    </div>
                    <div class="line"></div>
                        <div class="flex" id="admin-class-drop">
                        <table class="table" id="class-drop-tbl">
                            <thead>
                              <tr>
                                <th scope="col">클래스 번호</th>
                                <th scope="col">클래스명</th>
                                <th scope="col">강사 닉네임</th>
                                <th scope="col">클래스 삭제여부</th>
                              </tr>
                            </thead>
                            <tbody>
                              <!-- 불러온 값 -->
                              <%for(int i=0;i<letuceAllList.size();i++){ %>
                              
                              <tr>
                                <th scope="row"><%=letuceAllList.get(i).getLectureNo()%></th>
                                <td><%=letuceAllList.get(i).getLectureTitle()%></td>
                                <td><%=letuceAllList.get(i).getNickName()%></td>
                                <td>
                                    <button class="deleteBtn" value="<%=letuceAllList.get(i).getLectureNo()%>">클래스 삭제</button>
                                </td>
                              </tr>
                              <%} %>
                              <td colspan="4">
								<div id="pageBar" class="d-block">
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
	$(".deleteBtn").click(e=>{
		let lectureNo=$(e.target).val();
		if(confirm('클래스를 정말 삭제하시겠습니까? 한 번 삭제하면 되돌릴 수 없습니다.')){
			location.assign('<%=request.getContextPath() %>/admin/classDrop?lectureNo='+lectureNo);
		}   
	});
</script>	
<%@ include file="/views/common/footer.jsp"%>
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