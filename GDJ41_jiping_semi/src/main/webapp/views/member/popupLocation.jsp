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
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script> -->
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/styleKM.css"/>
    
</head>
<body>  
<section>       
    <div id="categoryPopup" class="inlineblock">               
        <div>                                                      
            <div class="menu-margin margin-left" id="tutor-area" style="text-align: center;">
                <div class="info-title inlineblock">
                    <span class="margin-right menu-list-name" style="vertical-align: middle; line-height: 150px">관심 지역</span>
                </div>
                <div class="inlineblock">
                   <div class="location-container">						
					<div class="locationdiv">
						<div id="nsdiSearchForm" class="form_data pb-1">
							<select id="sido_code1" class="form-select" style="width:200px;">
								<option>선택</option>
							</select>
							<select id="sigoon_code1" class="form-select" style="width:200px;">
								<option>선택</option>
							</select>
						</div>
						<div id="nsdiSearchForm2" class="form_data pb-1 pt-1" >
							<select id="sido_code2" class="form-select" style="width:200px;">
								<option>선택</option>
							</select>
							<select id="sigoon_code2" class="form-select" style="width:200px;">
								<option>선택</option>
							</select>
						</div>
						<div id="nsdiSearchForm3" class="form_data pb-1">
							<select id="sido_code3" class="form-select" style="width:200px;">
								<option>선택</option>
							</select>
							<select id="sigoon_code3" class="form-select" style="width:200px;">
								<option>선택</option>
							</select>
						</div>
					</div>
					
				</div>					
                <button style="background-color: #94d5de; color:white; border: none; width: 120px; height: 30px; border-radius: 3px;"
                        on>
                    관심지역 수정
                </button>                              
                </div>
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

        // 관심지역!!!
		//주소 api
      $(function(){
		$.ajax({
			type: "get",
			url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIDO_INFO",
			async: false,
			dataType: 'jsonp',
			success: function(data) {
				let html = "<option>선택</option>";

				data.response.result.featureCollection.features.forEach(function(f){
					let 행정구역코드 = f.properties.ctprvn_cd;
					let 행정구역명 = f.properties.ctp_kor_nm;
					
					html +="<option value='"+f.properties.ctprvn_cd+"'>"+f.properties.ctp_kor_nm+"</option>"
					
				})
				
	            $('#sido_code1').html(html);
				$('#sido_code2').html(html);
	            $('#sido_code3').html(html);
				
			},
			error: function(xhr, stat, err) {}
		});
		
		
		$(document).on("change","#sido_code1",function(){
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
				data : {attrfilter : 'sig_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						let 행정구역코드 = f.properties.sig_cd;
						let 행정구역명 = f.properties.sig_kor_nm;
						
						html +="<option value='"+f.properties.sig_cd+"'>"+f.properties.sig_kor_nm+"</option>"
						
					})
		            $('#sigoon_code1').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});
		});
		
		$(document).on("change","#sigoon_code1",function(){ 
			
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
				data : {attrfilter : 'emd_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						let 행정구역코드 = f.properties.emd_cd;
						let 행정구역명 = f.properties.emd_kor_nm;
						html +="<option value='"+f.properties.emd_cd+"'>"+f.properties.emd_kor_nm+"</option>"
						
					})
		            $('#dong_code1').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});

		});

		$(document).on("change","#sido_code2",function(){
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
				data : {attrfilter : 'sig_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						let 행정구역코드 = f.properties.sig_cd;
						let 행정구역명 = f.properties.sig_kor_nm;
						
						html +="<option value='"+f.properties.sig_cd+"'>"+f.properties.sig_kor_nm+"</option>"
						
					})
		            $('#sigoon_code2').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});
		});
		
		$(document).on("change","#sigoon_code2",function(){ 
			
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
				data : {attrfilter : 'emd_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						let 행정구역코드 = f.properties.emd_cd;
						let 행정구역명 = f.properties.emd_kor_nm;
						html +="<option value='"+f.properties.emd_cd+"'>"+f.properties.emd_kor_nm+"</option>"
						
					})
		            $('#dong_code2').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});

		});

		$(document).on("change","#sido_code3",function(){
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
				data : {attrfilter : 'sig_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						let 행정구역코드 = f.properties.sig_cd;
						let 행정구역명 = f.properties.sig_kor_nm;
						
						html +="<option value='"+f.properties.sig_cd+"'>"+f.properties.sig_kor_nm+"</option>"
						
					})
		            $('#sigoon_code3').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});
		});
		
		$(document).on("change","#sigoon_code3",function(){ 
			
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
				data : {attrfilter : 'emd_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						let 행정구역코드 = f.properties.emd_cd;
						let 행정구역명 = f.properties.emd_kor_nm;
						html +="<option value='"+f.properties.emd_cd+"'>"+f.properties.emd_kor_nm+"</option>"
						
					})
		            $('#dong_code3').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});

		});
	})	
</script>