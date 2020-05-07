<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
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

    	// 아이디 중복 체크
    	$('#idCheck').on('click', test1);

    	$('#signIn').on('click',check);
    	
    });

    function test1(){
    	var id = $('#id').val();
    	if(id.length = 0 || id == ''){
    		alert('id를 입력해주세요');
    		return false;
    		}
    	
    	$.ajax({
    		url: 'checkId',
    		type: 'post',
    		data: {id:id},
    		dataType: 'text',
    		success: function(msg){
    			if(msg > 0){
    			alert('이미 존재하는 아이디입니다');
    			$('#id').focus();
    				}else{
    			alert('사용가능한 아이디입니다');
    			}
    		},
    		error:function(){
    			alert('전송 실패');
    		}
    	});
    	
    }

    function check(){

    	 // 이메일 형식 체크
    	var sEmail = $('#email').val();
    	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    	var msg = '';
    	if (!filter.test(sEmail)) {
    	alert('올바른 이메일 형식이 아닙니다');
    	return false;
    	} 

    	// id를 체크하고 고칠 수도 있으니까 또 체크
    	var id = $('#id').val();

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
    		

    	// 패스워드 자리수 확인
    	var pw = $('#pw1').val();
    	var pw2 = $('#pw2').val();

    	if(pw != pw2){
    	alert('패스워드 다시 입력이 일치하지 않습니다.');
    	return false;
    		}
    	if(pw.length > 16 || pw.length < 4){
    	alert('패스워드는 4~16자리로 입력해주십시오');
    	return false;
    		}

    	var nn = $('#nickname').val();
    	if(nn.length=0 || nn==''){
    	alert('닉네임을 입력해주세요');
    	return false;
    		}

    		$.ajax({
    			url: 'checkId',
    			type: 'post',
    			data: {id:id},
    			dataType: 'text',
    			success: function(msg){
    				if(msg > 0){
    				alert('이미 존재하는 아이디입니다');
    				$('#id').focus();
    				return false;
    					} else{
        					
    	$.ajax({
    		url: 'signIn',
    		type:'post',
    		data: {id:id,password:pw,nickname:nn,email:sEmail,birthdate:birthdate},
    		success:function(data){
    if(data > 0){
    			alert('메일 인증화면으로 넘어갑니다');
    			var sEmail = $('#email').val();
				var nn = $('#nickname').val();
				var pw = $('#pw1').val();
				var birthdate = $('#birthdate').val();
				var id = $('#id').val();

				$.ajax({
					url: 'emailsend',
					type: 'post',
					data:{
						email:sEmail,
						nickname:nn,
						id:id,
						password:pw,
						birthdate:birthdate
					},
					success:function(){
						location.href="emailConfirm";
						},
					error:function(e){
						Json.stringify(e);
					}
				});
    			} else{
    			alert('회원가입 실패');
    			alert('홈 페이지로 이동합니다');
    				window.location.href='../';
    			};
    		},
    		error:function(){
    		alert('에러 발생');
    			}	
    		});
        					}
    			},
    			error:function(){
    				alert('전송 실패');
    				return false;
    			}
    		});
    		
    }  
    </script>
</head>
<body class="horizontal-layout">
    <!-- Start Containerbar -->
    <div id="containerbar" class="containerbar authenticate-bg">
        <!-- Start Container -->
        <div class="container">
            <div class="auth-box register-box">
                <!-- Start row -->
                <div class="row no-gutters align-items-center justify-content-center">
                    <!-- Start col -->
                    <div class="col-md-6 col-lg-5">
                        <!-- Start Auth Box -->
                        <div class="auth-box-right">
                            <div class="card">
                                <div class="card-body">
                                    <form action="#">
                                        <div class="form-head">
                                            <a href="index.html" class="logo"><img src="../resources/images/logo11.png" class="img-fluid" alt="logo"></a>
                                        </div>
                                        <h4 class="text-primary my-4">회원가입</h4>
                                        <div class="form-group row">
                                          <label for="id">아이디</label>
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder="Enter ID" id="id">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button" id="idCheck">중복확인</button>
                                            </div>
                                        </div>
                                      </div>

                                        <div class="form-group row">
                                          <label for="password">비밀번호</label>
                                          <input type="password" class="form-control" id="pw1" placeholder="Enter Password" required>
                                          <input type="password" class="form-control" id="pw2" placeholder="Enter Password Again" required>
                                          <small id="passwordHelpBlock" class="form-text text-muted">
                                          비밀번호는 4~16자리로 입력해주세요
                                          </small>
                                        </div>
                                        <div class="form-group row">
                                          <label for="nickname">닉네임</label>
                                            <input type="text" class="form-control" id="nickname" placeholder="Enter Nickname" required>
                                        </div>
                                        <div class="form-group row">
                                          <label for="email">이메일</label>
                                            <input type="text" class="form-control" id="email" placeholder="example@example.com" required>
                                        </div>
                                        <div class="form-group row">
                                          <label for="birthdate">출생년도 <small>입력하신 년도는 통계를 위해 사용됩니다</small></label>
                                            <input type="number" class="form-control" id="birthdate" placeholder="ex) 1990" required>
                                        </div>
                                      <input type="button" id="signIn" class="btn btn-success btn-lg btn-block font-18" value="등록하기">
                                    </form>
                                    <p class="mb-0 mt-3">이미 회원이신가요? <a href="login">로그인</a></p>
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