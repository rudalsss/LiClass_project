<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/include/css/successpay.css"/>

<script type="text/javascript">
	function goHome(){
		$("#goHome").click(function(){
			location.href="/";
		});
	}
	function goClass(){
		$("#goClass").click(function(){
			location.href="/class/classList";
		});
	}
</script>
</head>
<body>
	<div id="succhead"><span id="succ">결제완료</span></div>
    <!-- 주문완료 -->
    <div class="orderInfo">
    	<img src="https://us.123rf.com/450wm/happyroman/happyroman1112/happyroman111202088/11519831-%EB%B2%A1%ED%84%B0-%EA%B8%8D%EC%A0%95%EC%A0%81-%EC%9D%B8-%EC%B2%B4%ED%81%AC-%ED%91%9C%EC%8B%9C.jpg?ver=6" style="width:150px;height:150px;">
        <div>
	        <p>
	            <strong>고객님의 주문이 완료 되었습니다.</strong>
	            주문내역 및 배송에 관한 안내는 <a href="/mypage">마이페이지</a> 를 통하여 확인 가능합니다.
	        </p><br>
	        <ul>
	            <li>주문번호 : <strong>${pvo.merchant_uid }</strong></li>
	            <li>주문일자 : <span>${pvo.pay_date }</span></li>
	        </ul>
        </div>
    </div>
    <br><br>
	<div class="all">
		<div class="container">
			<div class="bordercss">
				<div>
					<div>
						<table class="table">
							<thead>
								<tr>
									<th>주문자 정보</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>이름</td>
									<td>${uvo.user_name }</td>
								</tr>
								<tr>
									<td>연락처</td>
									<td>${uvo.user_tel }</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>${uvo.user_email }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div>
						<table class="table midTable">
							<thead>
								<tr>
									<th>예약 정보</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>클래스 이름</td>
									<td>${rvo.c_title }</td>
								</tr>
								<tr>
									<td>예약일</td>
									<td>${rvo.r_date}</td>
								</tr>
								<tr>
									<td>예약인원</td>
									<td>${rvo.r_cnt }</td>
								</tr>	
								<tr>
									<td>클래스 가격</td>
									<td>${rvo.r_price}원</td>
								</tr>			
							</tbody>
						</table>
					</div>
					<div>
						<table class="table">
							<thead>
								<tr>
									<th>최종 결제 정보</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>상품 합계</td>
									<td>${rvo.r_price}원</td>
								</tr>
								<tr>
									<td>결제 수수료</td>
									<td>0원</td>
								</tr>
								<tr>
									<td>결제 수단</td>		
									<td>${pvo.pay_method }</td>
								</tr>
								<tr>
									<td>포인트 적립</td>		
									<td style="color:#58ACFA;"><strong>+ ${point}</strong>원</td>
								</tr>
								<tr>
									<td>사용 포인트</td>		
									<td>${pvo.pay_point } Point</td>
								</tr>		
								<tr>
									<td>최종 결제 금액</td>
									<td><strong>${rvo.r_price + pvo.pay_point}원 - ${pvo.pay_point }P </strong> = <span style="font-size:30px;text-decoration: underline;">${rvo.r_price}원</span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div style="text-align:center;">
			<button type="button" class="btn btn-dark" id="goHome" onclick="goHome()">홈으로</button>
			<button type="button" class="btn btn-dark" id="goClass" onclick="goClass()">클래스 계속보기</button>
		</div>
	</div>
</body>
</html>
