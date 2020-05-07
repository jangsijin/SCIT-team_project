<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <title>GongJa</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
   <!-- favicon -->
	<link rel="shortcut icon" href="../resources/one/img/favicon.ico">
    
    <!-- CSS here -->
    <link rel="stylesheet" href="../resources/one/css/bootstrap.min.css">
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
  
    <script src="../resources/jquery/jquery-3.4.1.js"></script>
  	<script defer src="../resources/js/face-api.min.js"></script>
	<script defer src="../resources/js/script.js"></script>
	<script src="../resources/js/push.min.js"></script>
	    <!-- timer -->
	   <link href="../resources/css/jquery.counter-analog2.css" rel="stylesheet">
	   <script src="../resources/js/jquery.counter.js"></script>
	    
    <link rel="shortcut icon" href="../resources/images/favicon.ico">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script>
$(document).ready(function(){
	buttonEvt();
	
});

var currentTime1 = 0;

function buttonEvt(){


	  // start btn
	  $("#startbtn").click(function(){
	
		  var title = $(':radio[name="title"]:checked').val();
		  if(title == null){
			alert('타이틀 체크 안됨')
			return false;
			  }
		    
		    $('.counter').counter({});
		    
		$("#video").get(0).play();
		var d1 = new Date();
		var d2 = leadingZeros(d1.getHours(), 2) + ':' + leadingZeros(d1.getMinutes(), 2);
		currentTime1 = d2;

	  });

$("#pausebtn").click(function(){

	if(currentTime1 == 0){
		alert('시작 버튼을 눌러주세요');
		return false;
		}
	var title = $(':radio[name="title"]:checked').val();
    $("#hcount").val(hcount);
    $("#scount").val(scount);   	
    var d3 = new Date();
	var currentTime2 = leadingZeros(d3.getHours(), 2) + ':' + leadingZeros(d3.getMinutes(), 2);
	alert('공부를 멈춥니다');
	  	  
	  $.ajax({
			url: 'insertClock',
			type: 'post',
			data: {title:title, startT:currentTime1, endT:currentTime2, hcount:hcount,scount:scount},
			dataType: 'text',
			success: function(msg){
				if(msg==0){
				alert('1분 이하로 공부했을 시 저장되지 않습니다.');
					}
				},
			error:function(){
			}
		});
	  window.location.replace("study");
});
}

function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}

</script>
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
ul.timeline {
    list-style-type: none;
    position: relative;
}
ul.timeline:before {
    content: ' ';
    background: #d4d9df;
    display: inline-block;
    position: absolute;
    left: 8px;
    width: 2px;
    height: 100%;
    z-index: 400;
}

ul.timeline > li {
    margin: 20px 0;
    padding-left: 40px;
}
ul.timeline > li:before {
    content: ' ';
    background: white;
    display: inline-block;
    position: absolute;
    border-radius: 50%;
    border: 3px solid #22c0e8;
    left: 0px;
    width: 20px;
    height: 20px;
    z-index: 400;
}

ul.timeline > li.pm:before {
    content: ' ';
    background: white;
    display: inline-block;
    position: absolute;
    border-radius: 50%;
    border: 3px solid red;
    left: 0px;
    width: 20px;
    height: 20px;
    z-index: 400;
}
.warning {
  background-color: #ffffcc;
  border-left: 6px solid #ffeb3b;
   margin-bottom: 15px;
  padding: 4px 12px;
}
</style>
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
    <div class="bradcam_area" style="padding-bottom: 40px">
            <div class="bradcam_shap">
                <img src="../resources/one/img/ilstrator/bradcam_ils.png" alt="">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>스터디 모니터</h3>
            
			
				 	</div>
				 </div>
	 		</div>
    	 </div>
     </div>
<!-- header 끝 -->
            <div class="row">
            

<div class="col">

<div class="container mt-5 mb-5">
	<div class="row">

