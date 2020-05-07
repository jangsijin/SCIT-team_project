<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>GongJa</title>
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <!-- favicon -->
	<link rel="shortcut icon" href="../resources/one/img/favicon.ico">
    
    <!-- CSS here -->
<!--     <link rel="stylesheet" href="../resources/one/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="../resources/one/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/one/css/magnific-popup.css">
    <link rel="stylesheet" href="../resources/one/css/font-awesome.min.css">
    <link rel="stylesheet" href="../resources/one/css/themify-icons.css">
    <link rel="stylesheet" href="../resources/one/css/nice-select.css">
    <link rel="stylesheet" href="../resources/one/css/flaticon.css">
    <link rel="stylesheet" href="../resources/one/css/gijgo.css">
    <link rel="stylesheet" href="../resources/one/css/animate.min.css">
    <link rel="stylesheet" href="../resources/one/css/slick.css">
    <link rel="stylesheet" href="../resources/one/css/slicknav.css">
    <link rel="stylesheet" href="../resources/one/css/style1.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <!-- slick -->
    <link rel="stylesheet" type="text/css" href="../resources/plugins/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="../resources/plugins/slick/slick-theme.css"/>
    <script type="text/javascript" src="../resources/plugins/slick/slick.js"></script>
    <!-- jquery UI -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	   <!-- jQuery Modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>

.jumbotron{
margin-top:10px;
margin-bottom:0px;
padding-top: 5px;
padding-bottom: 10px;
text-align:center;
background: url("") no-repeat; 
background-size: cover;
}

#logo{
width:150px;
height:60px;
}
</style>
<script>
$(document).ready(function(){
	if(${room.code == 0}){
		$('#pre').attr('checked','checked');
		} else if(${room.code == 1}){
			$('#ing').attr('checked','checked');
			}

	$('#applyBtn').on('click',apply);
});

function apply(){
	var num = ${room.num};
	$.ajax({
		url: 'apply',
		type: 'post',
		data: {num:num},
		dataType: 'text',
		success: function(msg){
			if(msg > 0){
			alert('신청 완료되었습니다');
			window.location.href='oneRoom?num='+ num;
				}
			},
		error:function(){
			alert('실패');
		}
	});
}



function yes(id){
	var num = ${room.num};
	if(confirm('멤버 신청을 허용하시겠습니까?')){
		$.ajax({
			url: 'memberIn',
			type: 'post',
			data: {id:id, num:num},
			dataType: 'text',
			success: function(msg){
				window.location.href='oneRoom?num='+ num;
				},
			error:function(){
				alert('실패');
			}
		});
		}
}

function no(id){
	var num = ${room.num};
	if(confirm('리스트에서 삭제하시겠습니까?')){
		$.ajax({
			url: 'memberOut',
			type: 'post',
			data: {id:id, num:num},
			dataType: 'text',
			success: function(msg){
				window.location.href='oneRoom?num='+ num;
				},
			error:function(){
				alert('실패');
			}
		});
		}
}

function update(){
	var num = ${room.num};
	var title = $('#title').val();
	var comments = $('#comments').val();
	var goal = $('#goal').val();
	var code = $('input:radio[name=code]:checked').val();

	if(title.length=0 || title==''){
    	alert('방 이름을 입력해주세요');
    	return false;
    		}
	if(comments.length=0 || comments==''){
    	alert('간단한 소개를 입력해주세요');
    	return false;
    		}
	if(goal.length=0 || goal==''){
		alert('스터디 조건을 입력해주세요');
		return false;
		}
	if(code == 2){
confirm('스터디 종료 시 다시 되돌릴 수 없습니다. 종료하시겠습니까?')
		}
	$.ajax({
		url: 'updateRoom',
		type: 'post',
		data: {title:title, comments:comments, goal:goal, code:code, num:num},
		dataType: 'text',
		success: function(msg){
			alert('업데이트 성공');
			window.location.href='oneRoom?num='+ num;
			},
		error:function(){
			alert('실패');
		}
	});
}

$(function(){
	$('#slider-div').slick({
		slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, 	//무한 반복 옵션	 
		slidesToShow : 6,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 6,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
		dots : true,
		autoplay : true,			// 자동 스크롤 사용 여부
		autoplaySpeed : 3000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true,		// 스크롤바 아래 점으로 페이지네이션 여부
		vertical : false,		// 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
		dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
		draggable : true, 	//드래그 가능 여부 
		
		responsive: [ // 반응형 웹 구현 옵션
			{  
				breakpoint: 960, //화면 사이즈 960px
				settings: {
					//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:3 
				} 
			},
			{ 
				breakpoint: 768, //화면 사이즈 768px
				settings: {	
					//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:2 
				} 
			}
		]

	});
	})
