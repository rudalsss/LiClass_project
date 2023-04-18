<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 마이페이지 - 1. 첫화면 -->
<!--은아) 비밀번호 만료 알림 js,css  -->
<script src="/resources/client/mypage/assets/js/pwExp.js"></script>
<link rel="stylesheet" href="/resources/client/mypage/assets/css/pwExp.css" />
<!--은아) 마이페이지 js,css  -->
<link rel="stylesheet" href="/resources/client/mainTheme/css/main.css">
<link rel="stylesheet" href="/resources/client/mypage/assets/css/mypage.css">
<script>
	$(function(){
			/*은아)마이페이지 로딩 시 activePosition에 따라 보여질 시작메뉴 지정*/
			var activePosition = localStorage.getItem("activePosition");
			console.log("get activePosition : "+activePosition);
			
			if(typeof activePosition != "undefined" && activePosition != null && activePosition != ""){
				
			      if (!$(this).is("active")) {
			          $(".naccs .menu div").removeClass("active");
			          $(".naccs ul .mypageLi").removeClass("active");
			
			          $(this).addClass("active");
			          $(".naccs ul").find(".mypageLi:eq(" + activePosition + ")").addClass("active");
			          $(".naccs .menu").find(".point:eq(" + activePosition + ")").addClass("active");
			
			          var listItemHeight = $(".naccs ul")
			            .find(".mypageLi:eq(" + activePosition + ")")
			            .innerHeight();
			          $(".naccs ul").height(listItemHeight + "px");
			        }else{
			        	 
			        }
				}	
		
			/*은아) 비밀번호 만료시 알림*/ 	
			var pwOverExp = "${pwOverExp}" ;
			console.log("pwOverExp : "+pwOverExp);
			
			if(pwOverExp == 'Y'){
					var pwOverExp = getCookie('pwOverExp');
					console.log("pwOverExp : " +pwOverExp);
		            if (!pwOverExp) 
		                popUpAction('pwOverExp');
			}
			
			/*은아)마이페이지 첫화면에서만 */ 
			$(".go-active").click(function(){
				$('.main_notice_pop').fadeOut();
			});
				
			// 닫기버튼 클릭 이벤트 
	        $('.btn_close').click(function () {
	            $(this).parent('.main_notice_pop').fadeOut();

	            // 오늘하루 보지않기 체크 확인 
	            if ($("input:checkbox[name=today_close1]").is(":checked") == true) {
	                setCookie00('pwOverExp', "notoday", 1);
	            }

	            // name으로 해당 팝업창 닫기 
	            $(this).parent("div[name=" + name + "]").fadeOut();
	        });
			
		
			 /* 환불처리 되었을때 */
			if('${msg}' != ""){
				var msg = "${msg}";
				alert(msg);
			}
	});
