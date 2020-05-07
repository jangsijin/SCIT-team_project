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
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
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
    
    <!-- bar-rating --> 
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> 
    <link rel="stylesheet" href="../resources/css/fontawesome-stars.css"> 
    <script type="text/javascript" src="../resources/js/jquery.barrating.min.js"></script>

<script>
    $(document).ready(function(){

        $('#star').barrating({ 
        	theme: 'fontawesome-stars' 
        });
    });

function check(){
var title = $('#title').val();
var star = $("#star option:selected").val();
var detail = $('#detail').val();

if(title.length = 0 || title == ''){
	alert('id를 입력해주세요');
	return false;
	}
if(detail.length = 0 || detail == ''){
	alert('내용을 입력해주세요');
	return false;
	}
}

function uploadImg(){

	if(document.getElementById("uploadImage").value!=""){
	    var fileSize = document.getElementById("uploadImg").files[0].size;
	    var maxSize = 3 * 1024 * 1024;//3MB
	 	 
	    if(fileSize > maxSize){
	       alert("첨부파일 사이즈는 3MB 이내로 등록 가능합니다. ");
	        $("uploadImg").val("");
	        return false;
	}
	} else{
		alert('첨부파일이 없습니다');
		return false;
		     }
	  }

function delete1(num){
	if(confirm('정말 삭제하시겠습니까?')){
	$.ajax({
		url: 'deleteDiary',
		type: 'post',
		data: {num:num},
		dataType: 'text',
		success: function(msg){
			if(msg > 0)
			alert('삭제 완료');
			window.location.href='myDiaryList';
		},
		error:function(){
			alert('전송 실패');
		}
	});
		}
	return false;
	
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
padding-left: 300px;
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
                            <h2>수정 / 삭제</h2>
            
			
				 	</div>
				 </div>
	 		</div>
    	 </div>
     </div>
        
              <!-- /bradcam_area  -->
  <div class="col-md-12 col-lg-12 col-xl-5" style="margin: 0 auto; padding-left: 65px">
  
  <div class="card m-b-30">
 
                            <div class="card-header" style="background: blue;">
                                <h5 class="card-title" style="height: 10px ; display: table-cell; vertical-align: middle; color: white;">수정 / 삭제</h5>
                            </div>
                            <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-11">
                                            <form action="uploadImg" id="uploadImg" enctype="multipart/form-data" method="POST" onsubmit="return uploadImg();">
											<img id="uploadPreview" style="width: 300px; height: 300px;" src="<c:url value="/boardfile/${vo.image}"/>"/>
											<input id="uploadImage" type="file" name="upload" onchange="PreviewImage();" accept=".jpg, .jpeg, .png, .gif" />
											<input type="hidden" name="num" value="${vo.num}"> 
											<input type="submit" id="imgBtn" value="이미지 수정">
											<hr>
 										    </form>
                                        </div>
                                    
                                    <form action="updateDiary" enctype="multipart/form-data" method="post" onsubmit="return check();">
                                    <div class="form-row">
                                    <div class="form-group col-md-11">
                                         <label for="reader">제목</label>
   										 <input type="text" class="form-control" name="title" id="title" value="${vo.title}">
   										 <hr>
                                   </div>
                                    <div class="form-group col-md-11">
                                           <label for="star">별점</label>
  										   <select id="star" name="star">
                                           <option value="1" <c:if test="${vo.star == 1}">selected</c:if>>1</option>
                                           <option value="2" <c:if test="${vo.star == 2}">selected</c:if>>2</option>    
										   <option value="3" <c:if test="${vo.star == 3}">selected</c:if>>3</option>    
										   <option value="4" <c:if test="${vo.star == 4}">selected</c:if>>4</option>    
										   <option value="5" <c:if test="${vo.star == 5}">selected</c:if>>5</option>    
											</select> 
                                        </div>
                                        
                                     <div class="form-group col-md-11">
										 <label for="detail">내용</label>
 										 <textarea class="form-control" name="detail" id="detail" rows="3">${vo.detail}</textarea>
                                     </div>
                                    </div>
                                    <div class="form-group col-md-11">
                                     <input type="hidden" name="num" value="${vo.num}">
  									 <input class="btn btn-primary btn-lg" type="submit" value="작성">&nbsp;
                                     <input type="button" class="btn btn-danger" value="삭제" onclick="delete1('${vo.num}')">
                                    </div>
                                       </form>
                            </div>
                            
                        </div>
                        </div>
                        </div>
  
         
<script type="text/javascript">

    function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    };

</script>
	
	
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