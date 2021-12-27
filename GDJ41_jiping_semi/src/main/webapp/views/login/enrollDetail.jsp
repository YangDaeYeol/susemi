<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jiping.member.model.vo.Member" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleKM.css">
<% Member m = (Member)request.getAttribute("member"); %>
	<main class="form-signin form-detail">
		<form action="<%=request.getContextPath() %>/enrollmemberend" method="post">
			<input type="hidden" name="email" value="<%= m.getEmail() %>">
			<input type="hidden" name="grade" value="<%= m.getMemberGrade() %>">
			<input type="hidden" name="password" value="<%= m.getPassword() %>">
			<input type="hidden" name="userName" value="<%= m.getMemberName() %>">
			<input type="hidden" name="nickName" value="<%= m.getNickname() %>">
			<h4 class="h4 fw-normal mb-5">
				추가 정보를 작성하면<br>
				맞춤 서비스가 제공됩니다.
			</h4>
			<div class="phone-container">
				<span class="loginContent fs_14">전화번호</span>
				<input type="text" class="form-control" name="phone" id="email" placeholder="-를 제외한 휴대폰 번호를 입력해주세요">
			</div>
			<div class="gender-container">
				<span class="loginContent fs_14">성별</span>
				<input type="radio" name="gender" id="male" value="남자">
				<label for="male">남자</label>
				<input type="radio" name="gender" id="female" value="여자">
				<label for="female">여자</label>
			</div>
			<div class="category-container">
				<span class="loginContent fs_14">관심분야 선택</span>
				<div class="categorydiv">
					<select name="largeCategory" class="form-select" id="largeCategory">
						<option value="0" selected="selected">대분류</option>
						<option value="1">취미/공예</option>
						<option value="2">액티비티</option>
						<option value="3">커리어</option>
						<option value="4">디자인</option>
					</select>
					<select name="smallCategory" class="form-select" id="smallCategory">
						<option value="0" selected="selected">소분류</option>
						<!-- 취미/공예 -->
						<option value="사진/미술" class="sc1">사진/미술</option>
						<option value="드로잉" class="sc1">드로잉</option>
						<option value="요리/베이킹" class="sc1">요리/베이킹</option>
						<option value="음악" class="sc1">음악</option>
						<!-- 액티비티 -->
						<option value="댄스/무용" class="sc2">댄스/무용</option>
						<option value="연기" class="sc2">연기</option>
						<option value="스포츠/레저" class="sc2">스포츠/레저</option>
						<option value="이색 액티비티" class="sc2">이색 액티비티</option>
						<!-- 커리어 -->
						<option value="업무역량" class="sc3">업무역량</option>
						<option value="마케팅" class="sc3">마케팅</option>
						<option value="프로그래밍" class="sc3">프로그래밍</option>
						<option value="자격증/시험" class="sc3">자격증/시험</option>
						<option value="취업/이직/진로" class="sc3">취업/이직/진로</option>
						<!-- 디자인 -->
						<option value="건축" class="sc4">건축</option>
						<option value="그래픽디자인" class="sc4">그래픽디자인</option>
						<option value="제품디자인" class="sc4">제품디자인</option>
						<option value="영상편집/제작" class="sc4">영상편집/제작</option>	
					</select>
				</div>
				<div class="categoryAddDiv"></div>
				<% if(m.getMemberGrade().equals("수강생")) { %>
				<button class="w-100 btn btn-lg btn_mint mt-2" id="categoryinsert" type="button">추가</button>
				<% } %>
			</div>
			<!-- 지역 -->
			<!-- 브이월드 행정구역도를 이용한 셀렉트 박스 구현... 공간정보를 기반으로 하고 있어서 국가공간정보포털보다 느림 -->
			<div class="location-container">
				<span class="loginContent fs_14">관심지역 선택</span>
				<div class="locationdiv">
	<!--  					<form id="nsdiSearchForm" class="form_data pb-1" onsubmit="return false;search();"> -->
					<div id="nsdiSearchForm" class="form_data pb-1">
						<select id="sido_code1" class="form-select">
							<option>선택</option>
						</select>
						<select id="sigoon_code1" class="form-select">
							<option>선택</option>
						</select>
					</div>
