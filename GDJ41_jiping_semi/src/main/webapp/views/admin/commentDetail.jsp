<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고된 댓글 보기</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styleGr.css"/>
</head>
<%@ page import="java.util.List,com.jiping.admin.model.vo.Report" %>
<%
	Report reportDetail = (Report)request.getAttribute("reportDetail");
	
%> 
<body>
	<section style="text-align: center;">
        <div>
            <h4>신고된 댓글 보기</h4>
            <form action="" >
                <div class="">
                    <select name="comment-reason" style="margin-bottom: 5px; margin-right: 70px;" disabled>
                        <option><%=reportDetail.getReportType() %></option>
                    </select> 
                    <span><%=reportDetail.getReportDate() %></span>                                
                </div>
                <div style="">
                    <textarea id="drop-reason" cols="40px" rows="5px" style="border-radius: 8px;" readonly> <%=reportDetail.getReportContent() %></textarea>
                    <!-- <div id="word-count" style="float:right;"></div> -->
                </div>
                <button>확인</button>    
                    
                </div>
            </form>
        </div>
    </section>
</body>
</html>