</script>
</head>
<body>
<header>
        <div class="header-area " style="background: white; border-bottom: 2px solid #00008B; border-radius: 25px 25px 25px 25px ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-2">
                            <div class="logo"style="box-sizing: border-box;">
                                <a href="/gongja">
                                    <img src="../resources/one/img/logo11.png" style="width: 50%; max-width: 760px; vertical-align: middle" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-7">
                            <div class="main-menu  d-none d-lg-block">
                              <nav>
                                      <c:if test="${sessionScope.loginId != null }">
                                    <ul id="navigation">
                                        <li><a href="/gongja" style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE;">home</a></li>
                                        <li><a href="../study/study" style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">학습 시작</a></li>
                                        <li><a href="../calendar/calendar" style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">캘린더</a></li>
										<li><a href="../room/myRoom" style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">스터디룸</a></li>		
                                        <li><a href="../study/myDiaryList" style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">스터디일기</a></li>
                                        <li><a href="../chart/today" style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">학습 통계</a></li>
                                    </ul>
                                    </c:if>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                            <div class="Appointment">
                                <div class="book_btn d-none d-lg-block" style="color: #483D8B">
                                 <!-- 상단바 로그인 경우 -->
                                 <c:if test="${sessionScope.loginId != null}">
      							  <li class="nav-item dropdown active">
      							  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border-color: #00008B; color: #00008B">
      							   <img style="width: 33px; height: 33px;  border-radius: 70%;" src="<c:url value="${loginImage}"/>" class="img-fluid" alt="profile"> ${sessionScope.loginId}님 안녕하세요
       							 </a>
        						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="../member/profile" style="border-color: #00008B; color: #00008B;  text-align: center;">프로필</a>
          						<a class="dropdown-item" href="../message/messageList" style="border-color: #00008B; color: #00008B; text-align: center;">쪽지</a>
         						<a class="dropdown-item" href="../member/logout" style="border-color: #00008B; color: #00008B;  text-align: center;">로그아웃</a>
       						 	</div>
     							</li>
    							 </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->

    <!-- bradcam_area  -->
    <div class="bradcam_area">
            <div class="bradcam_shap">
                <img src="../resources/one/img/ilstrator/bradcam_ils.png" alt="">
            </div>
            <div class="contentbar">
<div class="jumbotron">
<div>
  <h1 class="display-5">${room.title}</h1>
  <p class="lead" style="color: black;">${room.comments}</p>
  <p style="color: black;">스터디룸 목표 : 매일 ${room.goal} 분 이상 공부하기</p>
  <p style="color: black; text-align: center; text-transform:none;">스터디장 : ${room.id} <c:if test="${room.id != loginId}"></c:if>
  <p style="color: black; text-transform:none;">스터디 멤버 : 
<c:forEach var="i" items="${memList}">
${i.id} 
</c:forEach></p>
  <c:if test="${room.id == loginId }">
<c:if test="${room.code != 2}">
<a href="#ex1" rel="modal:open">방 관리</a>




</c:if>
<c:if test="${room.code == 2}">
종료된 방입니다
</c:if>
</c:if>

  <hr class="my-4">
<c:if test="${cnt == 0}">
<p style="color: black;"><strong>수락 대기 중인 방입니다.</strong></p>
</c:if>
<c:if test="${cnt == null}">
<p class="lead">
    <input type="button" class="btn btn-primary" id="applyBtn" value="가입 신청">
  </p>
</c:if>
</div>


<div id="ex1" class="modal" tabindex="-1" style="height:1000px;" role="dialog">
<input type="hidden" id="num" value="1">
  <p>스터디 이름:<input type="text" class="form-control" id="title" value="${room.title}"></p>
  <p>스터디 소개 :<input type="text" class="form-control" id="comments" value="${room.comments}"></p>
  <p>스터디 목표 : <input type="text" class="form-control" id="goal" value="${room.goal}"></p>
  <div id="div1">스터디 시작 : <input type="radio" id="pre" name="code" value="0"/> 모집중,
  <input type="radio" name="code" id="ing" value="1"/>진행중, 
  <input type="radio" name="code" id="end" value="2"/>종료</div>
  <p><input type="button" class="btn btn-primary" id="updbtn" onclick="return update();" value="수정하기"></p>
  <p>참여 신청자 목록 : <c:forEach var="i" items="${memListN}">
  <p>아이디 : ${i.id} <input type="button" value="수락" onclick="yes('${i.id}')"><input type="button" value="거절" onclick="no('${i.id}')"></p>
  </c:forEach>
  <hr>
  <p>멤버 목록 : <c:forEach var="i" items="${memList}">
  <c:if test="${i.id != room.id}">
  <p>아이디 : ${i.id} <input type="button" value="퇴출" onclick="no('${i.id}')"></p>
  </c:if>
  </c:forEach> 
  </p>
</div>


<!-- Modal -->


