<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/admin/adminCommonMenu.jsp"%>
                <div id="mypage-content" class="inlineblock">
                    <div class="flex">
                        <img src="<%=request.getContextPath() %>/img/management.png" alt="" width="30px" height="30px">
                        <h4 class="inlineblock" style="margin-bottom: 0; margin-left: 5px;" >관리자 페이지</h4>
                    </div>
                    <div class="line"></div>
                    <div class="classAll">
                        <div class="flex" id="admin-main">
                            <h5>
                                admin님, 환영합니다! <br><br>
                                관리할 메뉴를 클릭해주세요.
                            </h5>                        
                        </div>
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