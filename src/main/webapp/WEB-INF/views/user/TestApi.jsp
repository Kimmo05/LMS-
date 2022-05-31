<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API TEST 페이지입니다</title>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
  
  <script type="text/javascript">
  
  		var mile = 0;
  		
  		//결제하기버튼
  		function checkPay(){
  			var listVar = $("input[name='selectPay']:checked").val();
    	  	console.log(listVar);
    	  	if(listVar == "payco"){
    	  		//함수 안에 가격,결제내용 을 보내줄 예정
    	  		request_pay2();
    	  	}else if(listVar == "kakaopay"){
    	  		requestPay3();
    	  	}else{
    	  		requestPay4();
    	  	};
  		}
  	  
  		//마일리지 사용하기 버튼
  		function useMilage(){
  			 const getMoney = document.getElementById('money');
  			 var moneyText = getMoney.innerText;
  			 var getMile = document.getElementById('milage').value;
//   			 if(보유마일리지>사용마일리지){
//   				 alert("보유마일리지가 부족합니다!")
//   			 }else{실행};
  			 var regex = /[^0-9]/g;
  			 var changeMoney = moneyText.replace(regex, "");
  			 var calc = changeMoney-getMile;
  			 alert("마일리지가 사용되었습니다!");
  			 getMoney.innerHTML 
  			    = '<h4>결제금액</h4><h2>'+calc+' 원</h2>';
  		}
  		
  
	  var IMP = window.IMP; 
	  IMP.init("imp97334987");
	  

	  //카카오페이 결제창
	 function requestPay3() {
	      IMP.request_pay({ // param
	          pg: "kakaopay",
	          pay_method: "card",
	          merchant_uid: "ORD20180131-0000132",
	          name: "송중기 kakaoApi결제 테스트",
	          amount: 100,
	          buyer_email: "jgjg05@gmail.com",
	          buyer_name: "송중기",
	          buyer_tel: "010-4242-4242",
	          buyer_addr: "서울특별시 강남구 신사동",
	          buyer_postcode: "01181"
	      }, function (rsp) { // callback
	          if (rsp.success) {
	        	  var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\n결제 금액 : ' + rsp.paid_amount;
	    			
	    			alert(msg);
	          } else {
	              alert("실패");
	          }
	      });
	    }
	  
	  //tosspay결제창
	 function requestPay4() {
	      IMP.request_pay({ // param
	          pg: "tosspay",
	          pay_method: "card",
	          merchant_uid: "ORD20180131-0001112",
	          name: "송중기 kakaoApi결제 테스트",
	          amount: 100,
	          buyer_email: "jgjg05@gmail.com",
	          buyer_name: "송중기",
	          buyer_tel: "010-4242-4242",
	          buyer_addr: "서울특별시 강남구 신사동",
	          buyer_postcode: "01181"
	      }, function (rsp) { // callback
	          if (rsp.success) {
	        	  var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\n결제 금액 : ' + rsp.paid_amount;
	    			
	    			alert(msg);
	          } else {
	              alert("실패");
	          }
	      });
	    }
	 
	  
	  //payco 결제창
	 function request_pay2(){
		 IMP.request_pay({
			    pg : "payco",  // KG이니시스 일반결제창 호출(상점아이디 MID-a 적용)
			    amount : 180,
			    name : "api 페이코 주문 테스트",
			    buyer_name : "송중기",
			    buyer_email : "buyer@iamport.kr"
			  }, function(rsp) {
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\n결제 금액 : ' + rsp.paid_amount;
	    			msg += '\n카드 승인번호 : ' + rsp.apply_num;
	    			alert(msg);
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "./payment/pay.do", 
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid,
				    		merchant_uid : rsp.merchant_uid
				    		//기타 필요한 데이터가 있으면 추가 전달
			    		}
			    	}).done(function(data){
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						alert("정상");			    			
			    	});
			    	//이동코드 작성
<%-- 			    	location.href='<%=request.getContextPath()%>'; --%>
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        
			        alert(msg);
			    }
			});
	 }
	 
	 function doF(){
		 $.ajax({
			 type:"post",
			 url:"./payment/cancel.do",
			 success:function(result){
				console.log(result);
				location.href="./payment/moveNext";
				 
			 }
		 })
	 }
	 
	 function doCheck(){
		 $.ajax({
			 type:"post",
			 url:"./payment/payInfo.do",
			 success:function(result){
				 console.log(result);
				 location.href="./payment/moveNext";
			 }
		 })
	 }
  </script>
  
</head>
<body>
	 
	 <div class ="btns">
	 	
	 	<input type="radio" name="selectPay" value="payco">&nbsp;페이코&nbsp;&nbsp;<img src="./resources/images/pay/payco.png"/>&nbsp;&nbsp;
	 	<input type="radio" name="selectPay" value="kakaopay">&nbsp;카카오페이&nbsp;&nbsp;<img src="./resources/images/pay/kakao.png"/>&nbsp;&nbsp;
	 	<input type="radio" name="selectPay" value="toss">&nbsp;토스결제&nbsp;&nbsp;<img src="./resources/images/pay/toss.png"/>
	 	<br>
	 	<br>
		<input type="button" id="check3" onclick="request_pay2()" value="페이코">
		<input type="button" id="check4" onclick="requestPay3()" value="카카오페이">
		<input type="button" id="check4" onclick="requestPay4()" value="토스">
		<br>
		<br>
		마일리지&nbsp;&nbsp;<input type="number" name="milage" id="milage">&nbsp;
		<input type="button" id="check6" onclick="useMilage()" value="사용하기"><br><br><hr>
		<div id='money'>
			<h4>결제금액</h4>
			<h2>30000 원</h2>
		</div>
		<input type="button" id="check6" onclick="checkPay()" value="결제">
		
		<h1><a href="javascript:doCheck()">정보확인</a></h1>
		<a href="javascript:doF()">결제 취소</a>
	</div>
</body>
</html>