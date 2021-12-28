<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
 <%
 	String thumbnail = (String)request.getParameter("thumbnail");
	String lectureType = (String)request.getParameter("lectureType");
	String lectureTitle = (String)request.getParameter("lectureTitle");
	String tutorImg = (String)request.getParameter("tutorImg");
	String tutorNickName = (String)request.getParameter("tutorNickName");
	String lecturePrice = (String)request.getParameter("lecturePrice");
	String lectureDate = (String)request.getParameter("lectureDate");
	String lectureAddr = (String)request.getParameter("lectureAddr");
%>
<section style="margin: 100px auto; text-align: center">
	<div id="firstMenu">
		<h4 style="text-align: left;">결제하기</h4> 
		<div class="line"></div>
	</div>

	<main class="form-signin form-payment">
    	<div class="payment-container">
			<div class="row fs_14">
				<div class="col-6 col-md-3">
					<img src="<%=request.getContextPath() %>/upload/<%=thumbnail %>" width="180px" height="120px" alt="Thumbnail">
				</div>
				<div class="col-6 col-md-6" id="paymentDetail">
					<h3><%=lectureTitle %></h3>
					<span>유형: <%=lectureType %></span>
					<%if(lectureType.equals("VOD")){ %>
					<span>VOD는 무기한으로 시청 가능합니다.</span>
					<%}else{ %>
					<span>일시 : <%=lectureDate %></span>
					<span>수강인원 : 총 1명</span>
					<span>장소 : <%=lectureAddr %></span>
					<%} %>
					
				</div>
				<div class="col-6 col-md-3">
					<img src="<%=request.getContextPath() %>/upload/<%=tutorImg %>" width="60px" height="60px" alt="tutorPic">
					<span style="font-size: 18px;"><%=tutorNickName %></span>
				</div>
			</div>
		</div>
		<div style="text-align: right; margin-right: 15px;">결제 금액: <%=lecturePrice %>원</div>
	</main>

	<div id="paymentType" style="padding: 100px;">
		<button type="button" id="kakaoPay" class="btn btn_mint btn-lg" style="margin-right: 20px;">카카오페이</button>
    	<button type="button" id="cardPay" class="btn btn_mint btn-lg">카드 결제</button>
  	</div>
</section>
<script>
	//카카오페이
	$("#kakaoPay").click(e=>{
	        
	      //가맹점 식별코드
	      IMP.init('imp77938975');
	      IMP.request_pay({
	        pg : 'kakaopay',
	    pay_method : 'card', //생략 가능
	    merchant_uid: "order_no_0009", // 상점에서 관리하는 주문 번호 (임의의 값 설정하기)
	    name : '<%=lectureTitle %>',
	    <%-- amount : <%=lecturePrice %>, --%>
	    amount : 100,	    
	    buyer_email : '<%=loginMember.getEmail() %>',
	    buyer_name : '<%=loginMember.getMemberName() %>',
	    buyer_tel : '<%=loginMember.getPhone() %>'
/* 	    buyer_addr : '',
	    buyer_postcode : '' */
	      }, function(rsp) {
	          console.log(rsp);
	        if ( rsp.success ) {
	            var msg = '결제가 완료되었습니다.';
	            msg += '고유ID : ' + rsp.imp_uid;
	            msg += '상점 거래ID : ' + rsp.merchant_uid;
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            msg += '카드 승인번호 : ' + rsp.apply_num;
	        } else {
	             var msg = '결제에 실패하였습니다.';
	             msg += '에러내용 : ' + rsp.error_msg;
	        }
	        alert(msg);
	      });
	    
	    });
	
	//카드결제
	$("#cardPay").click(e=>{
		
	      //가맹점 식별코드
	      IMP.init('imp77938975');
	      IMP.request_pay({
	        pg : 'nice',
	    pay_method : 'card', //생략 가능
	    merchant_uid: "order_no_0009", // 상점에서 관리하는 주문 번호 (임의의 값 설정하기)
	    name : '<%=lectureTitle %>',
	    <%-- amount : <%=lecturePrice %>, --%>
	    amount : 100,
	    buyer_email : '<%=loginMember.getEmail() %>',
	    buyer_name : '<%=loginMember.getMemberName() %>',
	    buyer_tel : '<%=loginMember.getPhone() %>'
/* 	    buyer_tel : '010-0000-0000',
	    buyer_addr : '',
	    buyer_postcode : '' */
	      }, function(rsp) {
	          console.log(rsp);
	        if ( rsp.success ) {
	            var msg = '결제가 완료되었습니다.';
	            // msg += '고유ID : ' + rsp.imp_uid;
	            // msg += '상점 거래ID : ' + rsp.merchant_uid;
	            // msg += '결제 금액 : ' + rsp.paid_amount;
	            // msg += '카드 승인번호 : ' + rsp.apply_num;
	        } else {
	             var msg = '결제에 실패하였습니다.';
	             msg += '에러내용 : ' + rsp.error_msg;
	        }
	        alert(msg);
	      });
	    
	    });
</script>
<%@ include file="/views/common/footer.jsp" %>