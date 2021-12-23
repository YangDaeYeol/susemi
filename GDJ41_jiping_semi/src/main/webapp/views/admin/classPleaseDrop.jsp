<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스지워죠</title>
 <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styleGr.css">
 </head>
 <body>
	<section>
        <div style="text-align: center; vertical-align: middle;">
            <div>
                <h4>(튜터가)클래스 삭제 요청 사유</h4>
                <textarea id="drop-reason" cols="63px" rows="5px" placeholder="" style="border-radius: 8px; margin-bottom: 10px;"></textarea>
                <div id="word-count" style="float:right;"></div>
            </div>
            <div>
                <button>요청 보내기</button>
            </div>
        </div>
    </section>
</body>