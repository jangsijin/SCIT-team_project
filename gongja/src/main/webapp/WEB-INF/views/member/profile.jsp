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
padding-left: 680px;
}
</style>
<script>
$(document).ready(function(){
	
  	// 비밀번호 일치 체크
	$('#pw1').on('keyup', pwcheck);
	$('#pw2').on('keyup', pwcheck);

 	$('#update').on('click',update);
	$('#signoutBtn').on('click',signout);

	// 취소 버튼 클릭
	$('#cancel').on('click', function(){
		$(location).attr('href','../');
		});

	
});

function pwcheck(){
	if($('#pw1').val() != $('#pw2').val()){
	$('#div1').css('color','red');
		var mes = "패스워드가 일치하지 않습니다";
		$('#div1').html(mes);
		}
	else if(($('#pw1').val() == '') && ($('#pw2').val() == '')){
		$('#div1').html('');
		} else if($('#pw1').val() == $('#pw2').val()){
			$('#div1').css('color','blue');
		mes = "패스워드가 일치합니다";
		$('#div1').html(mes);
		}
}

function update(){

	var pw = $('#pw1').val();
	var pw2 = $('#pw2').val();

	if(pw != '' || pw.length != 0 || pw2 != '' || pw2.length != 0){
	// 패스워드 자리수 확인
	var msg = $('#div1').html();

	if(msg == "패스워드가 일치하지 않습니다"){
	alert('패스워드 다시 입력이 일치하지 않습니다.');
	return false;
		}
	if(pw.length > 16 || pw.length < 4){
	alert('패스워드는 4~16자리로 입력해주십시오');
	return false;
		}
	} else{
	alert('패스워드를 입력해주세요');
	return false;
		}

	// 출생년도
	var birthdate = $('#birthdate').val();

	if(birthdate.length = 0 || birthdate == ''){	
		alert('출생년도를 입력해주세요');
		return false;
    	}

	if(birthdate.length != 4 || birthdate.substr(0,2) != '19' && birthdate.substr(0,2) != '20'){
		alert('유효한 년도가 아닙니다');
		return false;
    	}
	
	var nn = $('#nickname').val();
	if(nn.length=0 || nn==''){
		alert('닉네임을 입력해주세요');
		return false;
			}

	var sEmail = $('#email').val();
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var msg = '';
	if (!filter.test(sEmail)) {
	alert('올바른 이메일 형식이 아닙니다');
	return false;
	} 

	
  }

function uploadImg(){

	if(document.getElementById("uploadImg").value!=""){
	    var fileSize = document.getElementById("uploadImg").files[0].size;
	    var maxSize = 3 * 1024 * 1024;//3MB
	 	 
	    if(fileSize > maxSize){
	       alert("첨부파일 사이즈는 3MB 이내로 등록 가능합니다. ");
	        $("uploadImg").val("");
	        return false;
	     }
	} 
	
        $('uploadImg').submit();
	  }
	 


function signout(){
	var passw = $('#pws').val();

	$.ajax({
	url: 'signout',
	type:'post',
	data:{password:passw},
	success:function(data){
if(data > 0){
			alert('탈퇴가 성공적으로 이루어졌습니다.');
				window.location.href='../';
			} else
			alert('비밀번호가 틀립니다');
		},
		error:function(e){
			alert(JSON.stringify(e));
			}
});
}

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
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>회원정보수정</h3>
            
			
				 	</div>
				 </div>
	 		</div>
    	 </div>
     </div>
        
        <!-- /bradcam_area  -->
    <!-- service_area  -->
    <div class="service_area minus_padding" style="margin: 0 auto">
        <div class="container" style="margin: 0 auto;">
		<div class="col-lg-3" style="margin: 0 auto;"></div>
			<div class="col-lg-6" style="margin: 0 auto;">
				<div class="jumbotron" style="padding-top:20px; background: #F0FFF0; margin: 0 auto;">
					<div class="form-group" style="text-align: left;">
					<form id="uploadImg" enctype="multipart/form-data" method="POST" action="uploadImg" onsubmit="return uploadImg();">
					<img id="uploadPreview" style="width: 100px; height: 100px;" src="<c:url value="${myImg}"/>"/>
					<input id="uploadImage" type="file" name="upload" onchange="PreviewImage();" accept=".jpg, .jpeg, .png, .gif" />
					<input type="submit"  id="imgBtn" value="대표 이미지 설정하기" >
					</form>
					</div>
					<hr>
					<form id="form1" method="post" action="updateMember" onsubmit="return update();">
						<div class="form-group" style="text-align: left;">
						<p style="color: black;">ID : &nbsp;${member.id}</p>
						</div>
						<hr>
						<div class="form-group" style="text-align: left;">
							비밀번호<input class="form-control" type="password" id="pw1" name="password" placeholder="비밀번호 입력"><br>
							<input class="form-control" type="password" id="pw2" placeholder="비밀번호 다시 입력">			
							<small id="passwordHelpBlock" class="form-text text-muted">
                                          비밀번호는 4~16자리로 입력해주세요		
						</div>
						<div id="div1"></div>
						<hr>
						<div class="form-group" style="text-align: left;">
							닉네임<input class="form-control" type="text" id="nickname" name="nickname" value="${member.nickname}" data="${member.nickname}"><br>
						</div>
						<hr>
						<div class="form-group" style="text-align: left;">
							이메일<input class="form-control" type="text" id="email" name="email" value="${member.email}" data="${member.email}">
						</div>
						<hr>
						<div class="form-group" style="text-align: left;">
							출생년도<input class="form-control" type="number" id="birthdate" name="birthdate" value="${member.birthdate}" data="${member.birthdate}"">
						</div>
						<hr>
						<input id="update" style="background:  #8FBC8F" class="btn btn-primary" type="submit" value="수정">
						<input id="cancel" style="background:  #8FBC8F" class="btn btn-primary" type="button" value="취소">
						<hr>
					</form>
					<div class="form-group" style="text-align: left;">
					<div style="text-align: center;">회원탈퇴하기</div><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 입력&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="pws"><input type="button" class="btn btn-primary" id="signoutBtn" value="탈퇴하기" style="margin-left: 20px; background: #8FBC8F;">
				</div>
			<div class="col-lg-4">
		</div>		
	</div> 
	</div>
	</div>
	</div>
	
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script type="text/javascript">

    function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    };

</script>

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
    <script src="../resources/one/js/waypoints.min.js"></script>
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