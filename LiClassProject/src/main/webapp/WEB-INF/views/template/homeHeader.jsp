<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- 로고 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Shrikhand&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Racing+Sans+One&family=Shrikhand&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<style>

		#header{width: 100%;
		    margin: 0px;
		    padding : 29px 0;
		    }
		#navbar.navbar{ 
		    margin: 0px 0px 0px 400px;
		
		}
		#header.header-scrolled{padding : 20px 0;}

	</style>
	<!-- ======= Header ======= -->
			<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
			<script type="text/javascript">
				$(function(){
					let uri = "${requestScope['javax.servlet.forward.request_uri']}";
					$("li > a.menu").each(function(){
						$(this).removeClass("active");
						if( uri != '/' && $(this).attr('href').match(uri)){
							$(this).addClass("active");
						}
					});
				});
			</script>
			<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}"/>

        	<header id="header" class="fixed-top header-scrolled">
       	 		<div class="container d-flex align-items-center justify-content-between">
            		<h1 class="logo" ><a href="/" style="font-family: 'Fugaz One', cursive; font-size: 30px;">LiClass</a></h1>
			            <!-- Uncomment below if you prefer to use an image logo -->
			            <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			            <nav id="navbar" class="navbar">
			                <ul>
			                <li><a class="nav-link scrollto active header-menu" href="/">Home</a></li>
			                <li><a class="nav-link scrollto menu header-menu" href="/class/classList">Class</a></li>
			                <li><a class="nav-link scrollto menu header-menu" href="/studio/studioList">Studio</a></li>
			                <li><a class="nav-link scrollto menu header-menu" href="/client/qnaboard/qnaBoard">QnA</a></li>
			                <c:if test="${loginUser == null}">
			                	<li><a href="#gotop" class="nav-link scrollto" id="login-modal" style="color:white;">Login</a></li>
			                </c:if>
			                <c:if test="${loginUser != null}">
				                <c:if test="${loginUser.user_img != ''}">
				         			<c:choose>
						         		<c:when test="${loginUser.user_type eq 0}">
						         			<c:if test="${loginUser.user_img == 'default-profile.png'}">
								         			<a href="/mypage"><img id="profile-thumbnail" src="/resources/client/login/default-profile-black.png" alt="profile"/>${loginUser.user_name}님</a>
						         			</c:if>
						         			<c:if test="${loginUser.user_img != 'default-profile.png'}">
									         		<a href="/mypage"><img id="profile-thumbnail" src="/uploadLiClass/user/${loginUser.user_img}" />${loginUser.user_name}님</a>
						         			</c:if>
					         			</c:when>
					         			<c:otherwise>
							         		<a href="/mypage"><img id="profile-thumbnail" src="${loginUser.user_img}"/>${loginUser.user_name}님</a>
					         			</c:otherwise>
				         			</c:choose>
			         			</c:if>
				                <li><a class="nav-link scrollto" href="/user/logout">Logout</a></li>
			                </c:if>
			                </ul>
			            </nav><!-- .navbar -->
        		</div>
  			</header><!-- End Header -->

	<!-- login modal start -->
	<div id="login-pop-modal">
	   <div class="modal_content">
		<div class="wrap-login100">
			<button type="button" id="modal_close_btn" >X</button>
			<form class="login100-form validate-form" id="login-form">
				<span class="login100-form-title p-b-26">
				</span>
				<span class="login100-form-title p-b-48" style="font-family: 'Lalezar';">
					<i id="title">LICLASS</i>
				</span>
	
				<div class="wrap-input100 validate-input" data-validate = "Enter ID">
					<input class="input100" type="text" id="user_email" name="user_email" placeholder="이메일을 입력해주세요">
					<span data-placeholder="Email"></span>
				</div>
	
				<div class="wrap-input100 validate-input" data-validate="Enter password">
					<span class="btn-show-pass">
						<i class="zmdi zmdi-eye" id="title"></i>
					</span>
					<input class="input100" type="password" id="user_pw" name="user_pw" placeholder="영문자,숫자,특수문자포함 최소 8자" autocomplete="">
					<span data-placeholder="Password"></span>
				</div>
				<div class="container-login100-form-btn">
					<div class="col-lg-12 text-center">
					    <div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<a href="#login" class="login100-form-btn" id="login" style=" background-color: #555; a:hover:#dbcfd14d;">
								Login
							</a>
						</div>
					</div>
					<!-- 카카오 로그인 -->
			<div class="col-lg-12 text-center">
			    <div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn-kakao"></div>
					<a class="login100-form-btn" id="kakao-login" onclick="loginWithKakao()" style="color:white;">
						Kakao
					</a>
				</div>
			</div>
			<!-- 네이버 로그인 -->
			<div class="col-lg-12 text-center">
			    <div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn-naver"></div>
						<a class="login100-form-btn" id="naver-login" onclick="loginWithNaver()" style="color:white;">
										Naver
									</a>
							</div>
						</div>
						<div class="text-center p-t-60">
							<span class="txt0">
							간편로그인을 통한 신규가입의 경우 버튼을 누르면<br/>
							LiClass의 <a class="txt2" href="/user/userTerms">이용약관</a> 및 
							<a class="txt2" href="/user/userPolicy">개인정보 취급방침</a>에 동의하게 됩니다.
							</span>
						</div>
					</div>
					
					<div class="text-center p-t-30">
						<span class="txt1">
							아직 가입하지 않았나요?
						</span>
	
						<a class="txt2" href="/user/signupForm" >
							회원가입
						</a>
						<br/>
						<span class="txt1">
							비밀번호를 잊으셨나요?
						</span>
	
						<a class="txt2"  id="find-modal" href="/user/userFindpw">
							비밀번호 찾기
						</a>
					</div>
				</form>
			</div>
	    </div>
	    <div class="modal_layer"></div>
	</div>
	<!-- login modal end -->

