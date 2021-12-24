<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  .areaClass {
    margin-top: 7%;
    font-size: 25px;
    text-align: left;
    
  }

  .smallAreaClass {
    text-align: left;
  }

  #col4 {
    font-size: 25px;
  }

  #row2 {
    margin-bottom: 5%;
  }

  #title {
    font-size: 20px;
  }

  #price {
    font-size: 15px;
  }

  .col {
    margin-bottom: 40px;
  }



  .classListImage {
    width: 250px;
    height: 200px;
  }

  .reviewPoint {
    width: 80px;
    margin-right: 120px;
  }

  .zzimOrNot {
    width: 20px;
  }


.showAllClass {
    text-align: right;
    margin-bottom: 2%;
  }
  #classListContainer{
    margin-bottom: 40px;
    margin-left: 10%;
    margin-right: 10%;

  }
  .example{
    position: relative;
  }


.overlay {
  display: block;
  position: absolute; 
  top: 0;
  bottom: 0; 
  width: 20%;
  transition: .5s ease;
  opacity:1;
}
.example:hover .overlay {
  opacity: 0;
}

 
</style>
<body>
<div id="container">
   <%@ include file="/views/common/header.jsp" %>

  
    <section>
      <div id="classListContainer">
        <div class="areaClass">지역별 클래스</div>
        <div class="smallAreaClass">마포구 클래스</div>
        <div class="showAllClass">전체 강의 보기</div>



      </div>
      <div>
        <div class="container">
          <div class="row align-items-start" style="margin-top:-15px;">
            <div class="col">
              <div class="example">
              <img class="classListImage" src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58">
              <img class="overlay" src="https://media.cdnandroid.com/item_images/931706/imagen-i-ee-i-i-e-ee-i-i-ee-ee-eea-0thumb.jpeg">

            </div>              <br>
              <div id="title">달콩이의 아이패드 드로잉</div>
              <div id="price">198,000원</div>
              <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>

            </div>
            <div class="col">
              <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                class="classListImage"><br>
              <div id="title">달콩이의 아이패드 드로잉</div>
              <div id="price">198,000원</div>
              <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>

            </div>
            <div class="col">
              <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                class="classListImage"><br>
              <div id="title">달콩이의 아이패드 드로잉</div>
              <div id="price">198,000원</div>
              <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>

            </div>
            <div class="col">
              <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                class="classListImage"><br>
              <div id="title">달콩이의 아이패드 드로잉</div>
              <div id="price">198,000원</div>
              <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>

            </div>
          </div>
        </div>
        <div class="container">
          <div class="row align-items-start">
            <div class="col">
              <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                class="classListImage"><br>
              <div id="title">달콩이의 아이패드 드로잉</div>
              <div id="price">198,000원</div>
              <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>

            </div>
            <div class="col">
              <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                class="classListImage"><br>
              <div id="title">달콩이의 아이패드 드로잉</div>
              <div id="price">198,000원</div>
              <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>

            </div>
            <div class="col">
              <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                class="classListImage"><br>
              <div id="title">달콩이의 아이패드 드로잉</div>
              <div id="price">198,000원</div>
              <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>

            </div>
            <div class="col">
              <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                class="classListImage"><br>
              <div id="title">달콩이의 아이패드 드로잉</div>
              <div id="price">198,000원</div>
              <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>

            </div>
          </div>
        </div>
        <div id="classListContainer2">
          <div style="margin-left: 10%; margin-right: 10%;">
          <div class="areaClass">실시간 TOP10</div>
          <div class="showAllClass">전체 강의 보기</div>
        </div>
          <div></div>
          <div class="container">
            <div class="row align-items-start">
              <div class="col">
                <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                  class="classListImage"><br>
                <div id="title">달콩이의 아이패드 드로잉</div>
                <div id="price">198,000원</div>
                <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                  class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                  alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>
  
              </div>
              <div class="col">
                <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                  class="classListImage"><br>
                <div id="title">달콩이의 아이패드 드로잉</div>
                <div id="price">198,000원</div>
                <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                  class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                  alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>
  
              </div>
              <div class="col">
                <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                  class="classListImage"><br>
                <div id="title">달콩이의 아이패드 드로잉</div>
                <div id="price">198,000원</div>
                <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                  class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                  alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>
  
              </div>
              <div class="col">
                <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58"
                  class="classListImage"><br>
                <div id="title">달콩이의 아이패드 드로잉</div>
                <div id="price">198,000원</div>
                <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12"
                  class="reviewPoint"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png"
                  alt="2021-12-16-21-58-23" class="zzimOrNot">130<br>
  
              </div>
            </div>
  
  
  
        </div>



      </div>


  
  </section>

   <%@ include file="/views/common/footer.jsp" %>
</div>

</body>

</html>