</script>
	<div id="gotop"></div>
	<!--은아) 비밀번호 만료알림창  -->
	<!--password expiration alert modal start  -->
	<div class="main_notice_pop" name="pwOverExp" style="position:fixed; left:60%; top:25%; display:none; z-index:1;">
	    <div id="alert-popup" >
	    	<p><i class="fa-solid fa-bell" style="font-size: 16px;"></i>  비밀번호 변경일로부터 90일이 경과되었습니다.</p> 
	    	<p>소중한 개인정보를 보호하기 위해 안전한 <br/>비밀번호로 변경해 주세요.</p>
		    <label class="nottoday"><input type="checkbox" class="nottoday" name="today_close1"/> 오늘만 이 창을 열지 않음</label>
	    </div>         
	    <a href="#" class="btn_close"><i class="fa-solid fa-circle-xmark" style="font-size: 20px; color:white;"></i></a> <br> 
	</div> 
	<!--password expiration alert modal end  -->  
	
	<!--은아)마이페이지 좌측 메뉴 nav  -->
	<div class="popular-categories">
	    <div>
	      <div class="row">
		  <div class="popular-categories">
		       <div class="col-lg-12">
		         <div class="section-heading">
		         </div>
		       </div>
		       <div class="col-lg-12">
		         <div class="naccs">
		           <div class="grid">
		             <div class="row">
		               <div class="col-lg-3" style="margin-top : -49px;">
		                 <div class="menu">
		                   <div class="first-thumb active point" style="width:300px;max-width:300px;margin:0px;">
		                  	<div class="thumb">
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-01.png" alt=""></span>
		                       Profile
		                  	</div>
		                   </div>
		                   <div class="point" style="width:300px;max-width:300px;margin:0px;">
		                     <div class="thumb go-active">                 
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-03.png" alt=""></span>
		                       Payment
		                       <c:if test="${paymentCnt > 0}" >
			                       <span class="badge badge-primary badge-labeled">${paymentCnt}</span>
		                       </c:if>
		                     </div>
		                   </div>
		                   <div class="point" style="width:300px;max-width:300px;margin:0px;">
		                     <div class="thumb go-active">                 
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-05.png" alt=""></span>
		                       Review
		                       <c:if test="${reviewCnt > 0}" >
			                       <span class="badge badge-primary badge-labeled">${reviewCnt}</span>
		                       </c:if>
		                     </div>
		                   </div>
		                  <div class="point" style="width:300px;max-width:300px;margin:0px;">
		                     <div class="thumb go-active" id="myLikes">                 
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-04.png" alt=""></span>
		                       Likes
		                       <c:if test="${reviewCnt > 0}" >
			                       <span class="badge badge-primary badge-labeled">${likesCnt}</span>
		                       </c:if>
		                     </div>
		                   </div>
		                   <div class="point" style="width:300px;max-width:300px;margin:0px;">
		                     <div class="thumb go-active">                 
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-06.png" alt=""></span>
		                       Q&A
		                       <c:if test="${qnaCnt > 0}" >
		                       		<span class="badge badge-primary badge-labeled">${qnaCnt}</span>
		                       </c:if>
		                     </div>
		                   </div>
		                   <div class="last-thumb point go-active" style="width:300px;max-width:300px;margin:0px;">
		                     <div class="thumb">                 
		                       <span class="icon"><img class="icon-img" src="/resources/client/mypage/assets/images/search-icon-07.png" alt=""></span>
		                     	Post
		                     	<c:if test="${postCnt > 0}" >
		                       		<span class="badge badge-primary badge-labeled">${postCnt}</span>
		                       </c:if>
		                     </div>
		                   </div>
		                 </div>
		               </div> 
		           <!--은아)마이페이지 좌측 메뉴 nav  -->  
		            
	               <!-- 우측 탭메뉴 시작 -->
	               <div class="col-lg-9 align-self-center" style="top: -370px;">
	                 <ul class="nacc">
	                 	   <!-- 1. my profile start -->
	                   	   <li class="mypageLi active">
	                  			<%@ include file="/WEB-INF/views/client/mypage/myProfileHistory.jsp" %>
	                       </li>
	                       <!-- 1. my profile end -->
		                     
		                   <!-- 2. my payment start -->
		                   <li class="mypageLi">
		                     <%@ include file="/WEB-INF/views/client/mypage/myPaymentHistory.jsp" %>
		                   </li>
		                   <!-- 2. my payment end -->
		                   
		                   <!-- 3. my review start -->
		                   <li class="mypageLi">
                                <h4 class="subtitle-head">나의 후기</h4>
	                               	<div class="container" style="width: 970px;">
                            			<div class="row">
											<div class="col col-xs-12">
						                        <div class="blog-grids">
						                        	<c:choose>
													     <c:when test="${ not empty myReviewList }">
													           <c:forEach var="reviewVO" items="${myReviewList}" begin="0" end="2" >
										                            <div class="grid">
										                                <div class="entry-media">
										                                    <img src="/uploadLiClass/class/${reviewVO.class_img}" alt="" style="width=263px; height: 188px;">
										                                </div>
										                                <div class="entry-body">
										                                    <span class="cat">
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
																                 	<i class="fa-solid fa-star" ></i>
																                 	<i class="fa-solid fa-star" ></i>
																                 	<i class="fa-solid fa-star"></i>
																                 	<i class="fa-solid fa-star"></i>
																                 	<i class="fa-solid fa-star"></i>
																                </c:if>
										                                    </span>
										                                    <h3><a>
										                                    	<c:if test="${fn:length(reviewVO.review_title) > 20}">
																					${fn:substring(reviewVO.review_title, 0, 19)}...
																				</c:if>
																				<c:if test="${fn:length(reviewVO.review_title) < 21}">
																					${reviewVO.review_title}
																				</c:if>
										                                    </a></h3>
										                                    <p>
										                                    	 <c:if test="${fn:length(reviewVO.review_content) > 35}">
																					${fn:substring(reviewVO.review_content, 0, 34)}...
																				</c:if>
																				<c:if test="${fn:length(reviewVO.review_content) < 36}">
																					${reviewVO.review_content}
																				</c:if>
										                                    </p>
										                                    <div class="read-more-date">
										                                        <span class="date">${reviewVO.review_date}</span>
										                                    </div>
										                                </div>
										                            </div>
					                              			</c:forEach>
									        			</c:when>
									       		</c:choose>
				                            </div>
			                            </div>
	                           		</div>
	                           	</div>
	                            <c:if test="${ not empty myReviewList }">
							         <div class="col-lg-5">
	                               		 <div class="main-white-button"><a href="/mypage/myReviewHistory"  style="border: 1px solid #999; margin-top: 30px;"><i class="fa fa-eye"></i>자세히 보기</a></div>
							         </div>
							    </c:if>
							     <c:if test="${ empty myReviewList }">
							         <div class="col-lg-5">
	                               		 <div class="main-white-button"><a href="/courseHistory"><i class="fa-solid fa-money-check"></i>수강 내역</a></div>
							         </div>
							    </c:if>
		                   </li>
		                   <!-- 3. my review end -->
		                   <!-- 4. my likes start -->
		                    <li class="mypageLi">
		                    <div id="portfolio2">
		                       <div class="thumb">
		                         <div class="row">
		                           <div class="col-lg-12 align-self-center">
		                             <div class="left-text">
			                           	<h4>나의 관심클래스</h4>
		                                 <div class="container" style="width: 110%">
											<div class="row row-bottom-padded-md" style="padding-top: 3rem!important;padding-bottom: 3rem!important;">
												<c:choose>
									              <c:when test="${ not empty myLikesList }">
													<c:forEach var="likedClass" items="${myLikesList}"  begin="0" end="2" >
												      <div class="col-lg-4 col-md-4 portfolio-item" data-num="${likedClass.c_no }"> 
												      	<a class="portfolio-link" href="/class/classDetail?c_no=${likedClass.c_no }">
													        <div class="caption">
													          <div class="caption-content">
													            <h5>${likedClass.c_title}</h5>
													            <h6><i class="fa-solid fa-location-dot"></i>${likedClass.c_area}</h6>
													          </div>
													        </div>
													       	 <img src="/uploadLiClass/class/${likedClass.c_img_file}" class="img-responsive mylikes-img" alt="class-img">
												        </a>
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
										<c:if test="${ not empty myLikesList }">
									         <div class="col-lg-5">
			                               		 <div class="main-white-button"><a href="/mypage/myLikesHistory" style="border: 1px solid #999; margin-top: 30px;"><i class="fa fa-eye"></i>자세히 보기</a></div>
									         </div>
									    </c:if>
									    <c:if test="${ empty myLikesList }">
									         <div class="col-lg-5">
			                               		 <div class="main-white-button"><a href="/class/classList" style="border: 1px solid #999; margin-top: 30px;"><i class="fa-solid fa-person-walking"></i>클래스 구경가기</a></div>
									         </div>
									    </c:if>
		                             </div>
		                           </div>
		                         </div>
		                     	</div>
		                     </div>
		                   </li>
		                   <!-- 4. my likes end -->
		                   <!-- 5. my qna start -->
		                   <li class="mypageLi">
                                 <h4 class="subtitle-head">나의 문의</h4>
								    <div class="container">
                         				<div class="row">
											<div class="col col-xs-12">
						                        <div class="blog-grids">
						                        	 <c:choose>
							                     		<c:when test="${ not empty myQnaList }" >
							                        		<c:forEach var="qnaVO" items="${myQnaList}" begin="0" end="2"  varStatus="status">
										                            <div class="grid" style="height:250px;">
										                                <div class="entry-body">
										                                    <span class="cat">
											                                 <c:if  test="${qnaVO.qna_status != 1 }">
											                                  <span class="badge badge-primary badge-labeled" style="background-color: #08176aad; padding:6px;">답변완료</span>
											                                 </c:if>
											                                 <c:if  test="${qnaVO.qna_status == 1 }">
											                                 	<span class="badge badge-primary badge-labeled" style="background-color: #e48c8cf5; padding:6px;">답변대기</span>
											                                 </c:if>
										                                    </span>
										                                    <h3><a>
										                                    	<c:if test="${fn:length(qnaVO.qna_title) > 20}">
																					${fn:substring(qnaVO.qna_title, 0, 19)}...
																				</c:if>
																				<c:if test="${fn:length(qnaVO.qna_title) < 21}">
																					${qnaVO.qna_title}
																				</c:if>
										                                    </a></h3>
										                                    <p>
									                                    	   <c:if test="${fn:length(qnaVO.qna_content) > 30}">
																					${fn:substring(qnaVO.qna_content, 0, 29)}...
																				</c:if>
																				<c:if test="${fn:length(qnaVO.qna_content) < 31}">
																					${qnaVO.qna_content}
																				</c:if>
										                                    </p>
										                                    <div class="read-more-date">
										                                        <span class="date">${qnaVO.qna_date}</span>
										                                    </div>
										                                </div>
										                            </div>
					                              			</c:forEach>
									        			</c:when>
									        			 <c:otherwise>
													        <div class="services-content">
													          <h5> <i class="fa-solid fa-circle-question"></i>  문의내역이 존재하지 않습니다.</h5>
													        </div>
											             </c:otherwise>
									       		</c:choose>
				                            </div>
			                            </div>
	                           		</div>
	                           	</div>
							    <c:if test="${ not empty myReviewList }">
							         <div class="col-lg-5">
	                               		 <div class="main-white-button"><a href="/mypage/myQnAHistory" style="border: 1px solid #999; margin-top: 30px;"><i class="fa fa-eye"></i>자세히 보기</a></div>
							         </div>
							    </c:if>
							     <c:if test="${ empty myReviewList }">
							         <div class="col-lg-5">
	                               		 <div class="main-white-button"><a href="/client/qnaboard/qnaBoard" style="border: 1px solid #999; margin-top: 30px;"><i class="fa-solid fa-money-check"></i>문의 하기</a></div>
							         </div>
							    </c:if>
	                  	  </li>
	                  	  <!-- 5. my QnA end -->
	                  	  <!-- 6. my Post start -->
		                   <li class="mypageLi">
		                   		<div class="thumb">
		                          <div class="row">
		                            <div class="col-lg-12 align-self-center">
		                              <div class="left-text">
		                                <h4>나의 클래스 일지</h4>
								    	  <div class="container" style="width: 80%; margin:0px;">
									        <div class="row">
									            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
									            	 <c:choose>
									                     <c:when test="${ not empty myPostList }">
									                        <c:forEach var="postVO" items="${myPostList}" varStatus="status" begin="0" end="2">
												                <div class="post-preview" >
												                    <a>
												                        <h2 class="post-title">
												                           #${status.index+1} ${postVO.post_title}
												                        </h2>
												                    </a>
												                    <p class="post-meta">Posted by <a href="#"></a> ${postVO.post_regdate}</p>
												                </div>
												                <hr style="border-top: 1px solid #252323;">
									                   		</c:forEach>
									                	 </c:when>
									              </c:choose>
									            </div>
									        </div>
									    </div>
    									<c:if test="${ not empty myPostList }">
									         <div class="col-lg-5">
			                               		 <div class="main-white-button"><a href="/mypage/myPost" style="border: 1px solid #999; margin-top: 30px;"><i class="fa fa-eye"></i>자세히 보기</a></div>
									         </div>
									    </c:if>
									     <c:if test="${ empty myPostList }">
								           <div class="col-lg-5">
		                               	  	 <div class="main-white-button"><a href="/mypage/myPost" style="border: 1px solid #999; margin-top: 30px;"><i class="fa-solid fa-book-medical"></i> 클래스일지 작성하기</a></div>
								           </div>
									    </c:if>
		                              </div>
		                            </div>
		                          </div>
		                        </div>
	                  	   </li>
	                  	  <!-- 5. my Post end -->
	         		   </ul>
	               </div>    
	               <!-- 우측 탭메뉴 종료 --> 
	             </div>
	           </div>
	         </div>
	 		</div> 
		 </div>
	   </div>
	  </div>
	</div>
	<!-- -------------------------------------------------------------------------------- -->
	<!-- jQuery Modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />