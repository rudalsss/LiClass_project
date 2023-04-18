<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;500&family=Racing+Sans+One&family=Shrikhand&display=swap" rel="stylesheet">
<link src = "/resources/include/mainLayout/vendor/bootstrap-icons/bootstrap-icons.css">
<% pageContext.setAttribute("replaceChar", "\n"); %>
<style>
	.bi-star-fill{
	margin : -40px 6px 0 0;
	}
</style>
<script>
</script>
	
	<!--클래스 리스트 시작-->
   	<div class="col mb-5" style="height: 380px;">
   		<div class="card h-100"> 
			<!-- 클래스 이미지 -->
	        <div >
	         		<c:if test="${not empty classes.c_img_file}">
	         			<div style="position: absolute; width: -webkit-fill-available;" class="card-footer p-4 pt-0 border-top-0 bg-transparent right_area text-center heart" data-num="${classes.c_no}">
							 <a href="javascript:;" class="icon heart atag-heart" data-num="${classes.c_no}">
			   					<img src="/resources/images/heartwhite.png" alt="찜하기" style="width: 20px; height: 20px;  position: relative; float: right;margin-top: 10px; opacity: 0.8;">
			  				 </a>
			 			</div>     
	         			<div >
	         				<img class="card-img-top" src="/uploadLiClass/class/${classes.c_img_file}" style="width: 100%; height: 219px;"/>
	         			</div>
	         		</c:if>
	         		<c:if test="${empty classes.c_img_file}">
	         			<img src="/resources/images/notfound.png" style="width: 250px; height: 200px;">
	         		</c:if>
	        </div> 
            <!-- 클래스 정보 -->
            <div class="card-body p-4" style="margin-top: 5px;">
            	<div class="text-center">
                  <!-- 클래스 명 -->
                  <span class="fw-bolder goClassDetail" data-num="${classes.c_no}" style="font-size: 14px; font-family: 'Noto Serif KR', serif;">
                  ${fn:replace(classes.c_title, replaceChar, "<br/>")}
                  </span>
                  <div class = "classContent" style="font-family: 'Noto Serif KR', serif;">${classes.c_content}</div>
              	</div>
              	
              	
           </div>
           <!-- Product reviews-->
           <div class="d-flex justify-content-center small text-warning mb-2" style="font-size: initial;">
	           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
					<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
	 		   </svg>
	           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
					<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
	 		   </svg>
	 		   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
					<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
	 		   </svg>
	 		   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
					<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
	 		   </svg>
	 		   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
					<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
	 		   </svg>
           </div>
           <!-- 찜하기 하트 -->
            
                  
   		</div>
	</div>
 		