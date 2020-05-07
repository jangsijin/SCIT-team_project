<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>GongJa</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 
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
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
   <!-- slick -->
<link rel="stylesheet" type="text/css" href="../resources/plugins/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="../resources/plugins/slick/slick-theme.css"/>
<script type="text/javascript" src="../resources/plugins/slick/slick.js"></script>
       <!-- bar-rating --> 
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> 
    <link rel="stylesheet" href="../resources/css/fontawesome-stars.css"> 
    <script type="text/javascript" src="../resources/js/jquery.barrating.min.js"></script>
<!-- jquery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <script>
    $(document).ready(function(){

        $('.star').barrating({ 
        	theme: 'fontawesome-stars',
        	readonly: true
        });

        $('[data-toggle="popover"]').popover();

    }); 


    
		$(function(){
		$('#slider-div').slick({
			slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
			infinite : true, 	//무한 반복 옵션	 
			slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
			slidesToScroll : 4,		//스크롤 한번에 움직일 컨텐츠 개수
			speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
			arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
			dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
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
padding-left: 100px;
}

/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

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
          						<a class="dropdown-item" href="../member/profile" style="border-color: #00008B; color: #00008B;  text-align: center;">Home</a>
          						<a class="dropdown-item" href="../message/messageList" style="border-color: #00008B; color: #00008B; text-align: center;">프로필</a>
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
                            <h3>스터디 일기</h3>
            
			
				 	</div>
				 </div>
	 		</div>
    	 </div>
     </div>
<!-- header 끝 -->
<div class="col-md-12 col-lg-12 col-xl-15" style="margin: 0 auto; padding-left: 20px">
                <div align="center">
                <c:if test="${today == 0 }">
                <p><a href="writeDiary">오늘의 스터디 일기 쓰기</a></p>
                </c:if>
                <c:if test="${today > 0 }">
                <p>오늘의 스터디 일기는 이미 작성하셨습니다.</p>
                </c:if>
                </div>
 
                <!-- stlye 은 slick 영역 확인용 -->
                <c:if test="${list != null}">
                <div>
                <p>특정 날짜의 일기 보기 : <input type="text" id="datepicker" style="border-radius: 5px; width: 120px; text-align: center;"></p>
                </div>
		<div >
	  	<div id="slider-div">
		   <c:forEach var="i" items="${list}">
<div class="card" style="width:200px; height:200px;  border-color: white; margin-left:auto; margin-right: auto; width: 50%;">
  <c:if test="${i.image != null}"><img class="card-img-top" src="<c:url value="/boardfile/${i.image}"/>" style="width:250px; height:200px;" alt="Card image"></c:if>
  <c:if test="${i.image == null}"><img class="card-img-top" src="<c:url value="/boardfile/white.jpg"/>" style="width:250px; height:200px;" alt="Card image"></c:if>
  <div class="card-body">
    <h4 class="card-title">${i.title}
    <select class="star" name="star">
 <option value="1" <c:if test="${i.star == 1}">selected</c:if>>1</option>
 <option value="2" <c:if test="${i.star == 2}">selected</c:if>>2</option>    
 <option value="3" <c:if test="${i.star == 3}">selected</c:if>>3</option>    
 <option value="4" <c:if test="${i.star == 4}">selected</c:if>>4</option>    
 <option value="5" <c:if test="${i.star == 5}">selected</c:if>>5</option>    
</select> 
    </h4>
    <p class="card-text">${i.detail}</p>
    <a href="updateDiary?num=${i.num}" class="btn btn-primary btn-sm">수정/삭제</a>
    <p>작성일 : ${i.inputdate}</p>
  </div>
</div>
</c:forEach>
	  	</div>
	</div>              
                </c:if>
                <c:if test="${one != null }">
                <div>
                <p>일기 검색 : <input type="text" id="datepicker"></p>
                <p>검색 결과 : ${one.inputdate}</p>
                </div>
                <div id="slider-div">
                <div class="card" style="width:200px; height:200px; margin:30px; border-color: white; margin-left:auto; margin-right: auto; width: 50%;">
  <c:if test="${one.image != null}"><img class="card-img-top" src="<c:url value="/boardfile/${one.image}"/>" style="width:250px; height:200px;" alt="Card image"></c:if>
  <c:if test="${one.image == null}"><img class="card-img-top" src="<c:url value="/boardfile/white.jpg"/>" style="width:250px; height:200px;" alt="Card image"></c:if>
  <div class="card-body">
    <h4 class="card-title">${one.title}
    <select class="star" name="star">
 <option value="1" <c:if test="${one.star == 1}">selected</c:if>>1</option>
 <option value="2" <c:if test="${one.star == 2}">selected</c:if>>2</option>    
 <option value="3" <c:if test="${one.star == 3}">selected</c:if>>3</option>    
 <option value="4" <c:if test="${one.star == 4}">selected</c:if>>4</option>    
 <option value="5" <c:if test="${one.star == 5}">selected</c:if>>5</option>    
</select> 
    </h4>
    <p class="card-text">${one.detail}</p>
    <a href="updateDiary?num=${one.num}" class="btn btn-primary btn-sm">수정/삭제</a>
    <p>작성일 : ${one.inputdate}</p>
  </div>
</div>
</div>
</c:if>
</div>
<div>
<br><br><br>
<c:if test="${sessionScope.link != null}">
<h1 align="center"><a href="${sessionScope.link}" target="_blank"> ${loginNickname}님을 위한 오늘의 추천 영상</a></h1>
</c:if>
</div>

<div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">지금까지의 추천리스트
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
    <c:forEach var="i" items="${recList}">
      <li class="dropdown-header">${i.inputdate}</li>
      <li><div align="center"><a href="${i.detail}" target="_blank">추천 영상</a></div></li>
      <li class="divider"></li>
    </c:forEach>
    </ul>
  </div>



<script>
        $(function() {
            //input을 datepicker로 선언
            $("#datepicker").datepicker({
                dateFormat: 'yy/mm/dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                //,buttonImage: "#" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-3Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+0D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
				,onSelect: function(dateText, inst) {
					var dd = $('#datepicker').val();

			    	$.ajax({
						url: 'searchDiary',
						type:'post',
						data:{inputdate:dateText},
						success:function(data){
							if(data > 0){
								$('#datepicker').datepicker('setDate', dateText);
									window.location.href='myDiaryList?num='+data;
								} else {
								alert('해당 날짜에 쓴 일기가 없습니다');
								return false;
									}
							},
							error:function(e){
								alert(JSON.stringify(e));
								}
					});
	            }
            
                    });
            $('#datepicker').datepicker('setDate', 'today');
             });
    </script>
 </div>
                        </div>
</div>
	
	
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


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