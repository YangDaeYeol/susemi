<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="views/common/header.jsp" %>
        <section>
            <div class="slider">
                
            </div>
            <div id="class-list">
                <div>
                    <h4>&nbsp;&nbsp;원데이 클래스</h4><!-- <button id="leftBtn">버튼좌</button><button id="rightBtn">버튼우</button> -->
                </div>
                <div id="list-container1">
                    <ul>
                    </ul>
                </div>
                <div>
                    <h4>&nbsp;&nbsp;다회차 클래스</h4><!-- <button id="leftBtn">버튼좌</button><button id="rightBtn">버튼우</button> -->
                </div>
                <div id="list-container2">
					<ul>
                    </ul>
                </div>
                <div>
                    <h4>&nbsp;&nbsp;VOD 클래스</h4><!-- <button id="leftBtn">버튼좌</button><button id="rightBtn">버튼우</button> -->
                </div>
                <div id="list-container3">
					<ul> 
                    </ul>
                </div>
                </div>
            <div id="banner-img" style="display: flex;">
            	<div id="left-banner">
            		<a href="javascript:enrollLecture();"><img src="<%= request.getContextPath() %>/img/banner1.png"></a>
            	</div>
            	<div id="right-banner">
            		<img src="<%= request.getContextPath() %>/img/banner2.png">
            	</div>
            </div>
            <br><br>
        </section>
        <script>
        	const enrollLecture=()=> {
        		let grade = "<%= loginMember!=null?loginMember.getMemberGrade():""%>";
        		console.log(grade);
        		if(grade=="수강생" || grade=="") {
        			alert("튜터만 등록 할 수 있습니다.");
        		}else if(grade=="튜터") {
        			 location.assign('<%= request.getContextPath() %>/enrolllecture');
        		}
        	}
        	$(()=> {
        		$.ajax({
        			url : "<%= request.getContextPath() %>/onedayLectureList",
        			dataType : "json",
        			success : data => {
        				for(let i=0; i<data.length; i++) {
        					let con = data[i]
        					let br = $("<br>");
	        				let li = $("<li>");
	        				let a = $("<a>");
	        				a.attr("href","<%= request.getContextPath() %>/lecture/lecture.do?lectureNo=" + con["lectureNo"] );
	        				let div = $("<div>");
	        				div.attr("id","list-content");
	        				let imgSum = $("<img>");
	        				imgSum.attr("src","<%= request.getContextPath() %>/upload/" + con["thumbnail"]);
	        				let div2 = $("<div>");
	        				let div3 = $("<div>");
	        				div3.attr("id","content-left");
	        				let div4 = $("<div>");
	        				div4.attr("id","title");
	        				div4.css("height","60px");
	        				let strong = $("<strong>");
	        				strong.html(con["lectureTitle"].length<12?con["lectureTitle"]:con["lectureTitle"]);
	        				div4.append(strong);
	        				let div5 = $("<div>");
	        				div5.attr("id","place");
	        				let strong2 = $("<strong>");
	        				strong2.text("￦ " + con["price"]);
	        				div5.append(strong2);
	        				let div6 = $("<div>");
	        				div6.attr("id","addlist");
	        				let imgRate = $("<img>");
	        				imgRate.attr({"src":"https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png","width":"80px","height":"20px"});
	        				let span = $("<span>");
	        				span.text(con["commentCount"]==0?"":con["commentCount"]);
	        				div6.append(imgRate).append(span);
	        				div3.append(div4).append(div5).append(div6)
	        				let div7 = $("<div>");
	        				div7.attr("id","content-right");
	        				let div8 = $("<div>");
	        				div8.attr("id","frofile-img");
	        				let imgPro = $("<img>");
	        				imgPro.attr("src","<%= request.getContextPath() %>/upload/" + con["tutorImg"]);
	        				div8.append(imgPro);
	        				let div9 = $("<div>");
	        				div9.attr("id","frofile-name");
	        				let p = $("<p>");
	        				p.text(con["nickName"]);
	        				div9.append(p);
	        				div7.append(div8).append(div9);
	        				div2.append(div3).append(div7);
	        				div.append(imgSum).append(div2);
	        				a.append(div);
	        				li.append(a);
	        				$("#list-container1").find("ul").append(li);
        				}
        			}
        		});
        		$.ajax({
        			url : "<%= request.getContextPath() %>/everydayLectureList",
        			dataType : "json",
        			success : data => {
        				for(let i=0; i<data.length; i++) {
        					let con = data[i]
        					let br = $("<br>");
	        				let li = $("<li>");
	        				let a = $("<a>");
	        				a.attr("href","<%= request.getContextPath() %>/lecture/lecture.do?lectureNo=" + con["lectureNo"] );
	        				let div = $("<div>");
	        				div.attr("id","list-content");
	        				let imgSum = $("<img>");
	        				imgSum.attr("src","<%= request.getContextPath() %>/upload/" + con["thumbnail"]);
	        				let div2 = $("<div>");
	        				let div3 = $("<div>");
	        				div3.attr("id","content-left");
	        				let div4 = $("<div>");
	        				div4.attr("id","title");
	        				div4.css("height","60px");
	        				let strong = $("<strong>");
	        				strong.html(con["lectureTitle"].length<12?con["lectureTitle"]:con["lectureTitle"]);
	        				div4.append(strong);
	        				let div5 = $("<div>");
	        				div5.attr("id","place");
	        				let strong2 = $("<strong>");
	        				strong2.text("￦ " + con["price"]);
	        				div5.append(strong2);
	        				let div6 = $("<div>");
	        				div6.attr("id","addlist");
	        				let imgRate = $("<img>");
	        				imgRate.attr({"src":"https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png","width":"80px","height":"20px"});
	        				let span = $("<span>");
	        				span.text(con["commentCount"]==0?"":con["commentCount"]);
	        				div6.append(imgRate).append(span);
	        				div3.append(div4).append(div5).append(div6)
	        				let div7 = $("<div>");
	        				div7.attr("id","content-right");
	        				let div8 = $("<div>");
	        				div8.attr("id","frofile-img");
	        				let imgPro = $("<img>");
	        				imgPro.attr("src","<%= request.getContextPath() %>/upload/" + con["tutorImg"]);
	        				div8.append(imgPro);
	        				let div9 = $("<div>");
	        				div9.attr("id","frofile-name");
	        				let p = $("<p>");
	        				p.text(con["nickName"]);
	        				div9.append(p);
	        				div7.append(div8).append(div9);
	        				div2.append(div3).append(div7);
	        				div.append(imgSum).append(div2);
	        				a.append(div);
	        				li.append(a);
	        				$("#list-container2").find("ul").append(li);
        				}
        			}
        		});
        		$.ajax({
        			url : "<%= request.getContextPath() %>/vodLectureList",
        			dataType : "json",
        			success : data => {
        				for(let i=0; i<data.length; i++) {
        					let con = data[i]
        					let br = $("<br>");
	        				let li = $("<li>");
	        				let a = $("<a>");
<%-- 	        				a.attr("href","<%= request.getContextPath() %>/lecture/lecture.do?lectureNo=" + con["lectureNo"] + "&lectureType="+ con["lectureType"] );
 --%>	        				a.attr("href","<%= request.getContextPath() %>/lecture/lecture.do?lectureNo=" + con["lectureNo"] );
	        				let div = $("<div>");
	        				div.attr("id","list-content");
	        				let imgSum = $("<img>");
	        				imgSum.attr("src","<%= request.getContextPath() %>/upload/" + con["thumbnail"]);
	        				let div2 = $("<div>");
	        				let div3 = $("<div>");
	        				div3.attr("id","content-left");
	        				let div4 = $("<div>");
	        				div4.attr("id","title");
	        				div4.css("height","60px");
	        				let strong = $("<strong>");
	        				strong.html(con["lectureTitle"].length<12?con["lectureTitle"]:con["lectureTitle"]);
	        				div4.append(strong);
	        				let div5 = $("<div>");
	        				div5.attr("id","place");
	        				let strong2 = $("<strong>");
	        				strong2.text("￦ " + con["price"]);
	        				div5.append(strong2);
	        				let div6 = $("<div>");
	        				div6.attr("id","addlist");
	        				let imgRate = $("<img>");
	        				imgRate.attr({"src":"https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png","width":"80px","height":"20px"});
	        				let span = $("<span>");
	        				span.text(con["commentCount"]==0?"":con["commentCount"]);
	        				div6.append(imgRate).append(span);
	        				div3.append(div4).append(div5).append(div6)
	        				let div7 = $("<div>");
	        				div7.attr("id","content-right");
	        				let div8 = $("<div>");
	        				div8.attr("id","frofile-img");
	        				let imgPro = $("<img>");
	        				imgPro.attr("src","<%= request.getContextPath() %>/upload/" + con["tutorImg"]);
	        				div8.append(imgPro);
	        				let div9 = $("<div>");
	        				div9.attr("id","frofile-name");
	        				let p = $("<p>");
	        				p.text(con["nickName"]);
	        				div9.append(p);
	        				div7.append(div8).append(div9);
	        				div2.append(div3).append(div7);
	        				div.append(imgSum).append(div2);
	        				a.append(div);
	        				li.append(a);
	        				$("#list-container3").find("ul").append(li);
        				}
        			}
        		});
        	});
        </script>
<%@ include file="views/common/footer.jsp" %>