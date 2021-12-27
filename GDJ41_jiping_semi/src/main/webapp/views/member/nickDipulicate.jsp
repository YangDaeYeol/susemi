<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.jiping.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("nickCheckMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	div#checkId-container{
		text-align:center;
		padding-top:50px;
	}
	span#dublicated{
		color:red;
		font-weight:bolder;
	}

</style>
</head>
<body>
	<div id="nickCheck-container">
		<%if(m==null){ %>
		<span>[<%=request.getParameter("newNick") %></span>]는 사용이 가능한 닉네임입니다.
			<br><br>
			<button type="button" id="btn">닫기</button>
		<%}else{ %>
		
		<span>[<%=request.getParameter("newNick") %></span>]는 이미 사용중인 닉네임입니다.
		<br><br>
		<form action="<%=request.getContextPath()%>/member/idDuplicate.do" method="post">
			<input type="text" name="nickname" id="nickname">
			<input type="submit" value="중복검사">
		</form>
		<%} %>
	
	</div>
</body>
</html>