<div class="container">
<c:if test="${cnt == 1 && room.code <= 1}">
<h4>오늘의 공부중인 멤버</h4>
<div id="slider-div" style="padding-bottom:30px; height:180px;">
<c:forEach var="p" items="${memList}">
<c:forEach var="i" items="${rank}">
<c:if test="${i.id == p.id}">
<div class="card" style="width:200px; height:200px; margin:30px; border-color: white;">
<img class="card-img-top" src="<c:url value="/boardfile/${i.title}"/>" style="width:80px; height:80px; border-radius: 80%; margin-left:auto; margin-right: auto; width: 50%;" alt="Card image">
  <div class="card-body">
    <p class="card-text" style="color:black; text-transform:none;">${i.startT}(${i.id})</p>
    <p class="card-text" style="color:black; text-transform:none;"><strong>${i.total}</strong>분동안 열공!</p>
  </div>
  </div>
</c:if>
</c:forEach>
</c:forEach>
</div>
</c:if>
	  	
	  	

<c:if test="${cnt == 1}">
  <div class="block-heading" align="center" style="padding-top:80px;">
              <h2>게시판</h2>
            </div>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">공지</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">자유게시판</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="boardList?num=${room.num}"><span style="color:black;">전체목록</span></a>
    </li>
    <c:if test="${room.code != 2}">
    <li class="nav-item">
    <a class="nav-link" href="writeBoard?num=${room.num}"><span style="color:black;"><strong>글쓰기</strong></span></a>
    </li>
    </c:if>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <table class="table">
      <thead>
      <tr><th>제목</th>
      <th>날짜</th></tr>
      </thead>
    <tbody>
    <c:forEach var="i" begin="0" end="5">
      <c:if test="${gongji[i].code == 1}">
      <tr class="table-secondary">
        <td><a href="board?num=${gongji[i].num}&room_num=${gongji[i].room_num}">${gongji[i].title}</a></td>
        <td>${gongji[i].inputdate}</td>
      </tr>
      </c:if>
    </c:forEach>
      </tbody>
      </table>

    </div>
    <div id="menu1" class="container tab-pane fade"><br>
    <table class="table">
      <thead>
      <tr><th>제목</th>
      <th>작성자</th>
      <th>날짜</th></tr>
      </thead>
    <tbody>
    <c:forEach var="i" begin="0" end="5">
      <c:if test="${free[i].code == 0}">
      <tr>
        <td><a href="board?num=${free[i].num}&room_num=${free[i].room_num}">${free[i].title}</a></td>
        <td>${free[i].id}</td>
        <td>${free[i].inputdate}</td>
      </tr>
      </c:if>
    </c:forEach>
      </tbody>
      </table>
      
    </div>
    </div>
</c:if>
    </div>
  </div>
<div >
</div>

</div>
			
				 	</div>
        
    <!--/ service_area  -->

    <!-- features_area  -->
    <div class="features_area">
        <div class="container">
            </div>
    </div>
    <!--/ features_area  -->

    <!-- testimonial_area  -->
    <div class="testimonial_area ">
            <div class="container">
                
            </div>
        </div>
        <!-- /testimonial_area  -->

   <footer class="footer">
            <div class=" container">
                <div class="pro_border">
                        <div class="row">
                                <div class="col-xl-6 col-md-6">
                                    <div class="lets_projects">
                                        <h3>Let’s Start your Study </h3>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-6">
                                    <div class="phone_number">
                                        <h3>+10 673 563 629</h3>
                                        <a href="#">support@gongja.com</a>
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
           
            <div class="copy-right_text">
                <div class="container">
                    <div class="footer_border"></div>
                    <div class="row">
                        <div class="col-xl-12">
                            <p class="copy_right text-center">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

    <!-- JS here -->
    <script src="../resources/one/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="../resources/one/js/popper.min.js"></script>
<!--     <script src="../resources/one/js/bootstrap.min.js"></script> -->
    <script src="../resources/one/js/owl.carousel.min.js"></script>
    <script src="../resources/one/js/isotope.pkgd.min.js"></script>
    <script src="../resources/one/js/ajax-form.js"></script>
<!--     <script src="../resources/one/js/waypoints.min.js"></script> -->
    <script src="../resources/one/js/jquery.counterup.min.js"></script>
    <script src="../resources/one/js/imagesloaded.pkgd.min.js"></script>
    <script src="../resources/one/js/scrollIt.js"></script>
    <script src="../resources/one/js/jquery.scrollUp.min.js"></script>
    <script src="../resources/one/js/wow.min.js"></script>
    <script src="../resources/one/js/nice-select.min.js"></script>
    <script src="../resources/one/js/jquery.slicknav.min.js"></script>
    <script src="../resources/one/js/jquery.magnific-popup.min.js"></script>
    <script src="../resources/one/js/plugins.js"></script>
    <script src="../resources/one/js/gijgo.min.js"></script>
 
    <!--contact js-->
    <script src="../resources/one/js/contact.js"></script>
    <script src="../resources/one/js/jquery.ajaxchimp.min.js"></script>
    <script src="../resources/one/js/jquery.form.js"></script>
    <script src="../resources/one/js/jquery.validate.min.js"></script>
    <script src="../resources/one/js/mail-script.js"></script>

    <script src="../resources/one/js/main.js"></script>
</body>

</html>