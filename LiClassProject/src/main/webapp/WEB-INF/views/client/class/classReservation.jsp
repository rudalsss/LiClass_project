<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--클래스 상세페이지 우측 예약네비 --%>	
<!-- 부트스트랩 -->
<link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
<script type = "text/javascript" src ="/resources/include/dist/js/bootstrap.min.js"></script>
<!-- 제이쿼리 -->
<script type = "text/javascript" src = "/resources/include/js/jquery-3.6.2.min.js"></script>

<!-- calendar07.. -->
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
<!-- bootstrap 4.7.0 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootstrap 5.1 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/reserve/css/style.css">
<link rel="stylesheet" href="/resources/reserve/css/reserve.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style type="text/css">
	#collapseOne, #collapseTwo, #collapseThree, #collapseFour, #collapseFive{
		visibility: visible;
	}
	#header.header-scrolled {
    padding: 20px 0;
    z-index: 1;
}
</style>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
<script type="text/javascript" src="/resources/reserve/js/reserve.js"></script>
<script type="text/javascript">
	$(function(){
		/*모달 열리기전 로그인여부 체크체크 */
		$('a[href="#reserve-modal"]').click(function(e) {
			  //console.log("로그인내역 : " + "${loginUser.user_no }" );
		      e.preventDefault();
		  
			  if( '${loginUser.user_no }' == "" ){
				Swal.fire({
				      icon: 'warning',
				      confirmButtonColor: '#EA9A56',
				      title: '로그인후 이용해주세요'
				});
		    	 $(this).attr('rel', 'modal:close');
		      }  else {
		    	$(this).attr('rel', 'modal:open');
		      }
		});
		
		$("#CloseBtn").click(function(){
			Swal.fire({
			      icon: 'info',
			      confirmButtonColor: '#5ACCFF',
			      title: '예약진행이 취소되었습니다.',
			      text: '다시 이용해주세요.'
			});
					
			//모달 모두 reset
			$("#reservFrm > *").val("");
			let user_no = '${ loginUser.user_no }';
			$("#user_no").val('${ loginUser.user_no }');
			$(".part1").text("날짜를 선택해주세요.");
			$("#collapseTwo").removeClass("show");
			$("#collapseThree").removeClass("show");
			$("#collapseFour").removeClass("show");
			$("#collapseFive").removeClass("show");

			$("#insertpoint").val("");
			$("input[name=insertpoint]").attr("value",0);
			$("#pointspan").html( '${uservo.user_point}');
			$("input[name=insertpoint]").attr("readonly",false);
			$("#pointok").attr("disabled",false).css("backgroundColor","#333333");
			
		});
		
		
		let c_no = ${param.c_no};
		//-------1) 각 td에 온전한 날짜값을 부여--------//
		insertDate();											//1. 페이지 로딩과 동시에 insertDate 처리(1회)
		tdActive( c_no );
		$(".moveBtn").click(function(){ 		//2. 페이지 이동할때마다 td에 부여된 날짜 data-no를 reset해준다..(n회반복!)
			insertDate();
			tdActive( c_no );
		});
		
		//------2) 각 td 클릭시 해당날짜의 예약정보조회------//
		$("td").click(function(){
			
			$(".episodeBox").detach(); //이전에 만들어 놓았던 것들 다 없애버림
			
			//폼완성
			let clickDate = $(this).attr("data-no");
			$("#ep_date").val(clickDate);
			
			//폼전송 -> 해당날짜의 회차리스트(json) 받음
			$.ajax({
				url : "/admin/episode/epListOfDay",
				type : "post",
				dataType : "json",
				data : $("#epListOfDay").serialize(),
				error : function(xhr, textStatus, errorThrown){		
					alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
				},
				success : function(data){
					$(data).each(function(){
						let ep_no = this.ep_no;
						let ep_price = this.ep_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원";
						let ep_date = this.ep_date;
						let ep_cnt = this.ep_cnt;
						let ep_reserveState = this.ep_state1;
						let c_maxcnt = this.c_maxcnt;
						let c_endtime = this.c_endtime;
						let until_cnt = this.c_maxcnt - this.ep_cnt;
						//part1에 날짜 출력
						let day = ep_date.substring( 0, ep_date.indexOf(')')+1 );
						$(".part1").html(day);
						//part2에 회차box 출력
						templateEp( ep_no, ep_reserveState, ep_date, ep_price, ep_cnt, c_maxcnt, c_endtime, until_cnt  );
					});
				}
			}); //ajax의 종료
			$("#collapseTwo").addClass("show");
			$("button[data-bs-target='#collapseTwo']").removeClass("accordion-button collapsed").addClass("accordion-button");
			$("button[data-bs-target='#collapseTwo']").attr("aria-expanded", "true");
			
			//선택한 ep의 초기화
			$("#ep_no").val(""); 
			$("#reservtitle").html(""); 
			$("#reservtime").html("시간을 먼저 선택해주세요."); 
			$("#reservInfo").html("");
			$("#sample_cnt").val(0);
			
			$("#insertpoint").val("");
			$("input[name=insertpoint]").attr("value",0);
			$("#pointspan").html( '${uservo.user_point}');
			$("input[name=insertpoint]").attr("readonly",false);
			$("#pointok").attr("disabled",false).css("backgroundColor","#333333");
			
		}); //td클릭시

		///------3) 인원수 카운터
		$(".plusBtn").click(function(){
			let cnt = $(".checkEp").attr('data-code');
			CalCount('p', this, cnt);
		});
		$(".minBtn").click(function(){
			let cnt = $(".checkEp").attr('data-code');
			CalCount('m', this, cnt);
		});
		
		//------4) 각 episodeBox 클릭(=하나의 단독회차선택) => 폼만들기
		let ep_price = 0;
		$(document).on("click", ".episodeBox",function(){
			$("#r_cnt").val(0); //비정상흐름 제어
			$("#sample_cnt").val(0);
			// 인원선택, 결제선택 부분 오픈
			$("#collapseThree").addClass("show");
			$("#collapseFour").addClass("show");
			$("#collapseFive").addClass("show");
			$("button[data-bs-target='#collapseThree']").removeClass("accordion-button collapsed").addClass("accordion-button");
			$("button[data-bs-target='#collapseThree']").attr("aria-expanded", "true");
			$("button[data-bs-target='#collapseFour']").removeClass("accordion-button collapsed").addClass("accordion-button");
			$("button[data-bs-target='#collapseFour']").attr("aria-expanded", "true");
			
			/* 클래스 checkEp ::: 선택된 episodeBox로 
			    이 클래스를 가진 유일한 episodeBox의 정보가 폼에 입력 & reservtitle, reservtime, reservinfo에 출력 */
			$(".episodeBox").removeClass("checkEp");  //기존의 모든 episodeBox에서 제거
			$(this).addClass("checkEp")	;								//클릭된 곳에 유일하게 부여
			
			//해당 에피소드의 데이터를 가져오기 위함
			let ep_no = $(this).attr("data-num");
			$("#ep_no").val( ep_no );											// 1-- 폼에 ep번호입력
			
			//이를 이용해 episode의 정보를 가져옴 & 예약 폼 만들기
			
			$.ajax({
				url : "/admin/episode/epReserve?ep_no="+$("#ep_no").val(),
				type : "get",
				dataType : "json",
				error : function(xhr, textStatus, errorThrown){		
					alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
				},
				success : function(data){
					$("#c_title").val(data.c_title);					// 3-- 폼에 ep제목입력
					$("#r_date").val(data.ep_date);				// 4-- 폼에 ep날짜 & 시간입력
					ep_price = data.ep_price;

					let r_price = data.ep_price * Number($("#r_cnt").val());
					$("#r_price").val( r_price );  // 5--폼에 연산된 가격입력(비정상흐름 : 인원선택-> ep변경)
					console.log("에피소드박스 눌렀을때 r_price = "+r_price);
					
					//###정보출력변환###
					$("#reservtitle").html(data.c_title); 
					$("#reservtime").html(data.ep_date); 
					$("#reservInfo").html($("#r_cnt").val()+"명 ");

					$("#reservInfo").append( r_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원" );
					
					$("#insertpoint").val("");
					$("input[name=insertpoint]").attr("value",0);
					$("#pointspan").html( '${uservo.user_point}');
					$("input[name=insertpoint]").attr("readonly",false);
					$("#pointok").attr("disabled",false).css("backgroundColor","#333333");
				}
			}); //ajax의 종료
			
			
		}); //episodeBox의 클릭이벤트
		
		$(".rcntBtn").click(function(){
			if($("#ep_no").val()==""){
				Swal.fire({
				      icon: 'warning',
				      confirmButtonColor: '#EA9A56',
				      title: '시간을 먼저 선택해주세요'
				});
				return;
			} else {
				$("#r_cnt").val( $("#sample_cnt").val() );				// 2--폼에 cnt 입력
				$("#r_price").val( ep_price * Number($("#r_cnt").val()) );	// 4--폼에 연산된 가격입력(정상흐름 : ep선택-> 인원선택)
			
				//###정보출력변환###
				$("#reservtitle").html($("#c_title").val()); 
				$("#reservtime").html($("#r_date").val()); 
				$("#reservInfo").html($("#r_cnt").val()+"명 ");			
				$("#reservInfo").append( $("#r_price").val().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원" );
				
				//예외흐름 제어
				$("#insertpoint").val("");
				$("input[name=insertpoint]").attr("value",0);
				$("#pointspan").html( '${uservo.user_point}');
				$("input[name=insertpoint]").attr("readonly",false);
				$("#pointok").attr("disabled",false).css("backgroundColor","#333333");
				
				/* 웅배 포인트 적립파트 
				var price = $("#r_price").val()-$("input[name=insertpoint]").val();
				
				if($("#insertpoint").val()!=""){
					if(price < 0){
						price = "0";
						$("#reservInfo").append(price)+"원";
						$("#r_price").val( price );
					}else{
						$("#reservInfo").append(price)+"원";
						$("#r_price").val( price );
						//console.log($("#r_price").val());
						console.log("금액 - 포인트 : "+price);
					}
				}else{
					$("#reservInfo").append( $("#r_price").val().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원" );
					console.log("포인트 없을때 금액 : "+$("#r_price").val());
				}
				*/
			}
		});
		
		$(document).on("click", ".payBtn", function(){
			if( $("#ep_no").val()=="" ){
				Swal.fire({
				      icon: 'warning',
				      confirmButtonColor: '#EA9A56',
				      title: '시간을 선택해주세요'
				});
				return;
			} else if( $("#r_cnt").val()==0 ){
				Swal.fire({
				      icon: 'warning',
				      confirmButtonColor: '#EA9A56',
				      title: '인원수를 선택해주세요'
				});
				return;
			} else {
				Swal.fire({
					   title : '예약내역을 확인해주세요. \n결제를 진행하시겠습니까?',
					   text: $("#r_date").val()+" "+$("#r_cnt").val()+"명   "+$("#r_price").val()+"원",
					   icon: 'success',
					   showCancelButton: true, 
					   confirmButtonColor: '#64CD3C', 
					   cancelButtonColor: '#8c8c8c', 
					   confirmButtonText: 'yes', 
					   cancelButtonText: 'no', 
					   reverseButtons: false 
					}).then(result => {
					   // 만약 Promise리턴을 받으면,
					   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
						   	 var today = new Date();
					         var hours = today.getHours(); // 시
					         var minutes = today.getMinutes();  // 분
					         var seconds = today.getSeconds();  // 초
					         var milliseconds = today.getMilliseconds();
					         var makeMerchantUid = hours*13 *  minutes - seconds + milliseconds;
					         console.log(makeMerchantUid);
					        /* if($("#insertpoint").val()==""){
									$("#insertpoint").val(0);
									console.log($("#insertpoint").val());
									//$("input[name=usepoint]").attr("value",insertpoint);
								}*/
					         $("#r_no").val(makeMerchantUid);
					         $("#reservFrm").attr({
					        	   "method":"post",
					        	   "action":"/client/reserve/makeReserve"
					           });
					           $("#reservFrm").submit();
					   }
					});
			}
		});//결제버튼 클릭 종료
		
		/* 웅배 :: 포인트 적용 버튼 이벤트 */
		$("#pointok").click(function(){
			if( $("#ep_no").val()=="" ){
				Swal.fire({
				      icon: 'warning',
				      confirmButtonColor: '#EA9A56',
				      title: '시간을 먼저 선택해주세요'
				});
				return;
			} else if( $("#r_cnt").val()==0 ){
				Swal.fire({
				      icon: 'warning',
				      confirmButtonColor: '#EA9A56',
				      title: '인원수를 먼저 선택해주세요'
				});
				return;
			} else {
				var point = '${uservo.user_point}';
				var price = $("#r_price").val();
				var insertpoint = Number($("#insertpoint").val());
				var pointspan = $("#pointspan").val();
				var pointprice = $("#r_price").val()-$("input[name=insertpoint]").val();
				
				if(insertpoint==""){
					Swal.fire({
					      icon: 'info',
					      confirmButtonColor: '#5ACCFF',
					      title: '사용할 포인트를 입력해주세요.'
					});
					$("#insertpoint").focus();
					return;
				}else if(point < insertpoint){ // 보유포인트가 입력한 포인트보다 적을때
					Swal.fire({
					      icon: 'info',
					      confirmButtonColor: '#5ACCFF',
					      title: '보유 포인트를 확인하시고 \n다시 입력해주세요.'
					});
					$("#insertpoint").val("");
					return;
				}else if(price < insertpoint){ // 금액이 입력한 포인트보다 적을때
					Swal.fire({
					      icon: 'info',
					      confirmButtonColor: '#5ACCFF',
					      title: '입력하신 포인트가 금액보다 높습니다. \n다시 입력해주세요.'
					});
					$("#insertpoint").val("");
					console.log("dd"+$("#r_price").val());
					return;
				}else{
					if($("#insertpoint").val()!=""){
						if(point >= price){
							var point2 = point - insertpoint;
							$("input[name=insertpoint]").attr("value",price);
							$("#pointspan").html(point2);
							$("input[name=usepoint]").attr("value",price);
						}else{
							var point2 = point - insertpoint;
							$("input[name=insertpoint]").attr("value",insertpoint);
							$("#pointspan").html(point2);
							$("input[name=usepoint]").attr("value",insertpoint);
						}
						//$("#pointspan").val(point-pointspan);
						
						//$("#reservInfo").html("");
						$("#reservInfo").html($("#r_cnt").val()+"명 ");
						$("#reservInfo").append(pointprice+"원");
						//$("#reservInfo").append(price)+"원";
						$("#r_price").val( pointprice );
						
						Swal.fire({
						      icon: 'success',
						      confirmButtonColor: '#64CD3C',
						      title: "적용되었습니다. \n페이지를 새로고침하면 \n초기화됩니다."
						});
						$("input[name=insertpoint]").attr("readonly","readonly");
						$("#pointok").attr("disabled","disabled").css("backgroundColor","#A4A4A4");
						
						console.log(insertpoint);
						if(insertpoint != 0){
							$("input[name=usepoint]").attr("value",insertpoint);
						}
					}
				}
			}
		}); //포인트 버튼 클릭 종료
	}); //최상위$
</script>

<%--  cloudflare --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type = "text/css" href="/resources/client/classDetail/css/classReservaion_modal.css" />
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script> --%>

<%-- 클래스의 해당일자 회차정보들을 얻어오기 위한 폼 --%>
<form id="epListOfDay">
	<input type="hidden" name="c_no" value="${param.c_no }">
	<input type="hidden" id="ep_date" name="ep_date"/>
</form>
<%-- 예약 insert를 위한 폼 --%>
<form id="reservFrm">
	<input type="hidden" name="r_no" id="r_no"/>
	<input type="hidden" name="user_no" value="${ loginUser.user_no }"/> 
	<input type="hidden" name="ep_no" id="ep_no"/>
	<input type="hidden" name="c_title" id="c_title"/>
	<input type="hidden" name="r_date" id="r_date"/>
	<input type="hidden" name="r_price" id="r_price"/>
	<input type="hidden" name="r_cnt" id="r_cnt"/>
	<input type="hidden" name="usepoint" id="usepoint" value=""/>
</form>	

<script src="/resources/reserve/js/jquery.min.js"></script>
 <script src="/resources/reserve/js/popper.js"></script>
 <script src="/resources/reserve/js/bootstrap.min.js"></script>
 <script src="/resources/reserve/js/main.js"></script>

<!-- episode Box 
<div  id="ep_template">
	<table>
		<tr>
			<td colspan="6" class="text-left epdate">오전 00:00 ~ 오전 00:30</td>
		</tr>
		<tr>
			<td colspan="4" class="text-left"><span class="eprice">0원</span></td>
			<td colspan="2" class="text-right"><span class="nowcnt">0</span>/<span class="maxcnt">0</span></td>
		</tr>
	</table>
</div>-->
<!-- episode Box -->

		<div class="row" style="width:430px;">
             <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30">
                 <div class="class-booking-form" style="    box-shadow: 8px 8px 7px 1px gainsboro;" >
                     <form>
                         <div class="row">
                         <h1></h1>
	                       	<!--1. class info start --> 
	                          	<%@ include file="/WEB-INF/views/client/class/classReservation-1.classInfo.jsp" %>
	                        <!--1. class info end --> 
	                            
	                         <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="display: flex; justify-content: center;">
	        			 	 <!-- 예약버튼 -->
	        			 	 <a href="#reserve-modal" rel="modal:open" style="width: -webkit-fill-available;">
	                         <button type="button" class="button-41" style="width: -webkit-fill-available; background-color: #555;">
	                         		<span style="font-size: 15px; color: white;">예약하기</span>
	                               <!--  <a href="#reserve-modal" rel="modal:open"><i class="fa-regular fa-hand-point-up"></i>예약하기</a> -->
	                          </button></a>
						
							 <%--  reserve modal start   --%>
							<div class="modal" id="reserve-modal" style="z-index: 2; position: relative; text-align: center; height: 100%; width:800px;
							 
							 overflow:hidden; left:auto; padding: 0px; background:rgb(0, 0, 0, 0); box-shadow: none;">	
								<div style="width:100%;height:100%">
								
								<div style="position: relative;
								    top: 80px;
								    background-color: #F0B469;

								    width: 700px;
								    margin-left: 50px;
								    padding: 10px;
								    height: 60px;
    								border-radius: 10px;">
									<h2  style="font-color:	#646464; display: inline;padding: 50px 30px 0 0;	color: white; font-weight: bold;text-align: center">LiClass Reservation</h2>
								    	<a id = "CloseBtn" rel="modal:close">
								    	<button type="button" class="btn-close" aria-label="Close" style="display: inline; float: right;  margin-top: 5px;  margin-right: 5px;"></button>
								    	</a>
								</div>
					
					
					<div class="elegant-calencar d-md-flex" style="margin: 70px auto;">
				      <div class="calendar-wrap" style="background:#FDF5E6;box-shadow:none;"><!-- 캘린더 부분 -->
				      	<div class="w-100 button-wrap">
					      	<div class="pre-button d-flex align-items-center justify-content-center disabled moveBtn"><i class="fa fa-chevron-left"></i></div>
					      	<div class="print-month" style="font-size:15px;color:#5a5a5;font-weight:bold"></div> 
					      	<div class="next-button d-flex align-items-center justify-content-center moveBtn"><i class="fa fa-chevron-right"></i></div>
				      	</div>
				        <table id="calendar">
			            <thead>
			                <tr>
		                    <th>일</th>
		                    <th>월</th>
		                    <th>화</th>
		                    <th>수</th>
		                    <th>목</th>
		                    <th>금</th>
		                    <th>토</th>
			                </tr>
			            </thead>
			            <tbody>
		                <tr>
		                  <td style="background:#FDF5E6"></td>
		                  <td style="background:#FDF5E6"></td>
		                  <td style="background:#FDF5E6"></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
		                <tr>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                  <td></td>
		                </tr>
			            </tbody>
				        </table>
				        <div class="text-right" >
				        	<span style="color:#DB631F;font-size:15px"><i class="fa fa-circle" aria-hidden="true"></i></span>
				        	<span style="color:#5a5a5a;font-size:10px">현재날짜</span>&nbsp;
				      		<span style="color:#FAD79B;font-size:15px"><i class="fa fa-stop" aria-hidden="true"></i></span>
				      		<span style="color:#5a5a5a;font-size:10px">예약가능</span>
				        </div>
				      </div><!-- 캘린더 부분 -->
				      
				      <%--============================================================================= --%>
				      
				      <div class="wrap-header d-flex align-items-center img" style="background:#FAEBCD">
						     
						     <div class="accordion" id="accordionPanelsStayOpenExample"><!-- accordion 시작 -->
						     
								 <div class="accordion-item"> <!-- accordion-item1  -->
								    <h5 class="accordion-header" id="panelsStayOpen-headingOne" style="width:238px">
								      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded=true aria-controls="collapseOne">
								        <span class="acbtnName">날짜</span>
								      </button>
								    </h5>
								    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								      <div class="accordion-body accordion-date">
								        <div class="part1 text-center">날짜를 선택해주세요.</div>
								      </div>
								    </div>
								  </div>										<!-- accordion-item1  -->
								 
								 <div class="accordion-item"><!-- accordion-item2  -->
								    <h5 class="accordion-header" id="headingTwo">
								      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								        <span class="acbtnName">시간선택</span>
								      </button>
								    </h5>
								    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
								      <div class="accordion-body" id="accordion-time">
											
											<div id="episodeList">
												<!-- episode Box -->
										        <div  id="ep_template">
										        	<table>
										        		<tr>
										        			<td colspan="6" class="text-left epdate">오전 00:00 ~ 오전 00:30</td>
										        		</tr>
										        		<tr>
										        			<td colspan="4" class="text-left"><span class="eprice">0원</span></td>
										        			<td colspan="2" class="text-right"><span class="nowcnt">0</span>/<span class="maxcnt">0</span></td>
										        		</tr>
										        	</table>
										        </div>
										       <!-- episode Box -->
									       </div>
									       
								      </div>
								    </div> 
								</div>											<!-- accordion-item2  -->
								
								<div class="accordion-item"><!-- accordion-item3  -->
								    <h5 class="accordion-header" id="headingThree">
								      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								       <span class="acbtnName">인원선택</span>
								      </button>
								    </h5>
								    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
								      <div class="accordion-body accordion-cnt" style="height: 50px">
								      	<div class="text-right" >
								      		<button type="button" class="btn btn-default minBtn rcntBtn" style="margin: 0px">-</button>
								      		<input type="text" id="sample_cnt" name="sample_cnt" value="0" readonly="readonly" />
											<button type="button" class="btn btn-default plusBtn rcntBtn" style="margin: 0px">+</button>
								     	</div>
								      </div>
								    </div>
								 </div><!-- accordion-item3  -->
								 
								 <div class="accordion-item"><!-- accordion-item4  -->
								 	<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
								    	<div class="accordion-body accordion-info" style="background-color: #FFE4B5;">
								      		<div class="text-right">
								      			<div id="reservtitle" style="font-size: 10px;color:#FF9364">제목</div>
								      			<div id="reservtime" style="font-size: 10px;color:#A4814;padding:3px">날짜, 시간</div>
								      			<div id="reservInfo" style="font-size: 16px;color:#5a5a5a;font-weight: bold">인원, 금액</div>
								      		</div>
								 	</div>
								 </div><!-- accordion-item4  -->
								 
								 <div class="accordion-item"><!-- accordion-item5  -->
								    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
								      <div class="accordion-body accordion-point" style="height: 80px">
								      	<div>
								      		<span style="font-size: 13px; float: left; margin-bottom: 5px; font-weight: bolder;">포인트 적용&nbsp;&nbsp;&nbsp;</span>
								      		
								      		<span id="pointspan" style="font-size:8px; float: right;  margin-bottom: 5px; color : #CC0000;"> ${uservo.user_point }&nbsp;P</span>
								      		<span style="font-size:8px; float: right;  margin-bottom: 5px; color : #CC0000">잔여 포인트&nbsp;&nbsp;</span>
								      		<div style="margin-top: 12px;">
								      		<input type="text" name="insertpoint" id="insertpoint" value="" style="width: 65%; height: 30%; border-radius: 5px;border: 1px solid gainsboro;">&nbsp;P
								      			
								      			<button type="button" id="pointok" style="background-color:#333;border-radius:5px; width: 20%;  margin-left : 15px; color : white;">
								      				<span style="font-size:10px;">사용</span>
								      			</button>
								      		</div>
								      	
								      	</div>
								      </div>
								    </div>
								 </div>
								    <button class="btn btn-lg btn-block payBtn" style="height: 40px;margin-top:0px">결제하기</button>
								 </div><!-- accordion-item5  -->
								 
							</div><!-- 전체 accordionPanelsStayOpenExample 종료 -->
				      </div> <!-- wrap-header d-flex align-items-center img -->
					</div>
					</div>

							 </div>
							 <!-- reserve modal end --> 
							 
	                         </div>
                         </div>
                   </form>
         		</div>
			</div>
</div>



