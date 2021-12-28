<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	* {
        font-family: "서울남산체";
    }
</style>
<meta charset="UTF-8">
<title>댓글 신고</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/styleGr.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
 <section style="text-align: center;">
        <div>
            <h4 style="margin-top: 10px;">댓글 신고하기</h4>
            <form action="" >
                <div class="">
                    <select name="comment-reason" style="margin-bottom: 15px; margin-right: 235px; margin-top: 15px;">
                        <option>신고유형 선택</option>
                        <option value="광고">광고</option>
                        <option value="욕설">욕설</option>
                        <option value="비방">비방</option>
                        <option value="허위">허위</option>
                        <option value="선정적인 댓글">선정적인 댓글</option>
                    </select> 
                </div>
                <div style="">
                    <textarea id="drop-reason" cols="40px" rows="5px" placeholder="" style="border-radius: 8px;"></textarea>
                    <!-- <div id="word-count" style="float:right;"></div> -->
                </div>
                <button class="btn btn-primary btn-basic" style="width:350px;">신고하기</button>    
                    
                </div>
            </form>
        </div>
    </section>
</body>
</html>