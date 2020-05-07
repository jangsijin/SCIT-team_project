<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link href='../resources/core/main.css' rel='stylesheet' />
<link href='../resources/daygrid/main.css' rel='stylesheet' />
<link href='../resources/timegrid/main.css' rel='stylesheet' />
<script src='../resources/core/main.js'></script>
<script src='../resources/daygrid/main.js'></script>
<script src='../resources/timegrid/main.js'></script>
<script src='../resources/interaction/main.min.js'></script>

<link rel="stylesheet" href="../resources/css/modalform.css">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="../resources/js/moment.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css">
<link rel="stylesheet"
	href="../resources/css/bootstrap-material-datetimepicker.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript"
	src="../resources/js/bootstrap-material-datetimepicker.js"></script>


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

<!--     <script src="../resources/two/js/moment.js"></script> -->
<!-- 	<script src="../resources/two/jquery/jquery-3.4.1.js"></script> -->

<script>
	var scno;
	var calendar;

	$(function() {
		$("#putModal").on("hidden.bs.modal", function() {
			$("#edit-title").val("");
			$("#edit-desc").val("");
			$("#edit-start").val("");
			$("#edit-end").val("");
			$("#edit-color").val("");
		})
	})

	document.addEventListener('DOMContentLoaded', function() {

		var calendarEl = document.getElementById('calendar');

		calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			nowIndicator : true,
			allDaySlot : false,
			navLinks : true,
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			editable : true,
			eventLimit : true,
			views : {
				month : {
					eventLimit : 3
				}
			},
			dateClick : function(info) {
				var today = moment().format('YYYY-MM-DD HH:mm');

				//modal을 띄워주는 명력어
				$('#putModal').modal();
				$('.modal-title').css('display', 'block');
				$('.modal-update').css('display', 'none');
				//저장버튼 보여주기
				$('#sc-save').css('display', 'block');
				//수정버튼 안 보여주기
				$('#sc-modify').css('display', 'none');


				$('#sc-save').off('click').on('click', function() {

					setEvent(info);
				});
			},

			eventDrop : function(info) {
				//이미 지나간 이벤트는 드레그로 수정 못하도록
				var dateEnd = moment(info.oldEvent.end).format('YYYY-MM-DD');
				var today = moment().format('YYYY-MM-DD');

				if (dateEnd < today) {
					alert('지나간 이벤트는 수정할 수 없습니다.');
					info.revert();
					return;
				}
				//새로이 수정할 이벤트 시작 날짜
				var dateStart = moment(info.event.start).format('YYYY-MM-DD');

				//유효성 검사 : 오늘 날짜 이전 날짜로는 스케줄 수정이 안되도록
				if (dateStart < today) {
					alert('지나간 날짜에는 스케쥴을 지정할 수 없습니다.');
					info.revert();

					return;
				}

				if (!confirm("정말로 변경하시겠습니까?")) {
					info.revert();
					return;
				} else {
					//info의 event에 없는 변수들은  extendedProbs에 담긴다.
					scno = info.event.extendedProps.schedule_no;
					var startDT = moment(info.event.start).format(
							'YYYY-MM-DD HH:mm');
					var endDT = moment(info.event.end).format(
							'YYYY-MM-DD HH:mm');

					$.ajax({
						method : 'POST',
						url : 'calendarMove',
						data : {
							'schedule_no' : scno,
							'start' : startDT,
							'end' : endDT

						},
						success : function(result) {
							if (result == 'success') {
								alert("일정이 변경 되었습니다.");

							} else {
								alert('일정 변경이 실패하였습니다.')
							}
						}
					});
				}
			},

			events : function(info, successCallback) {
				$.ajax({
					url : 'calendarList',
					type : 'POST',
					data : 'json',
					success : function(data) {

						successCallback(data);
					}

				});

			},

			eventClick : function(info) {

				
				var startDT = moment(info.event.start).format(
						'YYYY-MM-DD HH:mm');
				var endDT = moment(info.event.end).format('YYYY-MM-DD HH:mm');

				$('#title').html(info.event.title);
				$('#content').html(info.event.extendedProps.content);
				$('#startDT').html(startDT);
				$('#endDT').html(endDT);

				$('#showModal').modal();

				$('#ud-modify').on('click', function() {

					updateData(info);

				});

				$('#sc-close').on('click', function() {

					deleteData(info);

				});

			}

		});

		calendar.render();
	});

	function setEvent(info) {
		var title = $('#edit-title').val();
		var content = $('#edit-desc').val();
		var startDT = $('#edit-start').val();
		var endDT = $('#edit-end').val();
		var color = $('#edit-color').val();

		var date = info.dateStr;

		var today = moment().format('YYYY-MM-DD');

		$.ajax({
			method : 'POST',
			url : 'calendarInsert',
			data : {
				'title' : title,
				'content' : content,
				'start' : startDT,
				'end' : endDT,
				'color' : color
			},

			success : function(d) {

				if (d == 'success') {
					alert('일정등록 성공');

					$("#putModal").modal('hide');

					calendar.refetchEvents();

				} else {
					alert('등록이 실패하였습니다.')
				}

			}
		});

	}

	function deleteData(info) {
		scno = info.event.extendedProps.schedule_no;
		$.ajax({
			method : 'POST',
			url : 'calendarDelete',
			data : {
				'schedule_no' : scno
			},

			success : function(a) {
				if (a == 'success') {
					alert('일정이 삭제 되었습니다.')

					$("#putModal").modal('hide');

					calendar.refetchEvents();
				}
			}

		});

	}

	function updateData(info) {
		//일정 확인 모달 창 닫기	
		$("#showModal").modal('hide');
		$('.modal-title').css('display', 'none');
		$('.modal-update').css('display', 'block');
		//입력모달 열기
		$("#putModal").modal();
		//저장버튼 숨키고
		$('#sc-save').css('display', 'none');
		//수정버튼 보이기
		$('#sc-modify').css('display', 'block');
		//formatMarker();

		//시간 날짜 값 표기
		var startDT = moment(info.event.start).format('YYYY-MM-DD HH:mm');
		var endDT = moment(info.event.end).format('YYYY-MM-DD HH:mm');

		//값 입력 
		$('#edit-title').val(info.event.title);
		$('#edit-desc').val(info.event.extendedProps.content);
		$('#edit-start').val(startDT);
		$('#edit-end').val(endDT);
		$('#edit-color').val(info.event.backgroundColor);

		// 일정 수정 실행
		$('#sc-modify').off('click').on('click', function() {
			modifyCalendar(info);
		});

	}
	function modifyCalendar(info) {

		var title = $('#edit-title').val();
		var content = $('#edit-desc').val();
		var startDT = $('#edit-start').val();
		var endDT = $('#edit-end').val();
		var color = $('#edit-color').val();

		// 유효성 검사
		if (title.length < 1) {
			alert('일정 제목을 입력해주세요.');
			return;
		}

		if (content.length < 1) {
			alert('일정 내용을 입력해주세요.');
			return;
		}

		scno = info.event.extendedProps.schedule_no;
		$.ajax({
			method : 'POST',
			url : 'calendarUpdate',
			data : {
				'schedule_no' : scno,
				'title' : title,
				'content' : content,
				'start' : startDT,
				'end' : endDT,
				'color' : color

			},
			success : function(result) {

				if (result == 'success') {
					alert('일정 수정 성공');

					$('#putModal').modal('hide');

					calendar.refetchEvents();
				} else {
					alert('수정이 실패하였습니다. 다시 한번 시도해 주세요.');

				}
			},
			error : function(err) {
				alert('에러가 발생하였습니다.');
			}
		});
	}
