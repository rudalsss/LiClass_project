<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
		
		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다.--> 
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
	</head>
	<body>
		<h1>예약정보들 출력 test!!!</h1>
		<h1>r_no : ${rvo.r_no}</h1>
		<h1>user_no : ${rvo.user_no}</h1> 
		<h1> ep_no : ${rvo.ep_no} </h1>
		<h1> c_title : ${rvo.c_title} </h1>
		<h1> r_date : ${rvo.r_date}</h1>
		<h1> r_state : ${rvo.r_state}</h1>
		<h1> r_price : ${rvo.r_price}</h1>
		<h1> r_cnt : ${rvo.r_cnt}</h1>
		<h1> reg_date : ${rvo.reg_date}</h1>
	</body>
</html>