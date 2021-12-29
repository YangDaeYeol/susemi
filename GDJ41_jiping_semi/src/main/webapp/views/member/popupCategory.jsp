<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보수정(유저)</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/styleGr.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/styleKM.css"/>
    
</head>
<body>     
<section>       
	<div id="categoryPopup" class="inlineblock">                               
		<div class="menu-margin margin-left" id="inter-field" style="text-align: center;">
			<div class="info-title inlineblock" >
				<span class="margin-right menu-list-name" style="vertical-align: middle; line-height: 150px">관심 분야</span>
			</div>
			<div class="category-container">
				<div class="categorydiv" style="text-align: left; padding: 0 0 10px 10px; display:flex;">
					<select name="largeCategory" class="form-select" id="largeCategory" style="width:45%; margin-right:10px">
			            <option value="0" selected="selected">대분류</option>
			            <option value="1">취미/공예</option>
			            <option value="2">액티비티</option>
			            <option value="3">커리어</option>
			            <option value="4">디자인</option>
         			</select>
         			<script>
         			
	         			console.log($(select[name="largeCategory"]).val());
         			
	         		</script> 
					
					<select name="smallCategory" class="form-select" id="smallCategory" style="width:45%;">
			            <option value="0" selected="selected">소분류</option>
			            <!-- 취미/공예 -->
			            <option value="sc11" class="sc1">사진/미술</option>
			            <option value="sc12" class="sc1">드로잉</option>
			            <option value="sc13" class="sc1">요리/베이킹</option>
			            <option value="sc14" class="sc1">음악</option>
			            <!-- 액티비티 -->
			            <option value="sc21" class="sc2">댄스/무용</option>
			            <option value="sc22" class="sc2">연기</option>
			            <option value="sc23" class="sc2">스포츠/레저</option>
			            <option value="sc24" class="sc2">이색 액티비티</option>
			            <!-- 커리어 -->
			            <option value="sc31" class="sc3">업무 역량</option>
			            <option value="sc32" class="sc3">마케팅</option>
			            <option value="sc33" class="sc3">프로그래밍</option>
			            <option value="sc34" class="sc3">자격증/시험</option>
			            <option value="sc35" class="sc3">취업/이직/진로</option>
			            <!-- 디자인 -->
			            <option value="sc41" class="sc4">건축</option>
			            <option value="sc42" class="sc4">그래픽 디자인</option>
			            <option value="sc43" class="sc4">제품 디자인</option>
			            <option value="sc44" class="sc4">영상 편집/제작</option>   
					</select>
         			<input id="delete_btn" type="button" value="X" style="display:none; border: 0px; background-color: white; color: red"></input>
         		</div>
         		<div class="categoryAddDiv"></div>
				<button class="w-100 btn btn-lg btn_mint mt-2" id="categoryinsert" type="button">추가</button>
			</div>
      <!-- 가려진 select문 -->
		      <div id="hiddenOption" style="display:none" >
		         <select>
		            <option value="0" selected="selected">소분류</option>
		            <!-- 취미/공예 -->
		            <option value="sc11" class="sc1">사진/미술</option>
		            <option value="sc12" class="sc1">드로잉</option>
		            <option value="sc13" class="sc1">요리/베이킹</option>
		            <option value="sc14" class="sc1">음악</option>
		            <!-- 액티비티 -->
		            <option value="sc21" class="sc2">댄스/무용</option>
		            <option value="sc22" class="sc2">연기</option>
		            <option value="sc23" class="sc2">스포츠/레저</option>
		            <option value="sc24" class="sc2">이색액티비티</option>
		            <!-- 커리어 -->
		            <option value="sc31" class="sc3">업무역량</option>
		            <option value="sc32" class="sc3">마케팅</option>
		            <option value="sc33" class="sc3">프로그래밍</option>
		            <option value="sc34" class="sc3">자격증/시험</option>
		            <option value="sc35" class="sc3">취업/이직/진로</option>
		            <!-- 디자인 -->
		            <option value="sc41" class="sc4">건축</option>
		            <option value="sc42" class="sc4">그래픽디자인</option>
		            <option value="sc43" class="sc4">제품디자인</option>
		            <option value="sc44" class="sc4">영상편집/제작</option>
		         </select>   
				</div>
				<button style="background-color: #94d5de; color:white; border: none; width: 120px; height: 30px; border-radius: 3px;"
                                onclick="saveCategoryBtn();">
                    		관심분야 저장
                </button> 
                <button onclick="window.close();" style="background-color: #94d5de; color:white; border: none; width: 70px; height: 30px; border-radius: 3px;">
                			닫기
                </button>
		</div>                                   
	</div>
</section>
</body>
</html>
<script>
	

</script>

<script>   
	//관심지역 버튼 누를떄 복사 되는 기능
	$("#categoryinsert").click(e=>{
	   const div=$($(".categorydiv")[0]).clone(true);
	   //$(div).change()
	   const addDiv=$(e.target).prev();
	   //console.log(div.children()[2].style.display);
	   if(addDiv.children().length<2){
	      addDiv.append(div);
	      div.children()[2].style.display="inline";
	   }else{   
	      alert("3개까지만 작성이 가능합니다");
	   }
	   addDiv.children()[0].className="categorydiv1";
	   if(addDiv.children()[1]!=null){
	      addDiv.children()[1].className="categorydiv2";
	   }
	})
	
	//카테고리 대분류 소분류 가동 스크립트
	function update_selected(e) {
	   const smallCategory=$("#hiddenOption>select>option").clone();
	   //console.log(smallCategory);
	   //console.log($(e.target));//대분류
	   $(e.target).next().html(smallCategory[0]);
	   smallCategory.each((i,v)=>{
	      v.className.includes(e.target.value)&&$(e.target).next().append(v);
	   });
	}
	$(function() {
	   $("#largeCategory").change(update_selected);
	   $("#largeCategory").change();
	});   
	//삭제 버튼 누를시 div 삭제되는 로직
	$("#delete_btn").click(e=>{
	   $(e.target).parent().parent().children()[0].className="categorydiv1";
	   $(e.target).parent().parent().children()[1].className="categorydiv1";
	   $(e.target).parent().detach();
	   
	})
       
</script>

