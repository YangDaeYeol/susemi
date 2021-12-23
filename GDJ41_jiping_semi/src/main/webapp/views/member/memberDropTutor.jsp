<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
	<section id="sectionMargin">
            <div id="drop-container" class="flex">
                <div class="inlineblock overflow" id="mypage-menu">          
                    <h3>MY PAGE</h3>
                    <div class="" id="my-menu" >
                        <ul id="menu-list">
                            <li><a href="">· 나의정보</a></li>
                            <li><a href="">· 정보수정</a></li>
                            <nav class="nav-sub">
                                <li ><a href="">· 클래스</a></li>
                                <ul id="sub-menu">
                                    <li><a>- 운영중인 클래스</a></li>
                                    <li><a>- 운영종료 클래스</a></li>
                                </ul>
                            </nav>
                            <li><a href="">· 회원탈퇴</a></li>
                        </ul>                  
                    </div>
                </div>
                <div class="" id="mypage-content">
                    <img id="info-icon" src="<%=request.getContextPath() %>/img/remove-user.png" width="30px" height="30px" class="inlineblock" style="margin-bottom: 10px;">
                    <h4 class="inlineblock" style="margin-bottom: 0;">회원탈퇴</h4> 
                    <div class="line"></div>
                    <div style="margin-left: 50px;">   
                        <div id="dropLine1" class="flex" >
                            <div class="inlineblock "><img src="<%=request.getContextPath() %>/img/hand.png" alt="" width="50px" height="50px"></div>
                            <div class="inlineblock" id="wait" style="margin-left: 10px;">
                                <h5 >잠깐! 정말 탈퇴하시겠어요?</h5>
                                <p>- 회원탈퇴를 진행하기 전, 안내사항을 자세히 확인하시기 바랍니다.</p>
                            </div>
                        </div>
                        <div id="dropLine2" style="margin-left: 40px;" class="flex">
                            <div class="inlineblock">
                                <img src="<%=request.getContextPath() %>/img/checked.png" width="25px" height="25px">
                            </div>
                            <div class="inlineblock">
                                <p style="margin-left: 8px;">정말 회원 탈퇴를 하시면,  더 이상 지핑의 다양하고 유익한 클래스를 수강하실 수 없게 됩니다!<br>
                                또한, 현재 수강중이거나 찜한 클래스의 이용이 불가능합니다.</p>
                            </div>
                        </div>
                        <div id="dropLine3" style="margin-left: 40px;">
                            <div class="inlineblock">
                                <img src="<%=request.getContextPath() %>/img/checked.png" width="25px" height="25px">
                            </div>
                            <div class="inlineblock">
                                <p>회원 탈퇴 이후에는 현재 보유하신 포인트와 쿠폰 등의 복구는 불가능합니다.</p>
                            </div>
                        </div>
                        <div id="dropLine4" style="margin-left: 40px;" class="flex">
                            <div class="inlineblock">
                                <img src="<%=request.getContextPath() %>/img/checked.png" width="25px" height="25px">
                            </div>
                            <div class="inlineblock">
                                <p style="margin-left: 8px;">지금까지 지핑에서 작성한 리뷰, 댓글 등은 회원탈퇴 이후에도 남아있으나,<br>
                                    수정 및 삭제 권한이 사라집니다.
                                </p>
                            </div>
                        </div>
                        <div id="dropLine5" style="margin-left: 40px;">
                            <div class="inlineblock">
                                <img src="<%=request.getContextPath() %>/img/checked.png" width="25px" height="25px">
                            </div>
                            <div class="inlineblock">
                                <p>튜터이신 경우, 운영 중인 클래스의 목록이 영구 삭제됩니다.</p>
                            </div>
                        </div>
                        <div style="margin-left: 80px; margin-bottom: 100px;">
                            <input type="checkbox" name=""> 상기 제시된 회원 탈퇴 관련 안내사항을 모두 확인하였습니다.
                        </div>
                        <div id="dropLine6" style="margin-left: 40px;" class="">
                            <div class="flex">    
                                <div class="inlineblock"><img src="<%=request.getContextPath() %>/img/question.png" alt="" width="40px" height="40px"></div>
                                <div class="inlineblock" id="wait" style="margin-left: 10px;">
                                    <h5 style="margin-bottom: 0px;">회원 탈퇴 사유는 무엇인가요?</h5>
                                    <p>- 회원 탈퇴 이유를 선택해주시면, 앞으로 더 나은 모습의 지핑으로 성장하겠습니다.</p>                               
                                </div>
                                <br><br> <br>
                            </div>
                            <div>
                                <form action="">
                                    <div class="" style="margin-left: 50px;">
                                        <select name="reason" style="border-radius: 8px;">
                                            <option value="탈퇴사유 선택">탈퇴사유 선택하기</option>
                                            <option value="강의 종류가 적음">강의 종류가 적음</option>
                                            <option value="왜 탈퇴하니?">왜 탈퇴하니?</option>
                                            <option value="이 좋은 사이트를?">이 좋은 사이트를?</option>
                                            <option value="듣고 싶은 강의가 없음">듣고 싶은 강의가 없음 </option>
                                            <option value="기타">직접 작성</option>
                                        </select>                                   
                                    </div>
                                    <br>
                                    <div class="" style="margin-left: 50px; display:table-caption;">
                                        <div>
                                            <textarea id="drop-reason" cols="63px" rows="3px" placeholder="" style="border-radius: 8px;"></textarea>
                                            <div id="word-count" style="float:right;"></div>
                                        </div>    
                                        
                                    </div>
                                </form>
                            </div>
                            <br><br><br><br>
                            <div>

                                <div>
                                    <img src="<%=request.getContextPath() %>/img/notification.png" alt="" width="30px" height="30px">
                                    <span>000님에게 추천드릴 클래스가 아직 남아 있어요!</span>
                                </div>
                                <br>
                                
                                <div class="col inlineblock drop-class-margin">
                                    <div class="class-hover" onclick="alert('뭐야');" >
                                        <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58" 
                                            height="150px" width="200px" ><br>
                                        <div id="title" style="font-size: 18px;">달콩이의 아이패드 드로잉</div>
                                        <div id="price">198,000원</div>
                                        <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12" width="80px" style="margin-right: 70px;"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png" alt="2021-12-16-21-58-23" width="20px">130<br> 
                                    </div>                                                                
                                </div>
                                <div class="col inlineblock drop-class-margin">
                                    <div class="class-hover" onclick="alert('뭐야');" >
                                        <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58" 
                                            height="150px" width="200px" ><br>
                                        <div id="title" style="font-size: 18px;">달콩이의 아이패드 드로잉</div>
                                        <div id="price">198,000원</div>
                                        <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12" width="80px" style="margin-right: 70px;"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png" alt="2021-12-16-21-58-23" width="20px">130<br> 
                                    </div>    
                                                              
                                </div>
                                <div class="col inlineblock drop-class-margin">
                                    <div class="class-hover" onclick="alert('뭐야');" >
                                        <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58" 
                                            height="150px" width="200px" ><br>
                                        <div id="title" style="font-size: 18px;">달콩이의 아이패드 드로잉</div>
                                        <div id="price">198,000원</div>
                                        <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12" width="80px" style="margin-right: 70px;"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png" alt="2021-12-16-21-58-23" width="20px">130<br> 
                                    </div>    
                                                              
                                </div>
                                <div class="col inlineblock drop-class-margin">
                                    <div class="class-hover" onclick="alert('뭐야');" >
                                        <img src="https://i.ibb.co/G09WxGs/2021-12-16-21-57-58.png" alt="2021-12-16-21-57-58" 
                                            height="150px" width="200px" ><br>
                                        <div id="title" style="font-size: 18px;">달콩이의 아이패드 드로잉</div>
                                        <div id="price">198,000원</div>
                                        <img src="https://i.ibb.co/2kKfzGb/2021-12-16-21-58-12.png" alt="2021-12-16-21-58-12" width="80px" style="margin-right: 70px;"><img src="https://i.ibb.co/0fGxn3t/2021-12-16-21-58-23.png" alt="2021-12-16-21-58-23" width="20px">130<br> 
                                    </div>                                                                
                                </div>

                                
                            </div>
                        </div>
                    </div>
                    <div class="line"></div> 
                    <div id="save-info">
                        <button onclick="confirm('정말 탈퇴하시겠습니까?')" id="saveBtn">탈퇴하기</button>
                    </div>  
                    <p>confirm->true반환되면 삭제될것이야!</p>
                </div>               
            </div>
        </section>

  <%@ include file="/views/common/footer.jsp"%>
  <script>
	//마이클래스 서브메뉴!!
  $("#sub-menu").hide();
  $(".nav-sub").mouseenter(e=>{
      $("#sub-menu").show();
  })  
  $(".nav-sub").mouseleave(e=>{
      $("#sub-menu").hide();
  });
  // 탈퇴사유 textarea
  $("#drop-reason").keyup(e=>{
      let inputLength=$(e.target).val().length;
      $("#word-count").html("("+inputLength +"/70)");
  });
  </script>