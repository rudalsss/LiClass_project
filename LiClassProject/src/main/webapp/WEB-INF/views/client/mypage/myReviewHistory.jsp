<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%-- 은아) 마이페이지 3. 나의 후기 --%>	
<style>
	.headline-h4{
		color: #555;
	    font-size: 20px;
	    font-weight: 700;
	    line-height: 35px;
	    margin-bottom: 30px;
	}
	.post-title{
		font-size: 28px;
	}
	.pager .next>a:hover {
		background-color: #191919;
		border:#191919;
		color:white;
	}
	.post-meta{
		margin:0px;
	}
	.pager{
		margin:0px;
	}
</style>
<!-- Theme CSS -->
<link href="/resources/client/mypage/mypost/css/clean-blog.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/client/mypage/mypost/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- Main Content -->
    <div class="container">
        <div class="row">
       	 	<h2 class="post-title text-center" style="margin: 50px 0px;">
               My Review
            </h2>
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
            	 <c:choose>
                     <c:when test="${ not empty myReviewList }">
                        <c:forEach var="reviewVO" items="${myReviewList}"  varStatus="status">
			                <div class="post-preview">
			                    <a>
			                        <h2 class="post-title">
			                           #${status.index+1} ${reviewVO.review_title}
			                        </h2>
			                        <h4 class="post-subtitle">
			                           <span style="padding-left:30px;" class="review__content">
		                               		${fn:replace(reviewVO.review_content, replaceChar, "<br/>")}
		                               </span>
			                        </h4>
			                        <h4 class="post-subtitle">
			                            <c:if test="${reviewVO.review_rating eq 1}">
			                             	 <i class="fa-solid fa-star" ></i>
		                              	</c:if>
		                              	<c:if test="${reviewVO.review_rating eq 2}">
			                              	<i class="fa-solid fa-star"></i>
			                              	<i class="fa-solid fa-star"></i>
		                              	</c:if>
		                              	<c:if test="${reviewVO.review_rating eq 3}">
			                              	<i class="fa-solid fa-star"></i>
			                              	<i class="fa-solid fa-star"></i>
			                              	<i class="fa-solid fa-star"></i>
		                              	</c:if>
		                              	<c:if test="${reviewVO.review_rating eq 4}">
			                              	<i class="fa-solid fa-star"></i>
			                              	<i class="fa-solid fa-star"></i>
			                              	<i class="fa-solid fa-star"></i>
			                              	<i class="fa-solid fa-star"></i>
		                              	</c:if>
		                              	<c:if test="${reviewVO.review_rating eq 5}">
			                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
			                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
			                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
			                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
			                              	<i class="fa-solid fa-star" style="font-size: 10px;"></i>
		                              	</c:if>
			                        </h4>
			                        
			                    </a>
			                    <p class="post-meta">Posted by <a href="#"></a> ${reviewVO.review_date}</p>
			                </div>
			                 <ul class="pager">
			                    <li class="next">
			                        <a href="/class/classDetail?c_no=${reviewVO.c_no}">클래스 상세보기</a>
			                    </li>
			                </ul>
			                <hr>
                   		</c:forEach>
                	 </c:when>
              </c:choose>
                <!-- Pager -->
               
            </div>
        </div>
    </div>

    <hr>

    <!-- Contact Form JavaScript -->
    <script src="/resources/client/mypage/mypost/js/jqBootstrapValidation.js"></script>
    <script src="/resources/client/mypage/mypost/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="/resources/client/mypage/mypost/js/clean-blog.min.js"></script>