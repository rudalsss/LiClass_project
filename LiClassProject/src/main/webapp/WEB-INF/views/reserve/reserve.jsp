<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="/resources/client/mainTheme/images/icons/favicon.ico" />
		<link rel="apple-touch-icon" href="/resources/client/mainTheme/images/icons/favicon.ico" />
		
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
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/reserve/js/reserve.js"></script>
		<script type="text/javascript">
			$(function(){
				let c_no = ${param.c_no};
				//-------1) 각 td에 온전한 날짜값을 부여--------//
				insertDate();											//1. 페이지 로딩과 동시에 insertDate 처리(1회)
				tdActive( c_no );
				$(".moveBtn").click(function(){ 		//2. 페이지 이동할때마다 td에 부여된 날짜 data-no를 reset해준다..(n회반복!)
					insertDate();
					tdActive( c_no );
				});
			});
		</script>
		<script type="text/javascript" src="/resources/reserve/js/reserve2.js"></script>
	</head>
	<body> 
		<%-- 클래스의 해당일자 회차정보들을 얻어오기 위한 폼 --%>
		<form id="epListOfDay">
			<input type="hidden" name="c_no" value="${param.c_no }">
			<input type="hidden" id="ep_date" name="ep_date"/>
		</form>
		 <%-- 예약 insert를 위한 폼 --%>
		<form id="reservFrm">
			<input type="hidden" name="r_no" id="r_no"/>
			<input type="hidden" name="user_no" value="${ loginUser.user_no }"/> 
			<%-- value="${ loginUser.user_no }" --%>
			<input type="hidden" name="ep_no" id="ep_no"/>
			<input type="hidden" name="c_title" id="c_title"/>
			<input type="hidden" name="r_date" id="r_date"/>
			<input type="hidden" name="r_price" id="r_price"/>
			<input type="hidden" name="r_cnt" id="r_cnt"/>
		</form>
		
		<section class="ftco-section">
			<div class="container">
				<div class="row" style="display:block;">
					<!-- <div class="col-md-12"> -->
					<div class="elegant-calencar d-md-flex">
					
				      <div class="calendar-wrap" style="background:#FDF5E6"><!-- 캘린더 부분 -->
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
						     <p id="reset" style="display: hidden">Today</p>
						     
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
								      <div class="accordion-body accordion-cnt" style="height: 60px">
								      	<div class="text-right" >
								      		<button type="button" class="btn btn-default minBtn rcntBtn">-</button>
								      		<input type="text" id="sample_cnt" name="sample_cnt" value="0" readonly="readonly" />
											<button type="button" class="btn btn-default plusBtn rcntBtn">+</button>
								     	</div>
								      </div>
								    </div>
								 </div><!-- accordion-item3  -->
								 
								 <div class="accordion-item"><!-- accordion-item4  -->
								 	<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
								    	<div class="accordion-body accordion-cnt" style="background-color: #FFE4B5;">
								      		<div class="text-right">
								      			<div id="reservtitle" style="font-size: 10px;color:#FF9364">제목</div>
								      			<div id="reservtime" style="font-size: 10px;color:#A4814;font-weight: bold">날짜, 시간</div>
								      			<div id="reservInfo" style="font-size: 14px;color:#5a5a5a;font-weight: bold">인원, 금액</div>
								      		</div>
								      		<br>
								      		<button>포인트사용</button><br>
								      		<button class="btn btn-lg btn-block payBtn" style="height: 40px">결제하기</button>
								 		</div>
								 	</div>
								 </div><!-- accordion-item4  -->
											
								
							</div><!-- 전체 accordionPanelsStayOpenExample 종료 -->
				      </div> <!-- wrap-header d-flex align-items-center img -->
				    </div>
					</div>
				</div>
			<!--</div>   -->
		</section>
		<script src="/resources/reserve/js/jquery.min.js"></script>
	  	<script src="/resources/reserve/js/popper.js"></script>
	  	<script src="/resources/reserve/js/bootstrap.min.js"></script>
	  	<script src="/resources/reserve/js/main.js"></script>
	</body>
</html>