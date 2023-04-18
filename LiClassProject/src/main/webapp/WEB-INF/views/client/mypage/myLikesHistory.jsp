<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 은아) 마이페이지 4. 나의 관심클래스--%>	
<style>
	.mylikes-img{
		width:400px;
		height:250px;
		border-radius: 10px;
	}
	#portfolio2{
		width: 60%;
	    display: flex;
	    margin: auto;
	    padding-top: 50px;
	}
	.delete-likes{
		display: block;
   		text-align: right;
   		margin-top :10px;
	}
	.post-title{
		font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
    	font-weight: 800;
    	margin: 30px 0px; 
    	font-size: 28px;
	}
</style>
<script>
	$(function(){
		//은아)휴지통 클릭 시 관심클래스 삭제
		$(".delete-likes").click(function(){
			let c_no = $(this).parent(".portfolio-item").data("num");
			location.href="/mypage/delLikes?c_no="+c_no;
		});
	});
</script>
					<div id="portfolio2">
                       <div class="thumb">
                         <div class="row">
                           <div class="col-lg-13 align-self-center">
                             <div class="left-text">
                           		<h2 class="post-title text-center" style="">
					               My Likes
					            </h2>
                                 <div class="container" style="width: 110%">
									<div class="row row-bottom-padded-md">
										<c:choose>
							              <c:when test="${ not empty myLikesList }">
											<c:forEach var="likedClass" items="${myLikesList}">
										      <div class="col-lg-4 col-md-4 portfolio-item" data-num="${likedClass.c_no }"> 
										      	<a class="portfolio-link" href="/class/classDetail?c_no=${likedClass.c_no }">
											        <div class="caption">
											          <div class="caption-content">
											         	 <h6>
											          		<c:if test="${fn:length(likedClass.c_title) > 20}">
																${fn:substring(likedClass.c_title, 0, 19)}...
															</c:if>
															<c:if test="${fn:length(likedClass.c_title) < 21}">
																${likedClass.c_title}
															</c:if>
											            </h6>
											            <h6><i class="fa-solid fa-location-dot"></i>${likedClass.c_area}</h6>
											          </div>
											        </div>
											       	 <img src="/uploadLiClass/class/${likedClass.c_img_file}" class="img-responsive mylikes-img" alt="class-img">
										        </a>
	   									        <a class="delete-likes" style="cursor: pointer;"><i class="fa-solid fa-heart-circle-minus" style="color:#555; font-size: 16px;"></i></a>
									         </div>
											</c:forEach>
							              </c:when>
							              <c:otherwise>
										        <div class="services-content">
										          <h5> <i class="fa-solid fa-heart-circle-exclamation"></i>  관심클래스가 없습니다.</h5>
										        </div>
							              </c:otherwise>
							           </c:choose>
							      </div>
								</div>
                             </div>
                           </div>
                         </div>
                       </div>
                     </div>