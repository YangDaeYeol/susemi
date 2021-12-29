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
<%@ page import="com.jiping.lecture.model.vo.Lecture,
				com.jiping.lecture.model.vo.VodLecture,
				java.util.List " %>
<%
	Lecture le= (Lecture)request.getAttribute("le");
	List<VodLecture> list= (List)request.getAttribute("vodList");
%>
<section>
<div class="container1">
    <div id="mainInfo" class="row" > 
                <span id="vod-title"><%=le.getLectureTitle() %></span>
        <div id="left" class="col-9"> <!--숫자로 조정-->
            <div>
            </div>
            <div id="player">
                <!-- <iframe width="100%" height="600px" src="https://www.youtube.com/embed/ltaDbuOl29E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
            </div>
        </div>

        <!-- https://getbootstrap.com/docs/5.1/components/list-group/ -->
        <div id="right" class="col">
            <p>
                수강진도율 : 1강/10강(10%)
            </p>
            <div class="list-group">
           <%for(int i=0; i<list.size(); i++) { %> 
                <div class="list-group-item list-group-item-action" style="display:inline;">
                	<div class="schedule-text">
	                    <!-- <img src="img/js_unchecked.png" alt="" class="checkicon">  -->
	                    <img src="<%=request.getContextPath() %>/img/js_unchecked.png" alt="" class="checkicon"> 
		                <span class="vod-content" style="display:none"><%=list.get(i).getVodContent() %></span>
	                    <span class="vod-name"> <%=i+1%>강. <%=list.get(i).getVodTitle() %></span>
	                    <input type="hidden" id="vod-url<%= i %>" name="vod-url" value="<%=list.get(i).getVodUrl() %>">
                    </div>
                </div>
               <%} %> 
              </div>
        </div>
    </div>
    <div id="review" class="row-1" style="display: inline;">
        <div>
            <span id="vodlist-title">1강. <%=list.get(0).getVodTitle() %></span>
        </div>
        <div>
            <span id="vodlist-content"><%=list.get(0).getVodContent() %></span>
        </div>
        <div class="btn-group" style="float: right;">
            <a href="#" class="btn btn-primary btn-basic">이전강의</a>
            <a href="#" class="btn btn-primary btn-basic">다음강의</a>
        </div> 
    </div>
</div>

<script>
 	let vodTitle;
  	let content;
	let temp="<%=list.get(0).getVodUrl()%>";
	$(".list-group-item").click(e => {
		vodTitle=$(e.target).find("span[class=vod-name]").clone();
		content=$(e.target).find("span[class=vod-content]").clone();
		temp=$(e.target).find("input[type=hidden]").val();
		content.css("display","block");
 		$("#vodlist-title").html(vodTitle);
		$("#vodlist-content").html(content);
		let cloneVod = $("#left").find("iframe").attr("src","https://www.youtube.com/embed/" + temp);
		$("#left").html(cloneVod);
	});
       var tag = document.createElement('script');
       
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        var player;
            function onYouTubeIframeAPIReady() {
                player = new YT.Player('player', {
                    width:'100%',
                    height:'600px',
                    videoId: temp,
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
</section>

</body>
</html>
