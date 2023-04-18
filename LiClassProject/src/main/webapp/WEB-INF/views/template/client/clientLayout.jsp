<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%@ include file="/WEB-INF/views/client/client_common.jspf" %>
	
	<title>LiClass</title>
	<!-- 부트스트랩 -->
    <link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
	<!-- script -->
	<script type = "text/javascript" src = "/resources/include/js/jquery-3.6.2.min.js"></script>
	<script type = "text/javascript" src = "/resources/include/dist/js/bootstrap.min.js" /></script>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/resources/include/mainLayout/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/bootstrap-icons/bootstrap-icons.scss" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/glightbox/css/glightbox.css" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/resources/include/mainLayout/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <script src="/resources/include/mainLayout/js/main.js"></script>
    <script src="/resources/include/mainLayout/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Template Main CSS File -->
    <link href="/resources/include/mainLayout/css/style.css" rel="stylesheet">
    
     <!-- nav  -->
	<script src="/resources/client/mainTheme/js/floatingNav.js"></script>
	<link rel="stylesheet" href="/resources/client/mainTheme/css/floatingNav.css" />
		
  </head>
  <body id="gotop">
		<div class="header" style="height: 0;">
			<tiles:insertAttribute name="header" />
		</div>
		
		<body>
		  <div class="clientLayout">
		   		<tiles:insertAttribute name="body" />
		  </div>
		</body>
		
		 <nav class="nav">
	    	<tiles:insertAttribute name="nav" />
	    </nav>
		
		<footer class="footer py-3 my-4">
	      <ul class="nav justify-content-center border-bottom pb-3 mb-3">
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


<!-- 하단 script 끝==============================================================================================-->
	</body>
</html>
