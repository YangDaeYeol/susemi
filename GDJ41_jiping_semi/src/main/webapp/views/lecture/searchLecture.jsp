<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.jiping.lecture.model.vo.Lecture" %>
<%
	List<Lecture> list = (List)request.getAttribute("list"); 
	String keyword = (String)request.getAttribute("keyword");
	int totalData = (int)request.getAttribute("totalData");
%>
<style>
	#searchCon {
		margin-bottom: 30px;
		margin-top: 30px;
	}
	#searchCon>div>h1 {
		padding-top: 200px;
	}
	#searchText {
		background-color: white;
		color: black;
	}
	#class-list>div:first-child {
		display:inline-block;
		float : left;
		text-align: left;
	}
	
	#class-list {
		margin-top: 30px;
		display: grid;
	}
	#class-list>div {
		display:block;
	}
	#class-list ul {
		width:1248px;
		white-space: nowrap;
	}
	#class-list ul li {
		white-space:normal;
	}
	#title {
		height: 60px;
	}
	#pageBar {
		margin: 0 auto;
	}
</style>
<section>
	<div id="searchCon">
		<div id="class-list">
			<% if(list.isEmpty()) { %>
			<style>
				#searchCon>div {
					margin: 0 auto;
					text-align: center;
					height: 500px;
				}
			</style>
			<h1>"<%= keyword %>" 검색 결과가 없습니다.</h1>
			<% }else { %>
			<div>
            	<h5>"<%= keyword %>" 검색 결과</h5>
            	<h6>총 <%= totalData %>개</h6>
            </div>
			<div id="list-container1">
				<%for(int i=0; i<list.size(); i++) { %>
					<% if(i%4==0) { %>
						<ul>
							<li>  
	                           <a href="<%= request.getContextPath() %>/lecture/lecture.do?lectureNo=<%= list.get(i).getLectureNo() %>&lectureType=<%= list.get(i).getLectureType() %>">
	                               <div id="list-content">
	                                   <img src="<%= request.getContextPath() %>/upload/<%= list.get(i).getThumbNail()%>">
	                                   <div>
	                                       <div id="content-left">
	                                           <div id="title">
	                                               <strong><%= list.get(i).getLectureTitle() %></strong>
	                                           </div>
	                                           <div id="place">
	                                               <strong>￦ <%= list.get(i).getPrice() %></strong>
	                                           </div>
	                                           <div id="addlist">
	                                               <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" width="80px" height="20px"><span><%= list.get(i).getCommentCount()==0?"":list.get(i).getCommentCount() %></span>
	                                           </div>
	                                       </div>
	                                       <div id="content-right">
	                                           <div id="frofile-img">
	                                               <img src="<%= request.getContextPath() %>/upload/<%= list.get(i).getTutorImg()%>">
	                                           </div>
	                                           <div id="frofile-name">
	                                               <p><%= list.get(i).getNickName() %></p>
	                                           </div>
	                                       </div>
	                                   </div>
	                               </div>
	                           </a>
	                       </li>
					<% }else { %>
						<li>  
                           <a href="<%= request.getContextPath() %>/lecture/lecture.do?lectureNo=<%= list.get(i).getLectureNo() %>&lectureType=<%= list.get(i).getLectureType() %>">
                               <div id="list-content">
                                   <img src="<%= request.getContextPath() %>/upload/<%= list.get(i).getThumbNail()%>">
                                   <div>
                                       <div id="content-left">
                                           <div id="title">
                                               <strong><%= list.get(i).getLectureTitle() %></strong>
                                           </div>
                                           <div id="place">
                                               <strong>￦ <%= list.get(i).getPrice() %></strong>
                                           </div>
                                           <div id="addlist">
                                               <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" width="80px" height="20px"><span><%= list.get(i).getCommentCount()==0?"":list.get(i).getCommentCount() %></span>
                                           </div>
                                       </div>
                                       <div id="content-right">
                                           <div id="frofile-img">
                                               <img src="<%= request.getContextPath() %>/upload/<%= list.get(i).getTutorImg()%>">
                                           </div>
                                           <div id="frofile-name">
                                               <p><%= list.get(i).getNickName() %></p>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           </a>
                       </li>
					<% } %>
					<% if(i%4==3) { %>
					</ul>
					<% } %>
				<% } %>
			</div>
			<% } %>
			<div id="pageBar">
			<%= request.getAttribute("pageBar") %>
			</div>
		</div>
	</div>
	<script>
		$("#pageBar>span").css({"float":"none"});
	</script>
</section>
<%@ include file="/views/common/footer.jsp" %>