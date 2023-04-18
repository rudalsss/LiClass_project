<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- html5 : 파일의 인코딩 방식 지정 - 한국어 처리를 위한 euc-kr과 다국어 처리를 위한 utf-8로 설정.-->
		<meta charset="utf-8" />
		<!-- html4 : 파일의 인코딩 방식 지정 -->
		<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
      	
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다.--> 
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<!-- STEP 1 -->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<!-- iamport.payment.js -->
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		
		<script type="text/javascript">
			var today = new Date();
	        var hours = today.getHours(); // 시
	        var minutes = today.getMinutes();  // 분
	        var seconds = today.getSeconds();  // 초
	        var milliseconds = today.getMilliseconds();
	        var makeMerchantUid = hours *  minutes * seconds - milliseconds;
	        
	        //STEP 2
			function payment(){
	        	
				IMP.init('imp52742288'); // 고정값 = 내 상점코드
				
				//const data = '${rvo.r_no }';
				
				IMP.request_pay({
					pg: 'html5_inicis.INIpayTest',
					pay_method : 'card', // 무조건 카드
					merchant_uid : "KH-LICLASS-" + makeMerchantUid, // 중복되면 결제 안됨
					name : '${rvo.c_title }',
					amount : ${rvo.r_price},
					buyer_email : '${uvo.user_email}',
					buyer_name : '${uvo.user_name }',
					buyer_tel : '${uvo.user_tel }'
				}, function(rsp){
					if(rsp.success){
						$.ajax({
							type:"POST",
							url:"/payment/callback_receive",
							headers:{'Content-Type':'application/json'},
							data:JSON.stringify({
								"imp_uid" : rsp.imp_uid,
								"success" : rsp.success,
								"error_msg" : rsp.error_msg,
								"merchant_uid" : rsp.merchant_uid,
								"pay_pg" : rsp.pg_provider,
								"pay_method" : rsp.pay_method,
								"r_no" :${rvo.r_no },
								"user_no" : ${rvo.user_no},
								"pay_name" : rsp.name,
								"pay_buyer_name" : rsp.buyer_name,
								"pay_buyer_tel" : rsp.buyer_tel,
								"pay_buyer_email" : rsp.buyer_email,
								"pay_price" : ${rvo.r_price},
								"usepoint" : ${usepoint}
							}),
							success : function(data){
								var merchant_uid = data.merchant_uid;
								$("input[name=merchant_uid]").attr("value",merchant_uid);
								
								$("#rnoDataForm").attr({
									method : "POST",
									action : data.goUrl
								});
								$("#rnoDataForm").submit();
							},
							error : function(data){
								console.log("실패");
							}
						});
					}else{                           // 결제 도중 취소 했을 때
						$("#rnoDataForm").attr({
							method:"POST",
							action:"/payment/justCancel"
						});
						$("#rnoDataForm").submit();
					}
				});	
	        }
		</script>
	</head>
	<body onload="payment()">
		<form id="rnoDataForm">
			<input type="hidden" name="user_no" value="${rvo.user_no}">
			<input type="hidden" name="r_no" value="${rvo.r_no }">
			<input type="hidden" name="merchant_uid" value="">
		</form>
	</body>
</html>