<div class="card offset-md-3" style="width: 18rem;">
  <div class="card-header">
    오늘 공부 목록
  </div>
  <ul class="list-group list-group-flush">
  <c:forEach var="i" items="${list}">	
    <li class="list-group-item"><div class="custom-control custom-radio">
						<input type="radio" name="title" value="${i.title}" id="${i.start}" class="custom-control-input">
						<label class="custom-control-label" for="${i.start}">${i.start} - ${i.end} : ${i.title}</label>
							</div>
</li>
    </c:forEach>
  </ul>
</div>
		
		
	</div>
</div>
</div>

<div class="col">
<div align="center"><h4>오늘 총 공부시간<br>
			<c:if test="${cnt != null }">00 :
				<c:if test="${cnt<10}">0${cnt}</c:if>
				<c:if test="${cnt>= 10}">${cnt}</c:if>
				</c:if>
			<c:if test="${cnt == null }">
			<c:if test="${hr < 10}">0</c:if>${hr}:<c:if test="${mi < 10}">0</c:if>${mi}
			</c:if></h4></div>
			<div align="center">
    	<video id="video" width="580" height="380" style="border: 10px solid; border-left-width: 50px; border-right-width: 50px; border-radius:50% / 10%" muted></video>
	
            
<div id='timerBox' class="timerBox">
			<span class="counter counter-analog2" data-direction="up" data-format="23:59:59" data-interval="1000"></span>

		</div>
		<div class="btnBox">
		<br>
			<input type="button" id="startbtn" class="btn btn-primary" value="스터디 시작">
			<input type="button" id="pausebtn"  class="btn btn-danger" value="스터디 멈추기">
		</div>
		<div class="btnBox" id = "gog">
			<input type="button" id="pause1" class="btn btn-lg" value="딴짓사이렌중지">
			<input type="button" id="pause2" class="btn btn-lg" value="졸림사이렌중지">
		</div>
			</div>
</div>
		
<div class="col">		
<div class="container mt-5 mb-5">
	<div class="row">
		<div class="offset-md-3">
			<div align="center"><h4>공부 타임라인</h4></div>
			  <ul class="timeline">
			  <c:forEach var="i" items="${clist}">
			  <c:if test="${fn:substring(i.startT, 0, 2) < 12}">
		<li>${i.startT} - ${i.endT} : ${i.title} <br>
		<span style="color:red;"><c:if test="${i.hcount != 0}">웃음 : ${i.hcount} </c:if><c:if test="${i.scount != 0}">피곤 : ${i.scount}</c:if></span></li>
			</c:if>
			<c:if test="${fn:substring(i.startT, 0, 2) >= 12}">
		<li class="pm">${i.startT} - ${i.endT} : ${i.title} <br>
		<span style="color:red;"><c:if test="${i.hcount != 0}">웃음 : ${i.hcount} </c:if><c:if test="${i.scount != 0}">피곤 : ${i.scount}</c:if></span></li>
			</c:if>
		</c:forEach>
			</ul>
		</div>
	</div>
</div>
</div>
</div>

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
    <script src="../resources/one/js/bootstrap.min.js"></script>
    <script src="../resources/one/js/owl.carousel.min.js"></script>
    <script src="../resources/one/js/isotope.pkgd.min.js"></script>
    <script src="../resources/one/js/ajax-form.js"></script>
<!--     <script src="../resources/one/js/waypoints.min.js"></script> -->
    <script src="../resources/one/js/jquery.counterup.min.js"></script>
    <script src="../resources/one/js/imagesloaded.pkgd.min.js"></script>
    <script src="../resources/one/js/scrollIt.js"></script>
    <script src="../resources/one/js/jquery.scrollUp.min.js"></script>

 
    <!--contact js-->
    <script src="../resources/one/js/contact.js"></script>
    <script src="../resources/one/js/jquery.ajaxchimp.min.js"></script>
    <script src="../resources/one/js/jquery.form.js"></script>
    <script src="../resources/one/js/jquery.validate.min.js"></script>
    <script src="../resources/one/js/mail-script.js"></script>

    <script src="../resources/one/js/main.js"></script>
</body>

</html>