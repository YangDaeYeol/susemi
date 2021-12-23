<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section id="sectionMargin">
	<div id="memberList-container" class="margin-auto-0"> 
        <!-- <div class="line"></div> -->
        <table class="table caption-top" id="memberList-tbl">
            <caption>수강생 목록 - 3명</caption>
            <thead>
              <tr>
                <th scope="col" id="th-profile">프로필</th>
                <th scope="col" id="th-name">이름</th>
                <th scope="col" id="th-phone">연락처</th>
                <th scope="col" id="th-to-tutor">튜터에게 전하는 말</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row"><img src="<%=request.getContextPath() %>/img/안보현.jpg"></th>
                <td>안보현</td>
                <td>010-1234-1234</td>
                <td>선생님~ 잘 부탁드립니다!!</td>
              </tr>
              <tr>
                <td><img src="<%=request.getContextPath() %>/img/아이유.2.jpg"></td>
                <td>아이유</td>
                <td>010-1234-1234</td>
                <td>열심히 하겠습니다~!!! 금요일에 만나요~~~ 우~~ 이번주 금요일 금요일에 시간 어때요오 주말까지 기다리긴 싫어 시간아 빨리가 시계를 돌릴수있따면 허~</td>
              </tr>
              <tr>
                <td><img src="<%=request.getContextPath() %>/img/이진욱.jpg"></td>
                <td>이진욱</td>
                <td>010-1234-1234</td>
                <td>강사님 믿고 한번 따라가 보겠습니다! 잘 부탁드려요오오 ~~!!!!</td>               
              </tr>
            </tbody>
          </table>
        </div>
        <!-- <div class="line margin-auto-0"></div> -->
    </div>
</section>

<%@ include file="/views/common/footer.jsp"%>