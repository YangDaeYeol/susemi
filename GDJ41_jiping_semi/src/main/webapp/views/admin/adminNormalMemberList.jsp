<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/admin/adminCommonMenu.jsp"%>
<%@ page import="java.util.List,com.jiping.member.model.vo.Member" %>
<%
	List<Member> normalMemberList = (List)request.getAttribute("normalMemberList");
%> 
                <div id="mypage-content" class="inlineblock">
                    <div class="flex">
                        <img src="<%=request.getContextPath() %>/img/management.png" alt="" width="30px" height="30px">
                        <h4 class="inlineblock" style="margin-bottom: 0; margin-left: 5px;" >수강생 목록</h4>
                    </div>
                    <div class="line"></div>
                        <div class="flex" id="admin-class-appr">
                        <table class="table" id="class-appr-tbl">
                            <thead>
                              <tr>
                                <th scope="col">이름</th>
                                <th scope="col">닉네임</th>
                                <th scope="col">이메일</th>
                                <th scope="col">전화번호</th>
                                <th scope="col">수강 중인 클래스</th>
                                <th scope="col">수강 완료 클래스</th>
                              </tr>
                            </thead>
                            <tbody>
                              <!-- 불러온 값 -->
                              <%for(int i=0;i<normalMemberList.size();i++){ %>
                              
                              <tr>
                                <td><%=normalMemberList.get(i).getMemberName()%></td>
                                <td><%=normalMemberList.get(i).getNickname()%></td>
                                <td><%=normalMemberList.get(i).getEmail()%></td>
                                <td><%=normalMemberList.get(i).getPhone()%></td>
                                <td>
                                    <button onclick="location.assign('<%=request.getContextPath() %>/member/myclassIngOff.do?email=<%=normalMemberList.get(i).getEmail()%>')">상세보기</button>
                                </td>
                                <td>
                                    <button onclick="location.assign('<%=request.getContextPath() %>/member/myclassEnd.do?email=<%=normalMemberList.get(i).getEmail()%>')">상세보기</button>
                                </td>
                              </tr>
                              <%} %>
                              <td colspan="6">
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