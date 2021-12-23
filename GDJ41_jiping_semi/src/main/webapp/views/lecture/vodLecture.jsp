<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/viewStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
</head>
<body>
<section>
<div class="container">
    <div id="mainInfo" class=row> 
        <div id="left" class="col-9"> <!--숫자로 조정-->
            <div>
                <span id="vod-title">강의제목</span>
            </div>
            <div id="player">
                <!-- <iframe width="100%" height="600px" src="https://www.youtube.com/embed/ltaDbuOl29E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
            </div>
        </div>
<script>
       var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        var player;
            function onYouTubeIframeAPIReady() {
                player = new YT.Player('player', {
                    width:'100%',
                    height:'600px',
                    videoId: 'UnIBtxMJEn4',
                    events: {
                        'onReady': onPlayerReady,
                        'onStateChange':checkPlayerState
                    }
                });
            }
            function onPlayerReady(event) {
            event.target.playVideo();
            }
            function checkPlayerState(event) {          
                if(event.target.getPlayerState()==2) { //일시정지일때
                    var test=player.getCurrentTime();
                    var total=player.getDuration();
                    alert(Math.trunc(test/total*100)+"%");
                }
            }            
</script>

        <!-- https://getbootstrap.com/docs/5.1/components/list-group/ -->
        <div id="right" class="col">
            <p>
                수강진도율 : 1강/10강(10%)
            </p>
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action" style="display:inline;">
                    <!-- <img src="<%=request.getContextPath() %>/img/js_unchecked.png" alt="" class="checkicon">  -->
                    <img src="<%=request.getContextPath() %>/img/js_checked.png" alt="" class="checkicon"> 
                    <span class="vod-name"> 1강. 자바첫걸음</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action" style="display:inline;">
                    <img src="<%=request.getContextPath() %>/img/js_unchecked.png" alt="" class="checkicon">
                    <%-- <img src="<%=request.getContextPath() %>/img/js_checked.png" alt="" class="checkicon">  --%>
                    <span class="vod-name"> 2강. 오픈소스 라이선스 확인 방법과 라이선스 의무사항 준수</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action" style="display:inline;">
                    <img src="<%=request.getContextPath() %>/img/js_unchecked.png" alt="" class="checkicon">
                    <%-- <img src="<%=request.getContextPath() %>/img/js_checked.png" alt="" class="checkicon"> --%> 
                    <span class="vod-name"> 2강. 오픈소스 라이선스 확인 방법과 라이선스 의무사항 준수</span>
                </a> 
              </div>
        </div>
    </div>
    <div id="review" class="row-1" style="display: inline;">
        <div>
            <span id="vodlist-title">1강 어쩌구</span>
        </div>
        <div>
            <span>강의설명 이 강의는 자바에 대한 기초를 ...</span>
        </div>
        <div class="btn-group" style="float: right;">
            <a href="#" class="btn btn-primary btn-basic">이전강의</a>
            <a href="#" class="btn btn-primary btn-basic">다음강의</a>
        </div>
    </div>
</div>

</section>

</body>
</html>
