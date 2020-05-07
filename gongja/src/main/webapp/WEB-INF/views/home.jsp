<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>GongJa</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <!-- Place favicon.ico in the root directory -->

	<!-- favicon -->
	<link rel="shortcut icon" href="resources/one/img/favicon.ico">

    <!-- CSS here -->
    
    <link rel="stylesheet" href="resources/one/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/one/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/one/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/one/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/one/css/themify-icons.css">
    <link rel="stylesheet" href="resources/one/css/nice-select.css">
    <link rel="stylesheet" href="resources/one/css/flaticon.css">
    <link rel="stylesheet" href="resources/one/css/gijgo.css">
    <link rel="stylesheet" href="resources/one/css/animate.min.css">
    <link rel="stylesheet" href="resources/one/css/slick.css">
    <link rel="stylesheet" href="resources/one/css/slicknav.css">
    <link rel="stylesheet" href="resources/one/css/style1.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
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
                                    <img src="resources/one/img/logo11.png" style="width: 50%; max-width: 760px; vertical-align: middle" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-7">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                <c:if test="${sessionScope.loginId == null }">
                                    <ul id="navigation">
                                        <li><a href="/gongja" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE;">home</a></li>
                                        <li><a href="member/login" onclick="alert('로그인후 사용할수있습니다.')" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE;">학습 시작</a></li>
                                        <li><a href="member/login" onclick="alert('로그인후 사용할수있습니다.')" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE;">캘린더</a></li>
                                        <li><a href="member/login" onclick="alert('로그인후 사용할수있습니다.')" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE;">스터디룸</a></li>
                                        <li><a href="member/login" onclick="alert('로그인후 사용할수있습니다.')" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE;">스터디일기</a></li>
                                        <li><a href="member/login" onclick="alert('로그인후 사용할수있습니다.')" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE;">학습 통계</a></li>
                                    </ul>
                                    </c:if>
                                     <c:if test="${sessionScope.loginId != null }">
                                    <ul id="navigation">
                                        <li><a href="/gongja" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE;">home</a></li>
                                        <li><a href="study/study" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">학습 시작</a></li>
                                        <li><a href="calendar/calendar" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">캘린더</a></li>
										<li><a href="room/myRoom" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">스터디룸</a></li>		
                                        <li><a href="study/myDiaryList" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">스터디일기</a></li>
                                        <li><a href="chart/today" style="color: black; font-size: medium; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">학습 통계</a></li>
                                    </ul>
                                    </c:if>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 d-none d-lg-block" >
                            <div class="Appointment">
                                <div class="book_btn d-none d-lg-block">
                                <!-- 상단바 로그인 -->
                                <c:if test="${sessionScope.loginId == null }">
                                    <a  href="member/login" style="border-color: #00008B; color: #00008B">login</a>
                                    <a  href="member/signin" style="border-color: #00008B; color: #00008B">sign up</a>
                                </c:if>
                                <!-- 상단바 로그인 경우 -->
                                 <c:if test="${sessionScope.loginId != null}">
      							  <li class="nav-item dropdown active">
      							  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border-color: #00008B; color: #00008B">
      							   <img style="width: 33px; height: 33px;  border-radius: 70%;" src="<c:url value="${loginImage}"/>" class="img-fluid" alt="profile"> ${sessionScope.loginId}님 안녕하세요
       							 </a>
        						<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="border: 0px">
          						<a class="dropdown-item" href="member/profile" style="border-color: #00008B; color: #00008B; text-align: center;">프로필 보기</a>
          						<a class="dropdown-item" href="message/messageList" style="border-color: #00008B; color: #00008B; text-align: center;">쪽지</a>
         						<a class="dropdown-item" href="member/logout" style="border-color: #00008B; color: #00008B; text-align: center;">로그아웃</a>
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

    <div class="shap_big_2 d-none d-lg-block">
        <img src="resources/one/img/ilstrator/body_shap_2.png" alt="">
    </div>
    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="shap_img_1 d-none d-lg-block">
            <img src="resources/one/img/ilstrator/body_shap_1.png" alt="">
        </div>
        <div class="poly_img">
            <img src="resources/one/img/ilstrator/poly.png" alt="">
        </div>
        <div class="single_slider  d-flex align-items-center slider_bg_1">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-10 offset-xl-1">
                        <div class="slider_text text-center">
                            <div class="text">
                                <h3 style="text-shadow: 5px 5px 10px #4169E1;">
                                    GongJa
                                </h3>
                                <h2 style="text-shadow: 3px 3px 10px #4682B4;">
                                  	공부의 시작과 마무리, 공부하자!
                                </h2>
                            </div>
                            <br>
                            <div class="ilstrator_thumb">
                                <img src="resources/one/img/banner_img1.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- case_study_area  -->
    <div class="case_study_area case_bg_1">
        <div class="patrn_1 d-none d-lg-block">
            <img src="resources/one/img/pattern/patrn_1.png" alt="">
        </div>
        <div class="patrn_2 d-none d-lg-block">
            <img src="resources/one/img/pattern/patrn.png" alt="">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-95 white_text">
                        <h3 style="text-shadow: 2px 2px 7px #800000">주요기능</h3>
                        <br>
                        <p style="text-shadow: 2px 2px 7px #800000">자기주도학습증진</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="case_active owl-carousel">
                            <div class="single_study text-center">
                                    <div class="thumb">
                                        <a href="#">
                                            <img src="resources/one/img/main/hohoho.JPG" alt="">
                                        </a>
                                    </div>
                                    <div class="subheading">
                                        <h4><a href="#">캠을 통한 학습</a></h4>
                                        <p>인터넷 강의 학습시 집중도 증가</p>
                                    </div>
                                </div>
                            <div class="single_study text-center">
                                    <div class="thumb">
                                        <a href="#">
                                            <img src="resources/one/img/main/ha.JPG" alt="">
                                        </a>
                                    </div>
                                    <div class="subheading">
                                        <h4><a href="#">얼굴 인식</a></h4>
                                        <p>인식을 통해 집중유도</p>
                                    </div>
                                </div>
                            <div class="single_study text-center">
                                    <div class="thumb">
                                        <a href="#">
                                            <img src="resources/one/img/main/ho.JPG" alt="">
                                        </a>
                                    </div>
                                    <div class="subheading">
                                        <h4><a href="#">알림 서비스</a></h4>
                                        <p>공부에 집중하지 않을 때 알림 서비스</p>
                                    </div>
                                </div>
                            <div class="single_study text-center">
                                    <div class="thumb">
                                        <a href="#">
                                            <img src="resources/one/img/main/time.JPG" alt="">
                                        </a>
                                    </div>
                                    <div class="subheading">
                                        <h4><a href="#">스톱워치</a></h4>
                                        <p>공부시간 측정</p>
                                    </div>
                                </div>
                                <div class="single_study text-center">
                                        <div class="thumb">
                                            <a href="#">
                                                <img src="resources/one/img/main/chart.JPG" alt="">
                                            </a>
                                        </div>
                                        <div class="subheading">
                                            <h4><a href="#">학습통계</a></h4>
                                            <p>알림, 공부시간 측정데이터</p>
                                        </div>
                                    </div>
                                <div class="single_study text-center">
                                        <div class="thumb">
                                            <a href="#">
                                                <img src="resources/one/img/main/cal.JPG" alt="">
                                            </a>
                                        </div>
                                        <div class="subheading">
                                            <h4><a href="#">캘린더</a></h4>
                                            <p>학습증진을 위한 캘린더</p>
                                        </div>
                                    </div>
                                    <div class="single_study text-center">
                                            <div class="thumb">
                                                <a href="#">
                                                    <img src="resources/one/img/main/dia.JPG" alt="">
                                                </a>
                                            </div>
                                            <div class="subheading">
                                                <h4><a href="#">학습일기</a></h4>
                                                <p>되돌아보는 시간, 영상 제공</p>
                                            </div>
                                        </div>
                                     <div class="single_study text-center">
                                            <div class="thumb">
                                                <a href="#">
                                                    <img src="resources/one/img/main/studygroup.JPG" alt="">
                                                </a>
                                            </div>
                                            <div class="subheading">
                                                <h4><a href="#">스터디룸</a></h4>
                                                <p>오프라인 스터디룸을 통한 학습공유</p>
                                            </div>
                                        </div>   
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ case_study_area  -->

    <!-- accordion_area  -->
    <div class="accordion_area">
        <div class="container">
            <div class="row align-items-center">

                <div class="col-xl-6 col-lg-6">
                    <div class="faq_ask">
                        <h3>Why Study</h3>
                            <div id="accordion">
                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                        배우나 생각하지 않으면 공허하고, 생각하나 배우지 않으면 위험하다
                                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion" style="">
                                            <div class="card-body">내일은 우리가 어제로부터 무엇인가 배웠기를 바란다.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                                        목적없는 공부는 기억에 해가 될 뿐이며, 머리속에 들어온 어떤 것도 간직하지 못한다
                                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion" style="">
                                            <div class="card-body">Esteem spirit temper too say adieus who direct esteem esteems luckily or picture placing drawing.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingThree">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                        내일은 우리가 어제로부터 무엇인가 배웠기를 바란다.
                                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion" style="">
                                            <div class="card-body">Esteem spirit temper too say adieus who direct esteem esteems luckily or picture placing drawing.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="accordion_thumb">
                        <img src="resources/one/img/learning_img.png" alt="">
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!--/ accordion_area  -->



    <!-- testimonial_area  -->
    <div class="testimonial_area ">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="testmonial_active owl-carousel">
                            <div class="single_carousel">
                                    <div class="single_testmonial text-center">
                                            <div class="quote">
                                                <img src="resources/one/img/testmonial/quote.svg" alt="">
                                            </div>
                                            <p>미쳤다 그냥 <br> 
                                                   </p>
                                            <div class="testmonial_author">
                                                <div class="thumb">
                                                        <img src="resources/one/img/testmonial/thumb.png" alt="">
                                                </div>
                                                <h3>므요</h3>
                                                <span>고등학교 3학년</span>
                                            </div>
                                        </div>
                            </div>
                            <div class="single_carousel">
                                    <div class="single_testmonial text-center">
                                            <div class="quote"> 
                                                <img src="resources/one/img/testmonial/quote.svg" alt="">
                                            </div>
                                            <p>어떻게 이런게 있어? <br> 
                                                     </p>
                                            <div class="testmonial_author">
                                                <div class="thumb">
                                                        <img src="resources/one/img/testmonial/dd.png" alt="">
                                                </div>
                                                <h3>마가렛트</h3>
                                                <span>롯데</span>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                </div>
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
    <script src="resources/one/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="resources/one/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="resources/one/js/popper.min.js"></script>
    <script src="resources/one/js/bootstrap.min.js"></script>
    <script src="resources/one/js/owl.carousel.min.js"></script>
    <script src="resources/one/js/isotope.pkgd.min.js"></script>
    <script src="resources/one/js/ajax-form.js"></script>
    <script src="resources/one/js/waypoints.min.js"></script>
    <script src="resources/one/js/jquery.counterup.min.js"></script>
    <script src="resources/one/js/imagesloaded.pkgd.min.js"></script>
    <script src="resources/one/js/scrollIt.js"></script>
    <script src="resources/one/js/jquery.scrollUp.min.js"></script>
    <script src="resources/one/js/wow.min.js"></script>
    <script src="resources/one/js/nice-select.min.js"></script>
    <script src="resources/one/js/jquery.slicknav.min.js"></script>
    <script src="resources/one/js/jquery.magnific-popup.min.js"></script>
    <script src="resources/one/js/plugins.js"></script>
    <script src="resources/one/js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="resources/one/js/contact.js"></script>
    <script src="resources/one/js/jquery.ajaxchimp.min.js"></script>
    <script src="resources/one/js/jquery.form.js"></script>
    <script src="resources/one/js/jquery.validate.min.js"></script>
    <script src="resources/one/js/mail-script.js"></script>

    <script src="resources/one/js/main.js"></script>
</body>

</html>
