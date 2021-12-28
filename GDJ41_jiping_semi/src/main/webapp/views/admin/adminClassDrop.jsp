<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/admin/adminCommonMenu.jsp"%>  
                <div id="mypage-content" class="inlineblock">
                    <div class="flex">
                        <img src="<%=request.getContextPath() %>/img/management.png" alt="" width="30px" height="30px">
                        <h4 class="inlineblock" style="margin-bottom: 0; margin-left: 5px;" >삭제 요청 클래스</h4>
                    </div>
                    <div class="line"></div>
                        <div class="flex" id="admin-class-drop">
                        <table class="table" id="class-drop-tbl">
                            <thead>
                              <tr>
                                <th scope="col">클래스 번호</th>
                                <th scope="col">클래스명</th>
                                <th scope="col">강사 이메일</th>
                                <th scope="col">클래스 승인여부</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row">1</th>
                                <td>알콩이의 아이패드 드로잉</td>
                                <td>asdfg@jkl.com</td>
                                <td>
                                    <button>클래스 삭제</button>
                                </td>
                              </tr>
                              <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>
                                    <button>클래스 삭제</button>
                                </td>
                              </tr>
                              <tr>
                                <th scope="row">3</th>
                                <td>Larry the Bird</td>
                                <td>Larry the Bird</td>
                                <td>
                                    <button>클래스 삭제</button>
                                </td>
                              </tr>
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