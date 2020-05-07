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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    

<!-- Apex css -->
<link href="../resources/plugins/apexcharts/apexcharts.css"
	rel="stylesheet">
<!-- jvectormap css -->
<link
	href="../resources/plugins/jvectormap/jquery-jvectormap-2.0.2.css"
	rel="stylesheet">
<!-- Slick css -->
<link href="../resources/plugins/slick/slick.css" rel="stylesheet">
<link href="../resources/plugins/slick/slick-theme.css"
	rel="stylesheet">
<!-- Switchery css -->
<link href="../resources/plugins/switchery/switchery.min.css"
	rel="stylesheet">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="../resources/css/icons.css" rel="stylesheet"
	type="text/css">
<link href="../resources/css/flag-icon.min.css" rel="stylesheet"
	type="text/css">
<link href="../resources/css/style.css" rel="stylesheet"
	type="text/css">

<style>
#td1 { 
display: inline-block; 
width: 200px; 
white-space: nowrap; 
overflow: hidden; 
text-overflow: ellipsis; 
}

</style>

<script>
	$(document).ready(function() {
		$('#send2').on('click', send);
	});

	function send() {
		var reader = $('#reader').val();
		var detail = $('#detail').val();

		$.ajax({
			url : 'sendMsg',
			type : 'post',
			data : {
				reader : reader,
				detail : detail
			},
			dataType : 'text',
			success : function(msg) {
				if (msg > 0) {
					alert('메세지를 보냈습니다');
					window.location.href = 'messageList';
				} else {
					alert('없는 아이디 입니다');
				}
			},
			error : function() {
				alert('전송 실패');
			}
		});

	}
</script>

</head>
<body>
    <header>
		<div class="header-area "
			style="background: white; border-bottom: 2px solid #00008B; border-radius: 25px 25px 25px 25px">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-xl-3 col-lg-2">
							<div class="logo" style="box-sizing: border-box;">
								<a href="/gongja"> <img
									src="../resources/one/img/logo11.png"
									style="width: 50%; max-width: 760px; vertical-align: middle"
									alt="">
								</a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-7">
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<c:if test="${sessionScope.loginId != null }">
										<ul id="navigation">
											<li><a href="/gongja"
												style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE;">home</a></li>
											<li><a href="../study/study"
												style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">학습
													시작</a></li>
											<li><a href="../calendar/calendar"
												style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">캘린더</a></li>
											<li><a href="../room/myRoom"
												style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">스터디룸</a></li>
											<li><a href="../study/myDiaryList"
												style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">스터디일기</a></li>
											<li><a href="../chart/today"
												style="color: black; font-size: 15px; text-shadow: 3px 3px 10px #7B68EE; margin-left: 10px">학습
													통계</a></li>
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
										<li class="nav-item dropdown active"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"
											style="border-color: #00008B; color: #00008B"> <img
												style="width: 33px; height: 33px; border-radius: 70%;"
												src="<c:url value="${loginImage}"/>" class="img-fluid"
												alt="profile"> ${sessionScope.loginId}님 안녕하세요
										</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown">
												<a class="dropdown-item" href="../member/profile"
													style="border-color: #00008B; color: #00008B; text-align: center;">프로필</a>
												<a class="dropdown-item" href="../message/messageList"
													style="border-color: #00008B; color: #00008B; text-align: center; text-align: center;">쪽지</a>
												<a class="dropdown-item" href="../member/logout"
													style="border-color: #00008B; color: #00008B; text-align: center;">로그아웃</a>
											</div></li>
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
	<div class="bradcam_area" style="padding-bottom: 0px">
		<div class="bradcam_shap">
			<img src="../resources/one/img/ilstrator/bradcam_ils.png" alt="">
		</div>
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text text-center">
						<h3>쪽지 리스트</h3>


					</div>
				</div>
			</div>
		</div>
	</div>
