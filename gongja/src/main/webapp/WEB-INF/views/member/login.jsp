<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Soyuz is a bootstrap 4x + laravel admin dashboard template">
    <meta name="keywords" content="admin, admin dashboard, admin panel, admin template, analytics, bootstrap 4, laravel, clean, crm, ecommerce, hospital, responsive, rtl, sass support, ui kits">
    <meta name="author" content="Themesbox17">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>로그인</title>
    <!-- Fevicon -->
    <link rel="shortcut icon" href="../resources/images/favicon.ico">
    <!-- Start css -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../resources/css/icons.css" rel="stylesheet" type="text/css">
    <link href="../resources/css/style.css" rel="stylesheet" type="text/css">
    <!-- End css -->
    <script src="../resources/jquery/jquery-3.4.1.js"></script>
    <script>
    $(document).ready(function(){
    	$('#login').on('click', login);
    });

    function login(){
        var id = $('#id').val();
        var password = $('#password').val();

        $.ajax({
    		url: 'login',
    		type: 'post',
    		data: {id:id, password:password},
    		dataType: 'text',
    		success: function(msg){
    			if(msg == 1){
                    alert('로그인되었습니다');
                    window.location.href='../';
                 } else if(msg == 2){
                   alert('인증되지 않은 아이디입니다.');
                  }
                 else{
                    alert('아이디 또는 비밀번호가 틀립니다');
                 }
    		},
    		error:function(){
    			alert('전송 실패');
    		}
    	}); 
        };
    
    </script>
</head>
<body class="horizontal-layout">
    <!-- Start Containerbar -->
    <div id="containerbar" class="containerbar authenticate-bg">
        <!-- Start Container -->
        <div class="container">
            <div class="auth-box login-box">
                <!-- Start row -->
                <div class="row no-gutters align-items-center justify-content-center">
                    <!-- Start col -->
                    <div class="col-md-6 col-lg-5">
                        <!-- Start Auth Box -->
                        <div class="auth-box-right">
                            <div class="card">
                                <div class="card-body">
                                        <div class="form-head">
                                            <a href="/gongja" class="logo"><img src="../resources/images/logo11.png" class="img-fluid" alt="logo"></a>
                                        </div>
                                        <h4 class="text-primary my-4">로그인</h4>
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="id" placeholder="Enter ID" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="password" placeholder="Enter Password" required>
                                        </div>
                                        <div class="form-row mb-3">
                                            <div class="col-sm-6">
                                                <div class="custom-control custom-checkbox text-left">
                                                  <input type="checkbox" class="custom-control-input" id="rememberme">
                                                  <label class="custom-control-label font-14" for="rememberme">로그인 상태 유지</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                              <div class="forgot-psw">
                                                <a id="forgot-psw" href="forgot" class="font-14">아이디/비밀번호 찾기</a>
                                              </div>
                                            </div>
                                        </div>
                                      <input type="button" id="login" value="로그인" class="btn btn-success btn-lg btn-block font-18">
                                    
                                    <p class="mb-0 mt-3">아직 회원이 아니신가요? <a href="signin">회원가입</a></p>
                                </div>
                            </div>
                        </div>
                        <!-- End Auth Box -->
                    </div>
                    <!-- End col -->
                </div>
                <!-- End row -->
            </div>
        </div>
        <!-- End Container -->
    </div>
    <!-- End Containerbar -->
    <!-- Start js -->
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/popper.min.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/modernizr.min.js"></script>
    <script src="../resources/js/detect.js"></script>
    <script src="../resources/js/jquery.slimscroll.js"></script>
    <!-- End js -->
</body>
</html>