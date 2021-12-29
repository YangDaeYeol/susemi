<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.jiping.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("nickCheckMember");
	String newNick = (String)request.getAttribute("newNick");
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
	<div id="nickCheck-container" style="text-align:center; margin-top:30px;">
		<%if(m==null){ %>
		<span>[<%=newNick %></span>]는 사용이 가능한 닉네임입니다.
			<br><br>
			<button type="button" id="closeBtn">닫기</button>
		<%}else{ %>
		
		<span>[<%=newNick %></span>]는 이미 사용중인 닉네임입니다.
		<br><br>
		<form action="<%=request.getContextPath()%>/member/nicknameDuplicate.do" method="post">
			<input type="text" name="newNickname" id="newNickname">
			<input type="submit" value="중복검사">
		</form>
		<%} %>
	
	</div>
</body>
</html>
<script>
		const el=document.querySelector("#closeBtn").addEventListener("click",e=>{
			const newNickname='<%=newNick %>';
			console.log(newNickname);
			opener.userUpdateFrm.newNick.value=newNickname;
			opener.$("#newNick").focus();
			close();
		});
</script>