<div class="service_area minus_padding" style="margin: 0 auto">
		<div class="contentbar" >
			<div class="row">
				<div class="col-md-12 col-lg-12 col-xl-5" style="margin: 0 auto;">
					<div class="card m-b-30">
						<div class="card-header">
							<a class="btn btn-default" id="modifyModal" data-target="#modal"
								data-toggle="modal" style="color: white;">쪽지 보내기</a>
						</div>
						<div class="card-body">
							<ul class="nav nav-tabs custom-tab-line mb-3" id="defaultTabLine"
								role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="home-tab-line" data-toggle="tab" href="#read" role="tab"
									aria-controls="home-line" aria-selected="true"><i
										class="feather icon-home mr-2"></i>받은 메세지</a></li>
								<li class="nav-item"><a class="nav-link"
									id="profile-tab-line" data-toggle="tab" href="#send" role="tab"
									aria-controls="profile-line" aria-selected="false"><i
										class="feather icon-user mr-2"></i>보낸 메세지</a></li>
							</ul>
							<div class="tab-content" id="defaultTabContentLine" style="text-align: center;">
								<div class="tab-pane fade show active" id="read" role="tabpanel"
									aria-labelledby="home-tab-line">
									<div class="table-responsive">
										<table class="table table-hover">
											<tr>
												<td>#</td>
												<td>보낸 이</td>
												<td>내용</td>
												<td>보낸 일시</td>
											</tr>
											<c:forEach var="i" items="${readlist}" varStatus="status">
												<tr>
													<td>${status.count}</td>
													<td>
														<div class="dropdown show">
															<a class="dropdown-toggle" href="#" role="button"
																id="dropdownMenuLink" data-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false">
																${i.sender} </a>
															<div class="dropdown-menu"
																aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item"
																	onclick="location.href='writeMessage?id=${i.sender}'">쪽지보내기</a>
															</div>
														</div>
													</td>
													<td>${i.detail}</td>
													<td>${i.send_date}</td>
												</tr>
											</c:forEach>
										</table>
									</div>

								</div>
								<div class="tab-pane fade" id="send" role="tabpanel"
									aria-labelledby="profile-tab-line" style="text-align: center;">
									<div class="table-responsive">
										<table class="table table-hover">
											<tr>
												<td>#</td>
												<td>받은 이</td>
												<td class="td1">내용</td>
												<td>보낸 일시</td>
											</tr>
											<c:forEach var="i" items="${sendlist}" varStatus="status">
												<tr>
													<td>${status.count}</td>
													<td>${i.reader}</td>
													<td>${i.detail}</td>
													<td>${i.send_date}</td>
												</tr>
											</c:forEach>
										</table>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function PreviewImage() {
			var oFReader = new FileReader();
			oFReader
					.readAsDataURL(document.getElementById("uploadImage").files[0]);

			oFReader.onload = function(oFREvent) {
				document.getElementById("uploadPreview").src = oFREvent.target.result;
			};
		};
	</script>

	<!--/ service_area  -->

	<!-- features_area  -->
	<div class="features_area">
		<div class="container"></div>
	</div>
	<!--/ features_area  -->

	<!-- testimonial_area  -->
	<div class="testimonial_area ">
		<div class="container"></div>
	</div>
	<!-- /testimonial_area  -->

	<!-- 모달 -->
	<div class="row">
		<div class="modal" id="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<p style="color: white; ">Message</p>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<form id="sendMessage">
							<div class="form-group">
								<label for="reader">수신할 아이디</label> <input type="text"
									class="form-control" value="${reader}" id="reader">
							</div>
							<div class="form-group">
								<label for="detail">내용</label>
								<textarea class="form-control" name="inputTextarea" id="detail"
									rows="3" placeholder="내용을 적어주세요"></textarea>
							</div>
							<input class="btn btn-primary" type="button" id="send2"
								value="보내기">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<footer class="footer">
		<div class=" container">
			<div class="pro_border">
				<div class="row">
					<div class="col-xl-6 col-md-6">
						<div class="lets_projects">
							<h3>Let’s Start your Study</h3>
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
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
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
<!-- 	<script src="../resources/one/js/waypoints.min.js"></script> -->
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