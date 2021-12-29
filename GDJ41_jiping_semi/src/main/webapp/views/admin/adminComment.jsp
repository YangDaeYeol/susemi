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
                                <th scope="col">신고 댓글 내용</th>
                                <th scope="col">신고 사유</th>
                                <th scope="col" colspan="2">삭제 처리</th>                                
                              </tr>
                            </thead>
                            <tbody>
                              <%for(int i=0;i<reportCommentList.size();i++){ %>
                              
                              <tr>
                                <td scope="row"><%=reportCommentList.get(i).getWriter()%></td>
                                <td><a href="<%=request.getContextPath()%>/admin/adminGoToLecture?lectureNo=<%=reportCommentList.get(i).getLectureNo()%>" style="color:black"><%=reportCommentList.get(i).getLectureTitle()%></a></td>
                                <td><%=reportCommentList.get(i).getCommentContent()%></td>
                                <td>
                                    <button onclick="open_win('<%=request.getContextPath() %>/admin/adminCommentDetail?comment_no=<%=reportCommentList.get(i).getCommentNo() %>')">상세보기</button>
                                </td>
                                <td>
                                	<button class="deleteAllBtn" value="<%=reportCommentList.get(i).getCommentNo()%>" style="width:60px">예</button>
                                </td>
                                <td>
                                	<button class="deleteListBtn" value="<%=reportCommentList.get(i).getCommentNo()%>" style="width:60px">아니오</button>
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
<script>

function open_win(url) {

	window.open(url,"_blank", "width=500, height=230");

}   //url로 가서 창만들어라

$(".deleteAllBtn").click(e=>{
	let lectureNo=$(e.target).val();
	alert('삭제하기 전에 신고 사유를 확인하세요.');
	if(confirm('댓글을 정말로 삭제하시겠습니까?')){
		location.assign('<%=request.getContextPath() %>/admin/adminCommentAllDelete?comment_no='+commentNo);
	}   
});

$(".deleteListBtn").click(e=>{
	let lectureNo=$(e.target).val();
	if(confirm('신고 목록에서 정말로 삭제하시겠습니까?')){
		location.assign('<%=request.getContextPath() %>/admin/adminCommentListDelete?comment_no='+commentNo);
	}   
});
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