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
                <div class="category-container">
         <div class="categorydiv" style="text-align: left; padding: 0 0 10px 10px; display:flex;">
         <select name="largeCategory" class="form-select" id="largeCategory" style="width:45%; margin-right:10px">
            <option value="0" selected="selected">대분류</option>
            <option value="1">취미/공예</option>
            <option value="2">액티비티</option>
            <option value="3">커리어</option>
            <option value="4">디자인</option>
            largeCategory=1&smallCategory=sc11&largeCategory=1&smallCategory=sc12&largeCategory=1&smallCategory=sc13
            String lc="";
            switch(largecategory){
            	case 1: lc="취미/공예"; break;
            	~~~~~
            	case 2: lc="~~~~"; break;
            }
            String sc="";
            switch(smallcategory){
            	case sc11: sc="취미/공예"; break;
            	~~~~~sc14
            	case sc44: sc="~~~~"; break;
            }
            
            sw
         </select>
         <select name="smallCategory" class="form-select" id="smallCategory" style="width:45%;">
            <option value="0" selected="selected">소분류</option>
            <!-- 취미/공예 -->
            <option value="sc11" class="sc1">사진/미술</option>
            <option value="sc12" class="sc1">드로잉</option>
            <option value="sc13" class="sc1">요리/베이킹</option>
            <option value="sc14" class="sc1">음악</option>
            <!-- 액티비티 -->
            <option value="sc21" class="sc2">댄스/무용</option>
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
         <input id="delete_btn" type="button" value="X" style="display:none; border: 0px; background-color: white; color: red"></input>
         </div>
         <div class="categoryAddDiv"></div>
         <button class="w-100 btn btn-lg btn_mint mt-2" id="categoryinsert" type="button">추가</button>
      </div>
      <div id="hiddenOption" style="display:none" >
         <select>
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
            <option value="exotic_sports" class="sc2">이색액티비티</option>
            <!-- 커리어 -->
            <option value="competency" class="sc3">업무역량</option>
            <option value="marketing" class="sc3">마케팅</option>
            <option value="programming" class="sc3">프로그래밍</option>
            <option value="certificate" class="sc3">자격증/시험</option>
            <option value="employment" class="sc3">취업/이직/진로</option>
            <!-- 디자인 -->
            <option value="architecturalD" class="sc4">건축</option>
            <option value="graphicD" class="sc4">그래픽디자인</option>
            <option value="productD" class="sc4">제품디자인</option>
            <option value="videoD" class="sc4">영상편집/제작</option>
         </select>   
      </div>
                    
                <button style="background-color: #94d5de; color:white; border: none; width: 120px; height: 30px; border-radius: 3px;"
                                onclick="saveCategoryBtn();">
                    관심분야 저장
                </button> 
               <script>
               		const saveCategoryBtn=()=>{
               			
               		}
               
               </script>
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
	.btn {
	  display: inline-block;
	  font-family: $btn-font-family;
	  font-weight: $btn-font-weight;
	  line-height: $btn-line-height;
	  color: $body-color;
	  text-align: center;
	  text-decoration: if($link-decoration == none, null, none);
	  white-space: $btn-white-space;
	  vertical-align: middle;
	  cursor: if($enable-button-pointers, pointer, null);
	  user-select: none;
	  background-color: transparent;
	  border: $btn-border-width solid transparent;
	  @include button-size($btn-padding-y, $btn-padding-x, $btn-font-size, $btn-border-radius);
	  @include transition($btn-transition);
	
	  &:hover {
	    color: $body-color;
	    text-decoration: if($link-hover-decoration == underline, none, null);
	  }
	
	  .btn-check:focus + &,
	  &:focus {
	    outline: 0;
	    box-shadow: $btn-focus-box-shadow;
	  }
	
	  .btn-check:checked + &,
	  .btn-check:active + &,
	  &:active,
	  &.active {
	    @include box-shadow($btn-active-box-shadow);
	
	    &:focus {
	      @include box-shadow($btn-focus-box-shadow, $btn-active-box-shadow);
	    }
	 }
	}
	 .btn_mint{
	 	background-color: #94d5de;
	 	width:50%;
	 	margin-bottom: 10px
	 }

  &:disabled,
  &.disabled,
  fieldset:disabled & {
    pointer-events: none;
    opacity: $btn-disabled-opacity;
    @include box-shadow(none);
  }
}
	
	
</style>
<script>   
//관심지역 버튼 누를떄 복사 되는 기능
$("#categoryinsert").click(e=>{
   const div=$($(".categorydiv")[0]).clone(true);
   //$(div).change()
   const addDiv=$(e.target).prev();
   console.log(div.children()[2].style.display);
   
   if(addDiv.children().length<2){
      addDiv.append(div);
      div.children()[2].style.display="inline";
   }else{
      alert("3개까지만 작성이 가능합니다");
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
   $(e.target).parent().detach();
})
       
</script>