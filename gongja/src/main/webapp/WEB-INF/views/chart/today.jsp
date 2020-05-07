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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <!-- favicon -->
<link rel="shortcut icon" href="../resources/one/img/favicon.ico">
	    <!-- timer -->
	   <link href="../resources/css/jquery.counter-analog2.css" rel="stylesheet">
	   <script src="../resources/js/jquery.counter.js"></script>
	    
    <link rel="shortcut icon" href="../resources/images/favicon.ico">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<!-- CSS here -->
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


<!-- 구글차트 -->    
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- 1번 차트 -->	
<script type="text/javascript">
  google.charts.load("current", {'packages':["timeline"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var container = document.getElementById('example4.2');
    var chart = new google.visualization.Timeline(container);
    var dataTable = new google.visualization.DataTable();

    var str = ${str}
    dataTable.addColumn({ type: 'string', id: 'Role' });
    dataTable.addColumn({ type: 'string', id: 'Name' });
    dataTable.addColumn({ type: 'date', id: 'Start' });
    dataTable.addColumn({ type: 'date', id: 'End' });
    dataTable.addRows(str);

    var options = {
      timeline: { groupByRowLabel: true},
      tooltip: { isHtml: true },
    };
 

    chart.draw(dataTable, options);
  }
</script>
<!-- 2번 차트 -->
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart', 'bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {

        var str2 = ${str2}
        var button = document.getElementById('change-chart');
        var chartDiv = document.getElementById('chart_div');
        var data = google.visualization.arrayToDataTable(str2);

        var materialOptions = {
          width: 500,

        };
        var options = {
                title: ''
              };

        function drawMaterialChart() {
          var materialChart = new google.charts.Bar(chartDiv);
          materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
          
        }

        drawMaterialChart();
    };
    </script>
    
    <!-- 3번 차트 -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart3);

      function drawChart3() {
    	  var str3 = ${str3}
        var data = google.visualization.arrayToDataTable(str3);

        var options = {
          title: '',
          pieHole: 0.3
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
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
div.google-visualization-tooltip { width:200px; }

</style>
</head>
<body>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <img src="../resources/images/logo11.png" id="logo" class="img-fluid" alt="logo">
  </div>
</div>

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
    <div class="bradcam_area" style="padding-bottom: 0px; padding-top: 100px">
            <div class="bradcam_shap">
                <img src="../resources/one/img/ilstrator/bradcam_ils.png" alt="">
            </div>
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center" style="padding-bottom: 40px">
                            <h3>학습통계</h3>
            
				 	</div>
    
<div class="container">
<br>
<button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='week'">주간통계</button>
<button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='year'">년간통계</button>
<br>
<div align="center">
<h4><strong>[오늘의 타임라인]</strong></h4>
<div id="example4.2" style="width:1000px; height: 200px;"></div>
 <div class="row">
<div class="col-lg-6">
<h4><strong>[오늘의 그래프]</strong></h4>
<div id="chart_div" style="width: 400px; height: 400px;"></div>
</div>
<div class="col-lg-6">
<h4><strong>[오늘의 과목별 알람]</strong></h4>
<div id="piechart" style="width: 400px; height: 400px;"></div>
</div>
</div>
</div>
</div>
</div>
 </div>   
 
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