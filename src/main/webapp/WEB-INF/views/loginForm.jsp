<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="viho admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, viho admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="pixelstrap">
    <link rel="icon" href="./assets/images/favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon">
    <title>viho - Premium Admin Template</title>
    <!-- Google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <!-- Font Awesome-->
    <link rel="stylesheet" type="text/css" href="../assets/css/fontawesome.css">
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="../assets/css/icofont.css">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="../assets/css/themify.css">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="../assets/css/flag-icon.css">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="../assets/css/feather-icon.css">
    <!-- Plugins css start-->
    <!-- Plugins css Ends-->
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <link id="color" rel="stylesheet" href="./assets/css/color-1.css" media="screen">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/responsive.css">
<!-- <script type="text/javascript"> 
 	function loginCheck(){
 		console.log('로그인 작동합니다');
 		var id = document.getElementById('inputId');
 		var pw = document.getElementById('inputPw');
 		console.log(id.value, pw.value);
		
 		var frm = document.forms[0];
 		frm.action = "./logingo.do";
 		console.log(frm);
		
 		//유효성 검사 후 Ajax 로그인
 		if(id.value == "" || id.value.trim() == ""){
 			id.value = "";
 			id.focus();
 			swal ("로그인", "아이디를 입력해주세요.");
 		}else if(pw.value == "" || pw.value.trim()==""){
 			pw.value="";
 			pw.focus();
 			swal("로그인", "비밀번호를 입력해주세요.");
 		}else{
 			$.ajax({
				url:"./loginCheckTraMap.do",
 				method:"post",
 				data:"id=" + id.value + "&pw=" + pw.value,
 				success : function(msg){
 					console.log(msg, typeof msg); //msg 형태 확인
 					console.log(msg.isc);
 					if(msg.isc == "성공"){
 						console.log(msg.isc);
 						frm.submit();
 					}else{
 						swal("로그인", "해당 사용자는 존재하지 않습니다.");
 					}
				},
 				error:function(){
 					swal("로그인", "로그인에 장애가 발생하였습니다.");
 				}
 			})
 		}
 	}
 </script> -->
</head>
<body>
 <!-- Loader starts-->
    <div class="loader-wrapper">
      <div class="theme-loader">    
        <div class="loader-p"></div>
      </div>
    </div>
    <!-- Loader ends-->
    <!-- page-wrapper Start-->
    
    <section>    
          <div id="demo1"><a href="../ins/loginPage.do" class="btn btn-success btn-lg btn-block">
          <span class="icofont icofont-support"></span> 강사 로그인</a>
              <a href="../user/loginPage.do" class="btn btn-success btn-lg btn-block">
               
              <span class="icofont icofont-support"></span> 일반회원 로그인</a></div>
      <div class="container-fluid p-0">
 
   <h3>  <p><a class="ms-2" href="./main.do">메인으로</a></p></h3>
     <sec:authorize access="isAuthenticated()">
     <h3><p><a class="ms-2" href="./main.do">메인으로</a></p></h3>
     </sec:authorize>
       <input class="btn btn-warning btn-block btn-lg" type="button" value="뒤로가기" onclick="history.back(-1)">
        <div class="row">
          <div class="col-12">
            <div class="login-card">
               <div id="accordion" class="default-according">
<div class="card">
<div class="card-header" id="headingOne">
<h5 class="mb-0">
<button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true"      aria-controls="collapseOne">
Collapsible Group Item #
                              <span class="digits">1</span>
</button>
</h5>
</div>
<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion">
<div class="card-body">
Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
</div>
</div>
</div>
<div class="card">
...
</div>
<div class="card">
...
</div>
</div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- page-wrapper end-->
    <!-- latest jquery-->
    <script src="../assets/js/jquery-3.5.1.min.js"></script>
    <!-- feather icon js-->
    <script src="../assets/js/icons/feather-icon/feather.min.js"></script>
    <script src="../assets/js/icons/feather-icon/feather-icon.js"></script>
    <!-- Sidebar jquery-->
    <script src="../assets/js/sidebar-menu.js"></script>
    <script src="../assets/js/config.js"></script>
    <!-- Bootstrap js-->
    <script src="../assets/js/bootstrap/popper.min.js"></script>
    <script src="../assets/js/bootstrap/bootstrap.min.js"></script>
    <!-- Plugins JS start-->
    <!-- Plugins JS Ends-->
    <!-- Theme js-->
    <script src="../assets/js/script.js"></script>
    <!-- login js-->
    <!-- Plugin used-->
</body>
</html>