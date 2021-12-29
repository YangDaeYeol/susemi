<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <footer>
            <div>
                <div id="footer-left">
                    <h1><img src="<%= request.getContextPath() %>/img/logo.png" width="80px" height="80px"></h1>
                    <p>주소 : 서울시 가산동 금천구 가산디지털2로 115, 506호<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(가산동, 대룡테크노타운 3차)</p>
                    <p>통신판매업 신고번호 : 제 2021-서울시 금천구 - 10445</p>
                    <p>개인정보책임자 : 양대열 / daeyeol9245@naver.com</p>
                    <p>Copyright&copy; 2021.<strong>JI PING.</strong>ALL Right Reserverd.</p>
                </div>
                <div id="footer-right">
                    <p>JIPING CENTER</p>
                    <h4><a href="javascript:kakaoChChat();"><img src="<%= request.getContextPath() %>/img/kakao.png" width="20px" height="20px">지핑 문의하기</a></h4>
                    <p>운영시간</p>
                    <p>평일 09 : 00 ~ 18 : 00<br>
                    점심 12 : 20 ~ 13 : 30</p>
                    <h5><a href="javascript:kakaoCh();">카카오톡 채널가기</a></h5>
                </div>
            </div>
            <script>
            	const kakaoChChat=()=> {
            		let url = "https://pf.kakao.com/_xgFJub/chat";
            		let style = "width=500,height=600";
            		open(url,"",style);
            	}
            	const kakaoCh=()=> {
            		let url = "https://pf.kakao.com/_xgFJub";
            		let style = "width=500,height=600";
            		open(url,"",style);
            	}
            </script>
        </footer>
    </div>
</body>
</html>