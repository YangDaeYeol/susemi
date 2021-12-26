<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
	<section>
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
                                <th scope="col">처리</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row">도**</th>
                                <td>목요일은 카메라 연기하는 날</td>
                                <td><a href="" style="color: black;">이거 수업 완전 개똥이네~ 나도 하겠어~~ 개나줘버려~~~</a></td>
                                <td>
                                    <button>삭제</button>
                                </td>
                              </tr>
                              <tr>
                                <th scope="row">박**</th>
                                <td>마음에 파도를 일으키는 그립톡  </td>
                                <td><a href="" style="color: black;">파도는 무슨 신발*&#$@ ㅡㅡ 개@#$%^&*</a></td>
                                <td>
                                    <button>삭제</button>
                                </td>
                              </tr>
                              <tr>
                                <th scope="row">최**</th>
                                <td>달콩이의 아이패드 드로잉</td>
                                <td><a href="" style="color: black;">아이패드 없는 사람은 서러워서 살겠나 개@#$%^&* 아이패드 사주고나 클래스 여쇼 %$&$%^$씨$%3454 </a></td>
                                <td>
                                    <button>삭제</button>
                                </td>
                              </tr>
                            </tbody>
                          </table>
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