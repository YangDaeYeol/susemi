<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/admin/adminCommonMenu.jsp"%> 
<%@ page import="java.util.List,com.jiping.lecture.model.vo.LectureComment" %>
<%
	List<LectureComment> reportCommentList = (List)request.getAttribute("reportCommentList");

%> 
                <div id="mypage-content" class="inlineblock">
                    <div class="flex">
                        <img src="<%=request.getContextPath() %>/img/bad-review.png" alt="" width="30px" height="30px">
                        <h4 class="inlineblock" style="margin-bottom: 0; margin-left: 5px;" >신고 댓글 관리</h4>
                    </div>
                    <div class="line"></div> 
                        <div class="flex" id="admin-comment-drop">
                        <table class="table" id="comment-drop-tbl">
                            <thead>
                              <tr>
                                <th scope="col">닉네임</th>
                                <th scope="col">클래스명</th>
                                <th scope="col">신고댓글내용</th>
                                <th scope="col" colspan="2">처리</th>
                              </tr>
                            </thead>
                            <tbody>
                              <%for(int i=0;i<reportCommentList.size();i++){ %>
                              
                              <tr>
                                <td scope="row"><%=reportCommentList.get(i).getWriter()%></td>
                                <td><a href="<%=request.getContextPath()%>/admin/lecture.do?lectureNo=<%=reportCommentList.get(i).getLectureNo()%>" style="color:black"><%=reportCommentList.get(i).getLectureTitle()%></a></td>
                                <td><%=reportCommentList.get(i).getCommentContent()%></td>
                                <td>
                                    <button onclick="open_win('<%=request.getContextPath() %>/admin/adminCommentDetail?comment_no=<%=reportCommentList.get(i).getCommentNo() %>')">신고 사유</button>
                                </td>
                                <td>
                                    <button onclick="location.assign('<%=request.getContextPath()%>/admin/adminCommentDelete?comment_no=<%=reportCommentList.get(i).getCommentNo() %>')">삭제</button>
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
function open_win(url) {

	window.open(url,"_blank", "width=500, height=230");

}   //url로 가서 창만들어라
</script>        
<%@ include file="/views/common/footer.jsp"%>
<!-- <script>
	//마이클래스 서브메뉴!!
	$("#sub-menu").hide();
	$(".nav-sub").mouseenter(e=>{
	    $("#sub-menu").show();
	})  
	$(".nav-sub").mouseleave(e=>{
	    $("#sub-menu").hide();
	});
</script> -->