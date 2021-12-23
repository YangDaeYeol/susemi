<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 신고</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/styleGr.css"/>
</head>
<body>
 <section style="text-align: center;">
        <div>
            <h4>댓글 신고하기</h4>
            <form action="" >
                <div class="">
                    <select name="comment-reason" style="margin-bottom: 5px; margin-right: 70px;">
                        <option>신고유형 선택</option>
                        <option value="광고">광고</option>
                        <option value="욕설">욕설</option>
                        <option value="비방">비방</option>
                        <option value="허위">허위</option>
                        <option value="선정적인 댓글">선정적인 댓글</option>
                        <option value="기타">직접 작성</option>
                    </select> 
                    <span>2022/12/23</span>                                
                </div>
                <div style="">
                    <textarea id="drop-reason" cols="40px" rows="5px" placeholder="" style="border-radius: 8px;"></textarea>
                    <!-- <div id="word-count" style="float:right;"></div> -->
                </div>
                <button>신고하기</button>    
                    
                </div>
            </form>
        </div>
    </section>
</body>
</html>