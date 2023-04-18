<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 모달창 css -->
<link rel="stylesheet" type = "text/css" href="/resources/review/css/modal.css" />
<!-- 모달 디테일 css -->
<link rel="stylesheet" type = "text/css" href="/resources/review/css/modalDetail.css" />
<link rel="stylesheet" type = "text/css" href="/resources/review/css/screen.css" />
<!-- 별 불러오는 js -->
<script src='https://use.fontawesome.com/releases/v5.0.7/js/all.js'></script>
   <!-- 리뷰 css -->
<link rel="stylesheet" type = "text/css" href="/resources/review/css/review.css" />
<!-- 검색창 css -->
<link rel="stylesheet" type="text/css" href="/resources/review/css/reviewSearch.css">
<script type = "type/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
<script type="text/javascript" src="/resources/review/js/reviewList.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type = "text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
<!-- script -->
<script type = "text/javascript" src = "/resources/include/js/jquery-3.6.2.min.js"></script>
<script type = "text/javascript" src = "/resources/include/dist/js/bootstrap.min.js" /></script>

<style>
	.custom-cursor-default-hover{ margin-top: 15px;}
</style>

<form id = "detailForm">
	<input type = "hidden" name ="review_no" id = "review_no" value = "review_no" />
</form>
<script type="text/javascript">

    $(function(){
    	localStorage.setItem("key", 3);
    	
    	
    	
    	var ratingTotal = ${tongRating.RATING1} + ${tongRating.RATING2} + ${tongRating.RATING3} + ${tongRating.RATING4} + ${tongRating.RATING5}
    	$("#ratingTotal").text("(" + ratingTotal + ")");
    	
    	var ratingAvg1 = Math.ceil(${tongRating.RATING1} / ratingTotal *1000);
    	var ratingAvg2 = Math.ceil(${tongRating.RATING2} / ratingTotal *1000);
    	var ratingAvg3 = Math.ceil(${tongRating.RATING3} / ratingTotal *1000);
    	var ratingAvg4 = Math.ceil(${tongRating.RATING4} / ratingTotal *1000);
    	var ratingAvg5 = Math.ceil(${tongRating.RATING5} / ratingTotal *1000);
    	
    	$("#bar1").width(ratingAvg1);
    	$("#bar2").width(ratingAvg2);
    	$("#bar3").width(ratingAvg3);
    	$("#bar4").width(ratingAvg4);
    	$("#bar5").width(ratingAvg5);
    	
    });
    
    
    </script>
		
							
	<!-- 별점 통계 start -->
  	<div class="container">
	    <div class="row" style="justify-content: left;">
	      <div class="col-md-13 course-details-content" style="margin-left: -15px;">
	        <div class="course-details-card mt--40">
	          <div class="course-content">
	            <h5 class="mb--20">Review</h5>
	            <!-- 별점 -->
	            <div class="row row--30">
	              <div class="col-lg-4" style="position: static;">
	                <div class="rating-box" style="height: 100%; padding-top: 80px;">
	                  <div class="rating-number">${ratingAvg}</div>
	                  <span id = "ratingTotal">전체 후기 개수</span></div>
	              </div>
	              <div class="col-lg-8">
	                <div class="review-wrapper">
	                  <div class="single-progress-bar">
	                    <div class="rating-text"> 5 <i class="fa fa-star" aria-hidden="true"></i> </div>
	                    <h3>${review}</h3>
		                    <!-- 통계바 -->
		                    <div class="progress">
	                    			<div id = "bar5" class="progress-bar" role="progressbar" style="width:0%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	                  		</div>
	                  		<span class="rating-value">${tongRating.RATING5}</span> </div>
		   
	                 
		                  	<div class="single-progress-bar">
		                    	<div class="rating-text"> 4 <i class="fa fa-star" aria-hidden="true"></i> </div>
		                    	<div class="progress">
		                      		<div id = "bar4" class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
		                    	</div>
		                   		<span class="rating-value">${tongRating.RATING4}</span>
		                   	</div>
			                <div class="single-progress-bar">
			                    <div class="rating-text"> 3 <i class="fa fa-star" aria-hidden="true"></i> </div>
			                    <div class="progress">
			                      <div id = "bar3"  class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
			                    </div>
			                    <span class="rating-value">${tongRating.RATING3}</span> </div>
		                  	<div class="single-progress-bar">
		                    	<div class="rating-text"> 2 <i class="fa fa-star" aria-hidden="true"></i> </div>
		                    	<div class="progress">
		                      		<div id = "bar2"  class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
		                   		</div>
	                    		<span class="rating-value">${tongRating.RATING2}</span> </div>
		                  	<div class="single-progress-bar">
		                    	<div class="rating-text"> 1 <i class="fa fa-star" aria-hidden="true"></i> </div>
		                    	<div class="progress">
		                      		<div id = "bar1"  class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="80" aria-valuemax="100"></div>
		                    	</div>
		                    	<span class="rating-value">${tongRating.RATING1}</span> </div>
		                </div>
	              </div>
            </div>
            <!-- 별점 통계 end -->
       
            
            
            <!-- 검색창 -->
            
             <div class="container-fluid" style="margin-top:30px;">
			    <form name = "review_search" id = "review_search">
			    	<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
 					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<input type="hidden" name="c_no" value = "${clientClassDetail.c_no}">
			    <div id = "searchDiv" style="display: inline-flex;">
					<select id="search" name="search"  class="form-control col">
						<option value="all">전체</option>
						<option value="review_title">제목</option>
						<option value="review_content">내용</option>
					</select>
					<input id = "keyword" name = "keyword" class="form-control me-2" type="text" placeholder="Contents Search...." aria-label="Search" style="width: 70%;">
					<button id = "searchData" class="btn btn-dark col" type="button">Search</button>
				</div>

			    </form>
			  </div>
		

			

	         <!--  댓글창 -->
	         <div class="comment-wrapper pt--40">
	         <c:choose>
				<c:when test="${not empty reviewList}" >
					<c:forEach var="review" items="${reviewList}" varStatus="status">
		              <div class="edu-comment" data-num="${review.review_no}" id = "tttest">
		              <form id = "detailForm">
						<input type = "hidden" id = "review_no" value = "${review.review_no}" />
						</form>
		              	
		              	<%-- ================== 상세버튼 시작 =============
		              	<button class = "test3" type = "button">상세보기 버튼</button> --%>
		              	<%-- ================== 상세버튼 종료 ============= --%>
		                <div class="thumbnail"><img src="/uploadLiClass/user/${review.user_img}"></div>
		                <div class="comment-content" style="margin-top: 15px;">
		                  <div class="comment-top" style="display: contents;">
		                   	<div>
		                    <h6 class="title" id = "title" style="color: #555; margin-left: -9px;">"&nbsp${review.review_title}&nbsp"</h6>
		                    </div>
		                
		                    
			                    <!-- 댓글창 별점 -->
			                    <c:set var = "rating" value = "${review.review_rating}"/>	 
			                    <c:if test="${rating eq 1}">
		                    		<div class="rating">
				                    	<i class="fas fa-star" aria-hidden="true"></i>
				                    	<i class="fas fa-star" aria-hidden="true"></i>
				                    	<i class="fas fa-star" aria-hidden="true"></i>
				                    	<i class="fas fa-star" aria-hidden="true"></i> 
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
		
				                    </div> 	
		                    	</c:if>
			                    
		                    	
		                    	<c:if test="${rating eq 2}">
		                    		<div class="rating">
				                    	<i class="fas fa-star" aria-hidden="true"></i>
				                    	<i class="fas fa-star" aria-hidden="true"></i>
				                    	<i class="fas fa-star" aria-hidden="true"></i> 
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				
				                    </div> 	
		                    	</c:if>
		                    	
		                    	
		                    	<c:if test="${rating eq 3}">
		                    		<div class="rating">
				                    	<i class="fas fa-star" aria-hidden="true"></i>
				                    	<i class="fas fa-star" aria-hidden="true"></i> 
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				  
				                    </div> 	
		                    	</c:if>

		                    	<c:if test="${rating eq 4}">
		                    		<div class="rating">
		                    			<i class="fas fa-star" aria-hidden="true"></i> 
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
		
				                    </div> 	
		                    	</c:if>
		                    	
		                    	
		                    	<c:if test="${rating eq 5}">
		                    		<div class="rating">
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i>
				                    	<i class="fas fa-star" aria-hidden="true" id = "colorStar"></i> 
				                    
				                    </div> 	
		                    	</c:if>
		                  
		                    
		                  </div>
		                  <div style="margin-bottom: 5px;">
		                  	<p>${review.review_name}</p>
		                  </div>
		                  <div id = "review_content" name = "review_content">${review.review_content}</div>
		                  <P></P>
		                  <p style="font-size: 0px;">친구에게 추천하시겠습니까? &nbsp   ${review.review_recommend}</p>
		                  <div style="float: right;">
		                  	<span style="font-size: 13px; color: #999;">${review.user_name}</span>&nbsp
		                  	<span style="font-size: 10px; color: #9999;">${review.review_date}</span>
		                  </div>
		                </div>
		                
		                
	
		              </div>
	              </c:forEach>
	          	</c:when>
	          	<c:otherwise>
	          		<!--등록된 글이 없을 경우 -->
					<div style="margin-left: 40px;">등록된 게시글이 존재하지 않습니다.</div>
				</c:otherwise>
	          </c:choose>
	          <!-- Comment Box end--->
	          
	            <%-- ============== 페이징 출력 시작 =========== --%>
			 <div class="text-center">
				<ul class="pagination" style="justify-content: center;">
				<c:if test="${pageMaker.prev}">
				 	<li class="paginate_button">
				 		<a href="${pageMaker.startPage -1}" class = "page-link">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				 	<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
				 		<a href="${num}" class = "page-link">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next">
						<a href="${pageMaker.endPage +1 }" class = "page-link">Next</a>
					</li>
				</c:if> 
				</ul>
			 </div> 
	 		<%-- ============== 페이징 출력 종료 ============= --%>
			  </div>
       		</div>
   		</div>
	  </div>
	</div>
 </div>