<!-- 					</form>
					<form id="nsdiSearchForm2" class="form_data d-none pb-1 pt-1" onsubmit="return false;search();"> -->
					<div id="nsdiSearchForm2" class="form_data d-none pb-1 pt-1">
						<select id="sido_code2" class="form-select">
							<option>선택</option>
						</select>
						<select id="sigoon_code2" class="form-select">
							<option>선택</option>
						</select>
					</div>
<!-- 					</form>
					<form id="nsdiSearchForm3" class="form_data d-none pb-1" onsubmit="return false;search();"> -->
					<div id="nsdiSearchForm3" class="form_data d-none pb-1">
						<select id="sido_code3" class="form-select">
							<option>선택</option>
						</select>
						<select id="sigoon_code3" class="form-select">
							<option>선택</option>
						</select>
					</div>
		<!-- 			</form> -->
				</div>
				<% if(m.getMemberGrade().equals("수강생")) { %>
				<button class="w-100 btn btn-lg btn_mint mt-2 mb-3" id="locationinsert" type="button">추가</button>
				<% } %>
			</div>
			<!-- 지역끝 -->
			<!-- 마케팅 시작 -->
			<div class="marketing-container mb-5" style="text-align: center;">
				<h4 class="loginContent d-inline" style="margin-right: 30px;">마케팅 정보수신</h4>
				<div class="toggle" id="marketingBtn" style="vertical-align: middle;">
					<input type="checkbox" name="toggle1" id="toggle1">
					<label for="toggle1"></label>
				</div>
			</div>  
			<input type="hidden" id="marketing" name="marketing" value="N">
			<input type="hidden" id="largeLocation1" name="largeLocation1" value="">
			<input type="hidden" id="smallLocation1" name="smallLocation1" value="">
			<input type="hidden" id="largeLocation2" name="largeLocation2" value="x">
			<input type="hidden" id="smallLocation2" name="smallLocation2" value="x">
			<input type="hidden" id="largeLocation3" name="largeLocation3" value="x">
			<input type="hidden" id="smallLocation3" name="smallLocation3" value="x">
			<!-- 마케팅 끝 -->
			<button class="w-100 btn btn-lg btn_mint mb-3" id="aaa">회원가입</button>
		</form>
	</main>
<script>
 	for(let i=1; i<4; i++) {
		$("#sido_code" + i).change(e=> {
			let largeLocation = $(e.target).find("option:selected").text();
			console.log(largeLocation);
			$("#largeLocation" + i).val(largeLocation);
		});
		$("#sigoon_code" + i).change(e=> {
			let smallLocation = $(e.target).find("option:selected").text();
			console.log(smallLocation);
			$("#smallLocation" + i).val(smallLocation);
		});	
	}
</script>
<script>
	//버튼 on/off 스크립트
	const check=document.getElementById("toggle1");
	
	$("#toggle1").click(e=>{
		if(check.checked){
			$("#marketing").val("Y");
		}else{
			$("#marketing").val("N");
		}
	});

	//관심 분야 선택 스크립트
	let categoryNum = 0;
	$("#categoryinsert").click(e=>{
		const div=$(".categorydiv").clone();
		console.log(div.find("#smallCategory").val());
		categoryNum++;
		if(categoryNum<2){
			div.removeClass("categorydiv").addClass("categorydiv"+categoryNum);
			div.find("select[name=largeCategory]").attr("name","largeCategory" + categoryNum)
			div.find("select[name=smallCategory]").attr("name","smallCategory" + categoryNum)
			$(".categoryAddDiv").append(div);
		}else{
			div.removeClass("categorydiv").addClass("categorydiv"+categoryNum);
			div.find("select[name=largeCategory]").attr("name","largeCategory" + categoryNum)
			div.find("select[name=smallCategory]").attr("name","smallCategory" + categoryNum)
			$(".categoryAddDiv").append(div);
			$("#categoryinsert").addClass("d-none");
		}
	})

	//관심 지역 선택 스크립트
	let locationNum = 1;
	$("#locationinsert").click(e=>{
		locationNum++;
		if(locationNum<3){
			$("#nsdiSearchForm"+locationNum).removeClass("d-none").addClass("d-block");
		}else{
			$("#nsdiSearchForm"+locationNum).removeClass("d-none").addClass("d-block");
			$("#locationinsert").addClass("d-none");
		}
	})

	//카테고리 대분류 소분류 가동 스크립트
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
