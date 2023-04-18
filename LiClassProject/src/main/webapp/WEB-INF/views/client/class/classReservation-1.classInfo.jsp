<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<%-- 은아) 클래스 상세페이지 예약네비1. 클래스정보 --%>	
<style>
	#sns-share-div{
	display:flex;
	justify-content:left;
	visibility:hidden; 
	margin: 10px;
	}
</style>
<script>

	//right nav
	var quick_menu = $('#sticky-nav');
	var quick_top = 160;
	
	quick_menu.css('top', $(window).height() );
	$(document).ready(function(){
	quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 160 ); 
	$(window).scroll(function(){
	quick_menu.stop();
	quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 500 );
	});
	});
	
	$(function(){
		var c_no = "${clientClassDetail.c_no}";
		var user_no = $("#user-info").data("num");
		
		//하트 클릭
		 $(".like").click(function(){
			var likeId = $(this).attr("id");
			console.log(likeId);
			if(likeId == "loginLike"){
				Swal.fire({
				      icon: 'warning',
				      confirmButtonColor: '#EA9A56',
				      title: '로그인후 이용해주세요'
				});
			}else if(likeId == "addLike"){
				console.log(likeId);
				$.ajax({
					type : "POST",
					url : "/addLikes",
			        data: {
						c_no : c_no,
						user_no : user_no
					},
					success : function(result){
						if(result == 1){
							Swal.fire({
 							      icon: 'success',
 							      confirmButtonColor: '#64CD3C',
 							      title: '관심클래스에 추가되었습니다!'
							});
						}else{
							Swal.fire({
							      icon: 'warning',
							      confirmButtonColor: '#EA9A56',
							      title: '잠시후 다시 이용해주세요.'
							});
						} 
						document.location.reload();
					}
				 });
			}else if(likeId == "delLike"){
				Swal.fire({
					   title : "관심클래스에서 삭제하시겠습니까?",
					   //text: "관심클래스에서 삭제하시겠습니까?",
					   icon: 'question',
					   showCancelButton: true, 
					   confirmButtonColor: 'skyblue', 
					   cancelButtonColor: '#8c8c8c', 
					   confirmButtonText: 'yes', 
					   cancelButtonText: 'no', 
					   reverseButtons: false 
					}).then(result => {
						console.log(likeId);
						$.ajax({
							type : "POST",
							url : "/delLikes",
					        data: {
					        	c_no : c_no,
								user_no : user_no
							},
							success : function(result){
								if(result == 1){
									Swal.fire({
		 							      icon: 'success',
		 							      confirmButtonColor: '#64CD3C',
		 							      title: '관심클래스에서 삭제되었습니다!'
									});
								}else{
									Swal.fire({
									      icon: 'warning',
									      confirmButtonColor: '#EA9A56',
									      title: '잠시후 다시 이용해주세요.'
									});
								} 
								document.location.reload();
							}
						 }); //ajax종료
					}); //화살표함수 종료
				} //if종료
			});//하트클릭  
		
		//공유하기
		$("#sns-share-btn").click(function(){
			let shareCss = $("#sns-share-div").css("visibility");
			if(shareCss == "hidden"){
				$("#sns-share-div").css("visibility","visible");
			}else{
				$("#sns-share-div").css("visibility","hidden");
			}
		});
	});

</script>
		<input type="hidden" id="class-info" data-num="${clientClassDetail.c_no }" />
		<input type="hidden" id="user-info" data-num="${loginUser.user_no }" />
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
            <h6>
            	<i class="fa-solid fa-hashtag"></i>
		      	<c:if test = "${clientClassDetail.c_category eq 0}">
					공예
				</c:if>
		     	<c:if test = "${clientClassDetail.c_category eq 1}">
					요리
				</c:if>
				<c:if test = "${clientClassDetail.c_category eq 2}">
					미술
				</c:if>
				<c:if test = "${clientClassDetail.c_category eq 3}">
					플라워
				</c:if>
				<c:if test = "${clientClassDetail.c_category eq 4}">
					뷰티
				</c:if>
				<c:if test = "${clientClassDetail.c_category eq 5}">
					체험 및 기타
				</c:if>
			</h6>
        </div>
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <h6><i class="fa-solid fa-map-location-dot" style = "color: cadetblue;"></i> ${clientClassDetail.c_area}</h6>
        </div>
        <div class="class-content" data-num="${clientClassDetail.c_no}" style="margin-bottom: 10px;">
      	<h3 style="font-weight: bold;">${clientClassDetail.c_title}</h3>
      	</div>
      	
      	<table id = "reserveModalTable" style="background-color: #f2f2f2;">
      		<tr class = "trtr">
      			<th class = "thth">난이도</th>
      			<th class = "thth">소요시간</th>
      			<th class = "thth">최대인원</th>
      		</tr>
      		
      		<tr  class = "trtr">
      			<th class = "tdtd">${clientClassDetail.c_level}</th>
      			<th class = "tdtd">${clientClassDetail.c_leadtime} 시간</th>
      			<th class = "tdtd">${clientClassDetail.c_maxcnt} 명</th>
      		</tr>
      		
      	
      	
      	</table>
      	
      	<!-- 4. 관심클래스,공유하기 -->
	      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="text-align: left;">
		      <c:if test="${loginUser == null}">
		      		<button type="button" class="main-white-button like" id="loginLike" style="margin: 0px 5px;">
						<i class="fa-solid fa-heart-circle-plus" style="margin:0px 5px;"></i>  ${clientClassDetail.c_luv}
					</button>
		      </c:if>
		      <c:if test="${loginUser != null}">
				<c:if test="${checkResult eq 1}">
					<button type="button" class="main-white-button like" id="delLike" style="margin: 0px 5px;">
						<i class="fa-solid fa-heart-circle-check" style="color:#f96868e6;" ></i>  ${clientClassDetail.c_luv}
					</button>
				</c:if>
				<c:if test="${checkResult eq 0}">
					<button type="button" class="main-white-button like" id="addLike" style="margin: 0px 5px;">
						<i class="fa-solid fa-heart-circle-plus"></i>  ${clientClassDetail.c_luv}
					</button>
				</c:if>
				</c:if>
				<a id="sns-share-btn" style="margin: 0px 20px;">
              		<label class="control-label required" for="type"><i class="fa-solid fa-share-nodes"></i></label>
              	</a>
		  </div>
      	
      	
	
       
         <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" id="sns-share-div">
              <div class="form-group" style="margin:5px 0px; float: right;">
              	<a id="kakao-link-btn" href="javascript:kakaoShare()" style="margin: 0px 20px;"><i class="fa-solid fa-comment" style="color:#FAE64D;"></i></a>
				<a id="twitter-link-btn" href="javascript:shareTwitter()" style="margin: 0px 20px;"><i class="fa-brands fa-twitter"></i></a>
				<a id="facebook-link-btn" href="javascript:shareFacebook()" style="margin: 0px 20px;"><i class="fa-brands fa-facebook-f" style="color:#415893;"></i></a>
				<a id="naver-link-btn" href="javascript:shareNaver()" style="margin: 0px 20px;"><i class="fa-solid fa-n" style="color:#5ECC69;"></i></a>
				<a id="copy-btn" href="javascript:copy()"><i class="fa-solid fa-link" style="color:#555; margin: 0px 20px;"></i></a>
              </div>
         </div>
          