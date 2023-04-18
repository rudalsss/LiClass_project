<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/client/mainTheme/js/bootstrap.affix.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
#header{width: 100%;
    margin: 0px;
    padding : 29px 0;
    }
#navbar.navbar{margin: 0px 0px 0px 400px;}
#header.header-scrolled{padding : 20px 0;}
</style>
<script>

	$(function(){
		//은아) activePosition 초기화
		localStorage.removeItem("activePosition")
		
		//은아)메인화면 redirect 시 전달메시지 있을 때
		if('${message}' != ""){
			var message = "${message}" ;
			alert(message);
		}
		
		//웅배)메인화면 redirect 시 전달메시지 있을 때
		if( '${errormsg}' != ""){
			var message = "${errormsg}" ;
			Swal.fire({
			      icon: 'warning',
			      confirmButtonColor: '#EA9A56',
			      title: message
				});
		}
		
		if('${payerrormsg}' != ""){
			var message = "${payerrormsg}" ;
			Swal.fire({
			      icon: 'warning',
			      confirmButtonColor: '#EA9A56',
			      title: message
				});
		}
	})
</script>
 <body id="page-top" data-spy="scroll" data-target=".side-menu">
	<div class="video-background"></div>
    	<div id="vidtop-content">
        	
		    <!-- ======= Hero Section ======= -->
		    <section id="hero">
			    <div class="video-container">
			        <iframe width="560" height="315" src="https://www.youtube.com/embed/DNf6mIZz6Zo?controls=0&autoplay=1&mute=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			    </div>      
		  	</section><!-- End Hero -->
			
			<!-- ======= About Section ======= -->
			<section id="about" class="about">
			    <div class="container">
			      <div class="section-title">
			        <h2>About</h2>
			        <h3>Learn More <span>About Us</span></h3>
			        <p>안녕하세요. LiClass 입니다. 저희 LiCLass는 전국 각지에 있는 여러가지 원데이 클래스를  
			            확인하고 수강할 수 있는 플랫폼 입니다.</p>
			      </div>
			
			      <div class="row content">
			        <div class="col-lg-6">
			          <p>
			            누구나 원하는 취미 여가를 쉽고 당연하게 즐길 수 있도록, 
						사람과 사람을 연결하고 공예, 요리, 미술, 플라워, 뷰티, 여행 등
						세상을 더 경험할 수 있도록 도와주는 서비스 플랫폼 LiClass.
			          </p>
			          <ul>
			            <li><i class="ri-check-double-line"></i> LiClass에서 당신의 취미를 찾아보세요.</li>
			            <li><i class="ri-check-double-line"></i> 이제부터 낭만 가득한 추억을 만들어볼까요?</li>
			            <li><i class="ri-check-double-line"></i> LiClass를 통해 지친 일상 속에서 활력을 찾고 일상을 바꾸는 경험을 하시기를 응원합니다.</li>
			          </ul>
			        </div>
			        <div class="col-lg-6 pt-4 pt-lg-0">
			          <p>
						다양한 카테고리의 재밌고 색다른 클래스
			            LiClass의 다양한 수업들을 단체클래스로 편하게 즐겨보실 수 있어요.
			            LiClass로 색다른 행사를 시작해요.
			          </p>
			          <a href="/class/classList" class="btn-learn-more">클래스 구경하러가기</a>
			        </div>
			      </div>
			    </div>
			  </section><!-- End About Section! -->


 
			  <!-- ======= F.A.Q Section ======= -->
			  <section id="faq" class="faq">
			    <div class="container">
			      <div class="section-title">
			        <h2>F.A.Q</h2>
			        <h3>Frequently Asked <span>Questions</span></h3>
			      </div>
			      <ul class="faq-list">
			        <li>
			          <div data-bs-toggle="collapse" href="#faq6" class="collapsed question">후기 작성은 어디서 하나요 ?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq6" class="collapse" data-bs-parent=".faq-list" style="visibility: inherit;">
			            <p>
			              로그인 -> 마이페이지 -> 나의 후기에서 작성할 수 있습니다.
			            </p>
			          </div>
			        </li>

			        <li>
			          <div data-bs-toggle="collapse" class="collapsed question" href="#faq1"> 예약 완료 후 수강내역은 어디서 확인 하나요 ?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq1" class="collapse" data-bs-parent=".faq-list" style="visibility: inherit;">
			            <p>
			              마이페이지 -> 프로필 -> 수강내역에서 확인하실 수 있습니다.<br>
			              (리뷰는 수강내역에서 작성하실 수 있습니다.)
			            </p>
			          </div>
			        </li>
			
			        <li>
			          <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">환불 절차가 궁금합니다 !<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq2" class="collapse" data-bs-parent=".faq-list" style="visibility: inherit;">
			            <p>
			              마이페이지 -> 결제내역에서 원하시는 클래스를 환불하실 수 있습니다.<br>
			              (결제 후 7일이 지나면 환불이 불가합니다.)
			            </p>
			          </div>
			        </li>
			
			        <li>
			          <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">비밀번호를 모르면 어떻게 해야하나요 ? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq3" class="collapse" data-bs-parent=".faq-list" style="visibility: inherit;">
			            <p>
			              이메일 로그인 방법을 가입하셨으면, 로그인 화면에서 재설정 가능합니다.
			            </p>
			          </div>
			        </li>
			
			        
			        <li>
			          <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">클래스 양도 가능한가요 ?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
			          <div id="faq5" class="collapse" data-bs-parent=".faq-list" style="visibility: inherit;">
			            <p>
			              클래스 양도는 불가하며 불필요시 절차에 따라 환불하실 수 있습니다.
			            </p>
			          </div>
			        </li>
			      </ul>
			    </div>
			  </section><!-- End F.A.Q Section -->

			  <!-- ======= Team Section ======= -->
			  <section id="team" class="team">
			    <div class="container">
			      <div class="section-title">
			        <h2>Team</h2>
			        <h3>LiClass <span>Team</span></h3>
			        <p>LiClass member introduction</p>
			      </div>
			
			      <div class="row">
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/ea.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href="https://instagram.com/euuuuunaaaaa?igshid=YmMyMTA2M2Y="><i class="bi bi-instagram"></i></a>
			                <a href="https://github.com/kimeunazip"><i class="fa-brands fa-github"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>김은아</h4>
			              <span>팀장</span>
			  
			            </div>
			          </div>
			        </div>
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/sy.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href="https://www.instagram.com/sy07222/"><i class="bi bi-instagram"></i></a>
			                <a href="https://github.com/wjdthdud13"><i class="fa-brands fa-github"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>정소영</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/ms.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href=""><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>문민섭</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/ob.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href=""><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>전웅배</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/km.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href="https://instagram.com/lerudals__?igshid=YmMyMTA2M2Y="><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>이경민</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			
			        <div class="col-lg-2 col-md-6 d-flex align-items-stretch">
			          <div class="member">
			            <div class="member-img">
			              <img src="/resources/images/Team/jm.png" class="img-fluid" alt="">
			              <div class="social">
			                <a href=""><i class="bi bi-twitter"></i></a>
			                <a href=""><i class="bi bi-facebook"></i></a>
			                <a href=""><i class="bi bi-instagram"></i></a>
			                <a href=""><i class="bi bi-linkedin"></i></a>
			              </div>
			            </div>
			            <div class="member-info">
			              <h4>임지민</h4>
			              <span>조원</span>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </section><!-- End Team Section -->
    	</div>