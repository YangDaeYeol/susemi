<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jiping.member.model.vo.Member" %>
<%
	Member loginMember=(Member)session.getAttribute("loginMember"); 
	

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styleGr.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/viewStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 윤미꺼 js/css들 시작 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bs-stepper.min.css">
    <script src="<%=request.getContextPath() %>/js/bs-stepper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- 윤미꺼 js/css들 끝 -->
    <style>
    	.container {
    		padding-right: 0;
    		padding-left: 0;
    	}
    </style>
    
    <title>지핑</title>
</head>
<body>
    <div id="container">
        <header>
            <div>
                <div id="header-top">
                    <h1><a href="<%= request.getContextPath()%>/main"><img src="<%= request.getContextPath() %>/img/logo.png" width="80px" height="80px"></a></h1>
                    <div id="header-search">
                        <img src="<%= request.getContextPath() %>/img/searchicon.png" width="28px" height="28px">
                        <input type="search" id="searchBar" placeholder="검색어를 입력해주세요.">
                    </div>
                    <div id="header-btn">
                    <%if(loginMember==null){ %>
                        <button id="enrollMemberBtn"><span>회원가입</span></button>
                        <button id="loginBtn" 
                        	onclick="location.assign('<%=request.getContextPath()%>/member/loginPage.do');"><span>로그인</span></button>
                    <% } %>
                        	<%if(loginMember!=null){ %>
                    		<span onclick="location.assign('<%=request.getContextPath() %>/member/mypage.do?email=<%=loginMember.getEmail()%>');">마이페이지</span>
                    		<span onclick="location.assign('<%=request.getContextPath() %>/member/logout.do?email=<%=loginMember.getEmail()%>');">로그아웃</span>
                    		<%} %>
                    </div>
                </div>
                <div id="nav-container">
                    <div id="header-nav">
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=취미/공예">취미/공예</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=액티비티">액티비티</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어">커리어</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=디자인">디자인</a></li>
                        </ul>
                    </div>
                    <div id="header-nav-sub1">
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=취미/공예&smallcategory=사진">사진</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=취미/공예&smallcategory=취미미술">취미미술</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=취미/공예&smallcategory=디지털드로잉">디지털드로잉</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=취미/공예&smallcategory=요리/베이킹">요리/베이킹</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=취미/공예&smallcategory=커피/차/술">커피/차/술</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=취미/공예&smallcategory=보컬">보컬</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=취미/공예&smallcategory=악기">악기</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=취미/공예&smallcategory=작곡/디제잉">작곡/디제잉</a></li>
                        </ul>
                    </div>
                    <div id="header-nav-sub2">
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=액티비티&smallcategory=방송댄스">방송댄스</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=액티비티&smallcategory=연기/무용">연기/무용</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=액티비티&smallcategory=스포츠/레저">스포츠/레저</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=액티비티&smallcategory=이색액티비티">이색액티비티</a></li>
                        </ul>
                    </div>
                    <div id="header-nav-sub3">
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=업무역량">업무역량</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=마케팅">마케팅</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=취업">취업</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=엑셀">엑셀</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=파워포인트">파워포인트</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=스피치">스피치</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=데이터분석">데이터분석</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=앱개발">앱개발</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=컴퓨터공학">컴퓨터공학</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=커리어&smallcategory=자격증">자격증</a></li>
                        </ul>
                    </div>
                    <div id="header-nav-sub4">
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=디자인&smallcategory=건축">건축</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=디자인&smallcategory=그래픽디자인">그래픽디자인</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=디자인&smallcategory=UI/UX디자인">UI/UX디자인</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=디자인&smallcategory=제품디자인">제품디자인</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=디자인&smallcategory=영상편집">영상편집</a></li>
                            <li><a href="<%= request.getContextPath() %>/submenupage?largecategory=디자인&smallcategory=영상제작">영상제작</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <form name="searchFrm">
        	<input type="hidden" name="searchKeyword" />
        </form>
        <script>
        $(() => {
            for(let i=1; i<5; i++) {
                $("#header-nav>ul>li:nth-child(" + i + "),#header-nav-sub" + i).mouseenter(e=> {
                    $("#header-nav-sub1,#header-nav-sub2,#header-nav-sub3,#header-nav-sub4").css({"display":"none"});
                    $("#header-nav>ul>li").css({"background-color":"white"});
                    $("#header-nav>ul>li>a").css({"color":"#94D5DE"});
                    $("#header-nav-sub" + i).css({"display":"flex"});
                    $("#header-nav>ul>li:nth-child(" + i + ")").css({"background-color":"#94D5DE"});
                    $("#header-nav>ul>li:nth-child(" + i + ")").find("a").css({"color":"white"});
                });
                $("#header-nav>ul>li:nth-child(" + i + "),#header-nav-sub" + i).mouseleave(e=> {
                    $("#header-nav-sub1,#header-nav-sub2,#header-nav-sub3,#header-nav-sub4").css({"display":"none"});
                    $("#header-nav>ul>li").css({"background-color":"white"});
                    $("#header-nav>ul>li>a").css({"color":"#94D5DE"});
                });
            }
        });
        $("#searchBar").focusin(e => {
            $(e.target).parent().css({"border":"3px #94D5DE solid"});
        });
        $("#searchBar").focusout(e => {
            $(e.target).parent().css({"border":"1px #94D5DE solid"});
        });
        $("#enrollMemberBtn").click(e=> {
        	location.assign("<%= request.getContextPath() %>/enrollMember");
        });
        $("#searchBar").keydown(e=> {
        	if(e.keyCode==13) {
        		const keyword = $(e.target).val();
	        	const url = "<%= request.getContextPath() %>/searchResult";
	        	searchFrm.searchKeyword.value = keyword;
	        	searchFrm.action = url;
	        	searchFrm.method = "post";
	        	searchFrm.submit();
        	}
        })
    </script>