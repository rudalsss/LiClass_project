<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%@ include file="/WEB-INF/views/client/client_common.jspf" %>

<%-- 은아) 마이페이지 전용 레이아웃 --%>
	<title>LiClass :: My page</title>
	
	<!-- mypage -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
   	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
   	<link rel="stylesheet" href="/resources/client/mainTheme/css/bootstrap.min.css" >
    <link rel="stylesheet" href="/resources/client/mypage/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/client/mypage/assets/css/templatemo-plot-listing.css">
    <link rel="stylesheet" href="/resources/client/mypage/assets/css/animated.css">
    <link rel="stylesheet" href="/resources/client/mypage/assets/css/owl.css">
    
    <!-- nav  -->
	<script src="/resources/client/mainTheme/js/floatingNav.js"></script>
	<link rel="stylesheet" href="/resources/client/mainTheme/css/floatingNav.css" />
	<style>
		/*은아) footer-contentLayout과 상이한 부분 맞추기  */
		.mypage-nav{
			--bs-nav-link-padding-x: 1rem;
		    --bs-nav-link-padding-y: 0.5rem;
		    --bs-nav-link-font-weight: ;
		    --bs-nav-link-color: var(--bs-link-color);
		    --bs-nav-link-hover-color: var(--bs-link-hover-color);
		    --bs-nav-link-disabled-color: #6c757d;
		    display: flex;
		    flex-wrap: wrap;
		    padding-left: 0;
		    margin-bottom: 0;
		    list-style: none;
	        margin-top: 0;
	        margin: 0px;
	        height: 50px;
		}
		.nav-item{
			font-size: 10px;
		}
		.mypageLayout{
			min-height: 100%;
		    position: relative;
		    padding-bottom: 60px;
		}
		/***************************************** */
	</style>
  	</head>
  	<body>
  		<div>
			<header class="header" style="height: 0;">
				<tiles:insertAttribute name="header" />
			</header>
		
			<div class="mypageLayout" style="margin-top: 100px;">
			   		<tiles:insertAttribute name="body" />
			</div>
			
		    <nav class="nav">
		    	<tiles:insertAttribute name="nav" />
		    </nav>
   		</div>

   		<footer class="footer" style="margin-bottom:30%;">
			      <ul class="mypage-nav nav justify-content-center border-bottom pb-3 mb-3">
			        	<tiles:insertAttribute name="footer" />
			      </ul>
			      <p class="text-center text-muted">© 2022 Company, Kh정보교육원</p>
		</footer>
<!-- 하단 script 시작==============================================================================================-->
	<!-- login --> 
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/client/login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/client/login/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/client/login/js/login.js"></script>
		
	<!-- mypage -->
 	<!-- <script src="/resources/client/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<script src="/resources/client/mypage/vendor/jquery/jquery.min.js"></script>
 	<script src="/resources/client/mypage/assets/js/owl-carousel.js"></script>
 	<script src="/resources/client/mypage/assets/js/animation.js"></script>
 	<script src="/resources/client/mypage/assets/js/imagesloaded.js"></script>
 	<script src="/resources/client/mypage/assets/js/custom.js"></script>

<!-- 하단 script 끝==============================================================================================-->

	</body>
</html>
