<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보수정(유저)</title>
    <link rel="stylesheet" type="text/css" href="css/styleGr.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/styleKM.css"/>
</head>
<body>     
<section>       
    <div id="categoryPopup" class="inlineblock">                               
        <div>                                        
            <div class="menu-margin margin-left" id="inter-field" style="text-align: center;">
                <div class="info-title inlineblock" >
                    <span class="margin-right menu-list-name" style="vertical-align: middle; line-height: 150px">관심 분야</span>
                </div>
                <div class=" inlineblock" style="vertical-align: middle; line-height: 150px">                           
                    <div class="categorydiv flex">
                        <select name="largeCategory" class="form-select" id="largeCategory" style="width:200px">
                            <option value="0" selected="selected">대분류</option>
                            <option value="1">취미/공예</option>
                            <option value="2">액티비티</option>
                            <option value="3">커리어</option>
                            <option value="4">디자인</option>
                        </select>
                        <select name="smallCategory" class="form-select" id="smallCategory" style="width:200px">
                            <option value="0" selected="selected">소분류</option>
                            <!-- 취미/공예 -->
                            <option value="picture" class="sc1">사진/미술</option>
                            <option value="drawing" class="sc1">드로잉</option>
                            <option value="cooking" class="sc1">요리/베이킹</option>
                            <option value="music" class="sc1">음악</option>
                            <!-- 액티비티 -->
                            <option value="dance" class="sc2">댄스/무용</option>
                            <option value="act" class="sc2">연기</option>
                            <option value="sports" class="sc2">스포츠/레저</option>
                            <option value="exotic_sports" class="sc2">이색 액티비티</option>
                            <!-- 커리어 -->
                            <option value="competency" class="sc3">업무 역량</option>
                            <option value="marketing" class="sc3">마케팅</option>
                            <option value="programming" class="sc3">프로그래밍</option>
                            <option value="certificate" class="sc3">자격증/시험</option>
                            <option value="employment" class="sc3">취업/이직/진로</option>
                            <!-- 디자인 -->
                            <option value="architecturalD" class="sc4">건축</option>
                            <option value="graphicD" class="sc4">그래픽 디자인</option>
                            <option value="productD" class="sc4">제품 디자인</option>
                            <option value="videoD" class="sc4">영상 편집/제작</option>   
                        </select>
                    </div>                              
                    <div class="categorydiv">
                        <select name="largeCategory" class="form-select" id="largeCategory" style="width:200px">
                            <option value="0" selected="selected">대분류</option>
                            <option value="1">취미/공예</option>
                            <option value="2">액티비티</option>
                            <option value="3">커리어</option>
                            <option value="4">디자인</option>
                        </select>
                        <select name="smallCategory" class="form-select" id="smallCategory" style="width:200px">
                            <option value="0" selected="selected">소분류</option>
                            <!-- 취미/공예 -->
                            <option value="picture" class="sc1">사진/미술</option>
                            <option value="drawing" class="sc1">드로잉</option>
                            <option value="cooking" class="sc1">요리/베이킹</option>
                            <option value="music" class="sc1">음악</option>
                            <!-- 액티비티 -->
                            <option value="dance" class="sc2">댄스/무용</option>
                            <option value="act" class="sc2">연기</option>
                            <option value="sports" class="sc2">스포츠/레저</option>
                            <option value="exotic_sports" class="sc2">이색 액티비티</option>
                            <!-- 커리어 -->
                            <option value="competency" class="sc3">업무 역량</option>
                            <option value="marketing" class="sc3">마케팅</option>
                            <option value="programming" class="sc3">프로그래밍</option>
                            <option value="certificate" class="sc3">자격증/시험</option>
                            <option value="employment" class="sc3">취업/이직/진로</option>
                            <!-- 디자인 -->
                            <option value="architecturalD" class="sc4">건축</option>
                            <option value="graphicD" class="sc4">그래픽 디자인</option>
                            <option value="productD" class="sc4">제품 디자인</option>
                            <option value="videoD" class="sc4">영상 편집/제작</option>   
                        </select>
                    </div>
                    <div class="categorydiv flex">
                        <select name="largeCategory" class="form-select" id="largeCategory" style="width:200px">
                            <option value="0" selected="selected">대분류</option>
                            <option value="1">취미/공예</option>
                            <option value="2">액티비티</option>
                            <option value="3">커리어</option>
                            <option value="4">디자인</option>
                        </select>
                        <select name="smallCategory" class="form-select" id="smallCategory" style="width:200px">
                            <option value="0" selected="selected">소분류</option>
                            <!-- 취미/공예 -->
                            <option value="picture" class="sc1">사진/미술</option>
                            <option value="drawing" class="sc1">드로잉</option>
                            <option value="cooking" class="sc1">요리/베이킹</option>
                            <option value="music" class="sc1">음악</option>
                            <!-- 액티비티 -->
                            <option value="dance" class="sc2">댄스/무용</option>
                            <option value="act" class="sc2">연기</option>
                            <option value="sports" class="sc2">스포츠/레저</option>
                            <option value="exotic_sports" class="sc2">이색 액티비티</option>
                            <!-- 커리어 -->
                            <option value="competency" class="sc3">업무 역량</option>
                            <option value="marketing" class="sc3">마케팅</option>
                            <option value="programming" class="sc3">프로그래밍</option>
                            <option value="certificate" class="sc3">자격증/시험</option>
                            <option value="employment" class="sc3">취업/이직/진로</option>
                            <!-- 디자인 -->
                            <option value="architecturalD" class="sc4">건축</option>
                            <option value="graphicD" class="sc4">그래픽 디자인</option>
                            <option value="productD" class="sc4">제품 디자인</option>
                            <option value="videoD" class="sc4">영상 편집/제작</option>   
                        </select>
                    </div>                       
                </div>
                <button style="background-color: #94d5de; color:white; border: none; width: 120px; height: 30px; border-radius: 3px;"
                                on>
                    관심지역 선택
                </button> 
               
            </div>                                   
        </div>           
    </div>
</section>
</body>
</html>
<style>
	#categoryPopup{
		width : 500px;
		height : 500px;
		border: 1px solid black;
		margin:0 auto;
	}
</style>
<script>   
        var categories = false;
        function update_selected() {
        $("#smallCategory").val(0);
        $("#smallCategory").find("option[value!=0]").detach();
        $("#smallCategory").append(categories.filter(".sc" + $(this).val()));
        }

        $(function() {
            categories = $("#smallCategory").find("option[value!=0]");
            categories.detach();

            $("#largeCategory").change(update_selected);
            $("#largeCategory").trigger("change");
        });

       
</script>