</script>
</head>
<body>
	<header>
		<div class="header-area" class="main-header-area"
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
												style="width: 33px; height: 33px; border-radius: 70%; "
												src="<c:url value="${loginImage}"/>" class="img-fluid"
												alt="profile"><span style="text-transform:none;"> ${sessionScope.loginId}님 안녕하세요</span>
										</a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown">
												<a class="dropdown-item" href="../member/profile"
													style="border-color: #00008B; color: #00008B; text-align: center;">프로필
													보기</a> <a class="dropdown-item" href="../message/messageList"
													style="border-color: #00008B; color: #00008B; text-align: center;">쪽지</a>
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

	<!-- bradcam_area  -->
	<div class="bradcam_area" style="padding-bottom: 40px">
		<div class="bradcam_shap">
			<img src="../resources/one/img/ilstrator/bradcam_ils.png" alt="">
		</div>
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text text-center">
						<h3>캘린더</h3>


					</div>
				</div>
			</div>
		</div>
	</div>

	<div class='container'>
		<div id='calendar'></div>


		<!-- Modal -->
		<div id="putModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">일정 등록</h4>
						<h4 class="modal-update">일정 수정</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">

						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-title">제목</label> <input
									class="inputModal" type="text" name="edit-title"
									id="edit-title" required="required" placeholder="제목를 입력해주세요." />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-start">시작</label> <input
									class="inputModal" type="text" name="edit-start"
									id="edit-start" placeholder="시작 시간을 입력해주세요."/>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-end">끝</label> <input
									class="inputModal" type="text" name="edit-end" id="edit-end" placeholder="끝 시간을 입력해주세요." />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-color">색상</label> <select
									class="inputModal" name="color" id="edit-color">
									<option selected="selected">선택하기</option>
									<option value="#D25565" style="color: #D25565;">빨간색</option>
									<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
									<option value="#F5ED71" style="color: #F5ED71;">노랑색</option>
									<option value="#BFF832" style="color: #BFF832;">라임색</option>
									<option value="#f06595" style="color: #f06595;">핑크색</option>
									<option value="#63e6be" style="color: #63e6be;">연두색</option>
									<option value="#017772" style="color: #017772;">초록색</option>
									<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
									<option value="#9775fa" style="color: #9775fa;">보라색</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-4" for="edit-desc">내용</label>
								<textarea rows="4" cols="50" class="inputModal" name="edit-desc"
									id="edit-desc" placeholder="공부 내용을 입력해 주세요."></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-success" id="sc-modify"
							value="수정하기"> <input type="button" class="btn btn-info"
							id="sc-save" value="Save">
						<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>

					</div>
				</div>

			</div>
		</div>

		<div id="showModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">일정 보기</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						제목 : <span id="title"></span><br> 시작일: <span id="startDT">
						</span><br> 끝날일: <span id="endDT"> </span> <br> 내용 :<span
							id="content"></span>

					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-success" id="ud-modify"
							value="수정하기"> <input type="button"
							class="btn btn-warning" id="sc-close" data-dismiss="modal"
							value="일정 삭제">
					</div>
				</div>

			</div>
		</div>
	</div>
	<script src="../resources/js/etcSetting.js"></script>

	<!-- Start js -->
	<!-- 	<script src="../resources/two/js/jquery.min.js"></script> -->
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/modernizr.min.js"></script>
	<script src="../resources/js/detect.js"></script>
	<script src="../resources/js/jquery.slimscroll.js"></script>
	<script src="../resources/js/horizontal-menu.js"></script>
	<!-- Switchery js -->
	<!--     <script src="../resources/two/plugins/switchery/switchery.min.js"></script> -->
	<!-- Datepicker JS -->
	<script src="../resources/plugins/datepicker/datepicker.min.js"></script>
	<script src="../resources/plugins/datepicker/i18n/datepicker.en.js"></script>
	<script src="../resources/js/custom/custom-form-datepicker.js"></script>
	<!-- Core js -->
	<!--     <script src="../resources/two/js/core.js"></script> -->
	<!-- End js -->

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
</body>
</html>
