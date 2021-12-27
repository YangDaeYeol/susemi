<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<section id="sectionMargin">
            <div id="mypage-container" class="flex">
                <div class=" inlineblock overflow" id="mypage-menu">          
                    <h3>MANAGER</h3>                           
                    <div class="" id="my-menu" >
                        <ul id="menu-list">
                            <nav class="nav-sub">
                            	<li><a href="">· 회원 관리</a></li>
                            	<ul id="sub-menu">
                                    <li><a href="<%=request.getContextPath()%>/admin/adminNormalMemberList">- 수강생 목록</a></li>
                                    <li><a href="<%=request.getContextPath()%>/admin/adminTutorList">- 튜터 목록</a></li>
                                </ul>	
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