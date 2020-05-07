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
    
    <link href="../resources/css/style.css" rel="stylesheet" type="text/css">
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    
 
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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->


<script>

// 	$(document).ready(function() {
// 		$('#make').on('click',function(){
// 		location.href="make";

// 			});
// 	});

$(document).ready(function(){
	
	// 등록 버튼 클릭
	$('#make1').on('click', check);
	
	// 취소 버튼 클릭
	$('#cancel').on('click', function(){
		$(location).attr('href','../');
		});

	$('#goal').on('keyup',function(){
		var goal = $('#goal').val() / 7;
		
		$('#span2').text (
			goal.toFixed(1)
				);
		});

});

function check(){
	var title = $('#title').val();
	var comments = $('#comments').val();
	var goal = $('#goal').val();

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

	$.ajax({
		url: 'makeRoom',
		type: 'post',
		data: {title:title, comments:comments, goal:goal},
		dataType: 'text',
		success: function(msg){
			alert('스터디 룸을 생성하였습니다');
			},
		error:function(){
			alert('스터디 룸 전송 실패');
		}
	}); 
	window.location.replace("roomList");
}

</script>

<script>


function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
}

function check2(){

	var title = $('#title').val();

	if(title.length=0 || title==''){
    	alert('방 이름을 입력해주세요');
    	return false;
    		}
}
        
function go(num){
	if(confirm('스터디를 신청하시겠습니까?')){
		$.ajax({
			url: 'askStudy',
			type: 'post',
			data: {num:num},
			dataType: 'text',
			success: function(msg){
				if(msg > 0){
				alert('신청하였습니다');
				return false;
					} else{
				alert('이미 신청하였습니다');
				return false;
						}
				},
			error:function(){
				alert('태그 전송 실패');
			}
		});
		};
}

function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage;
	form.submit();
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

.contentbar{
padding-left: 150px;
}
</style>

</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
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
                            <h3>스터디룸 검색하기</h3>
            
			
				 	</div>
				 </div>
	 		</div>
    	 </div>
     </div>
        
              <!-- /bradcam_area  -->
    <!-- service_area  -->
       <div class="row"> 

	<div class="col-md-12 col-lg-12 col-xl-8" style="margin: 0 auto">
		 <div class="contentbar">
              
            
<table class="table">
<tr>
<td>#</td>
<td>제목</td>
<td>방장</td>
<td>생성일</td>
</tr>
<c:forEach var="i" items="${list}" varStatus="status">
<tr>
<td>${status.count}</td>
<td><a href="oneRoom?num=${i.num}">${i.title}</a></td>
<td>${i.id}</td>
<td>${i.inputdate}</td>
</tr>
</c:forEach>
</table>
</div>

<div align="center">
<!-- 페이지 이동 부분 -->                      
	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>

<!-- /페이지 이동 끝 -->                      

<br><br>

<!-- 검색폼 -->
<form id="pagingForm" method="get" action="roomList">
	<input type="hidden" name="page" id="page" />
	제목 <input type="text"  name="searchText" value="${searchText}" />
	<input type="button" class="btn btn-primary" onclick="pagingFormSubmit(1)" value="검색">
</form>
<!-- <input type="button" id="make" class="btn btn-primary" value="스터디룸 만들기"> -->
<div class="btn btn-primary"><a class="btn btn-default" id="make" data-target="#modal" data-toggle="modal" style="color: white; border-radius: 15px">스터디룸 만들기</a></div>
<!-- /검색폼 --> 
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

<!-- 모달 -->
	<div class="row">
		<div class="modal" id="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<p style="color: white; font-size: large; margin-top: 10px">스터디룸 만들기</p>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<form id="makeRoom">
                                    <div class="form-row">
                                        <div class="form-group col-md-11">
                                            <label for="roomtitle">스터디 룸명</label>
                                            <input type="text" id="title" name="title" class="form-control" placeholder="">
                                        </div>
                                    
                                    <div class="form-group col-md-11">
                                        <label for="inputAddress2">매일 공부 목표(단위 : 분)</label>
                                        	<input type="text" class="form-control" id="goal">
                                    
                                   <small>스터디조건이 없을시 0을 입력해주세요</small>
                                   </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputCity">소개</label>
                                            <textarea cols="50" rows="5" id="comments"></textarea>
                                        </div>
                                        
                                    </div>
                                    <input id="make1" class="btn btn-primary" type="button" value="등록">
                                    <input id="cancel" class="btn" type="button" value="취소">
                                </form>
					</div>
				</div>
			</div>
		</div>
	</div>	


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


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
<!--     <script src="../resources/one/js/popper.min.js"></script> -->
    <script src="../resources/one/js/bootstrap.min.js"></script>
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