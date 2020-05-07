<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/jquery/jquery-3.4.1.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script>
$(function(){
	//버튼 메인화면으로
	$("#btn_back_to_main").on("click",function(){
		location.href="<c:url value="/"/>"
	});

	//인증 메일 다시 보내기
	$("#btn_back_to_send").on("click",function(){
		var email=$("#input_email").val();
			$.ajax({
				url: 'emailrepeat',
				type:'post',
				data:{
					email:email
				},
				success:function(){
					alert("메일을 발송했습니다.");
				},
				error:function(e){
					alert(JSON.stringify(e));
				}
			});
	});

	//인증코드 대조하기
	$("#btn_code").on("click",function(){
		var input_code = $("#input_code").val();
		var input_email = $("#input_email").val(); 
		if(input_code.length!=0){
			$.ajax({		
				url:"verify",
				type:"post",
				data:{
					code:input_code,
					email:input_email
				},
				success: function(flag){
						if(flag=="accept"){
							alert('인증되었습니다');
							location.href="login";														
						}else {
							alert("인증코드가 일치하지 않습니다. 재입력 해주십시오.");
						}
				},
				error: function(e) {
					console.log(JSON.stringify(e));
				}
			});
		}else {
			alert("코드를 입력하고 인증을 진행해주세요.");
		}
	});
});

</script>
</head>
<body>
   <div id="containerbar" class="containerbar authenticate-bg" >
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
                              <h4 class="text-primary my-4">받은 코드 인증</h4>
                              <div class="form-group">
                                   <input type="hidden" class="form-control" id="input_email" value="${sessionScope.proved_email}" disabled="disabled">
                                   <input type="text" class="form-control" id="input_code" name="input_code" placeholder="인증코드를 입력하세요"><br>
                                   <input type="button" class="btn btn-success btn-primary btn-block font-18" id="btn_code" value="인증하기">
                                   <button type="button" class="btn btn-warning btn-primary btn-block font-18" id="btn_back_to_send">메일 다시 보내기</button>
                                   <button type="button" class="btn btn-danger btn-primary btn-block font-18" id="btn_back_to_main">메인화면으로</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>   
         </div>
      </div>
   </div>
</body>
</body>
</html>