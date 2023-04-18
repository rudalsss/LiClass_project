<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 모달창 css -->
   <link rel="stylesheet" type = "text/css" href="/resources/review/css/modal.css" />
   <!-- 모달 디테일 css -->
   <link rel="stylesheet" type = "text/css" href="/resources/review/css/modalDetail.css" />
   <link rel="stylesheet" type = "text/css" href="/resources/review/css/screen.css" />
   <!-- 별 불러오는 js -->
   <script src='https://use.fontawesome.com/releases/v5.0.7/js/all.js'></script>
    <!-- 리뷰 css -->
   <link rel="stylesheet" type = "text/css" href="/resources/review/css/review.css" />

    <!-- 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap" rel="stylesheet">
    
    <!-- 검색창 css -->
    <link rel="stylesheet" type="text/css" href="/resources/review/css/reviewSearch.css">
    <script type = "type/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
    <script type="text/javascript" src="/resources/review/js/reviewList.js"></script>
   <script type="text/javascript">
      $(function(){
         var review_status = ${review_status}
         console.log(review_status);
         if(review_status == 0){
            console.log("성공");
            $('input[name=reviewStatus]').attr('value',"리뷰보기");
         }else{
            console.log("실패");
         }

     	
     	});
     	
     	
     	
     	

     </script>
<style>
   .table>tbody>tr>td{vertical-align: middle;}
   span{justify-content: center;
    	align-items: center;
    	display: flex;}
</style> 

<div class="thumb">
   <div class="row">
      <div class="left-text" style="width:90%;">
      <hr>
         <h2 class="center">수강 내역</h2><br><br>
         <%-- ==================== 리스트 시작 ==================== --%>
         <div id="paymentList" class="table-height">
            <table summary="결제내역 리스트" class="table table-hover">
               <thead>
                  <tr>
                     <th data-value="b_num" class="order text-center col-md-3">클래스정보</th>
                     <th class="text-center col-md-1">수강일자</th>
                     <th class="text-center col-md-1">난이도</th>
                     <th class="text-center col-md-3">주소</th>
                     <th class="text-center col-md-1">후기</th>
                  </tr>
               </thead>
               <tbody id="paymentList" class="table-striped">
               <!-- 데이터 출력 -->
               <c:choose>
                  <c:when test="${ not empty pvo_courseList }">
                     <c:forEach var="courseList" items="${ pvo_courseList }" varStatus="status">
                        <tr class="text-center" data-num="${ courseList.r_no }">
                           <td style="text-align:left;display:flex; vertical-align: middle;">
                              <img src="/uploadLiClass/class/thumbnail/${classImg[status.index].thumb_file}" style="margin-left:20px;width:100px;height:100px;object-fit:cover;overflow: revert;" alt="..." class="img-rounded">
                              <span style="padding-left:30px;">${ courseList.title }</span>
                           </td>                     
                           <td>${courseList.date }</td>
                           <td>${ courseList.level }</td>
                           <td>${ courseList.ct_addr },<br>${ courseList.ct_detail_addr }</td> 
                           
                           <c:if test="${courseList.count >= 0}">
                           		<td>수강예정</td>
                           </c:if>
                           
                           <c:if test="${courseList.count < 0 }">
	                           <c:if test="${courseList.review_status == 0}">
	                              <td data-cno="${ courseList.c_no }" data-rno="${courseList.r_no }" data-userno="${courseList.user_no }">
	                              	<input type="button" value="리뷰작성" name="reviewStatus" class="btn btn-dark insertFormBtn" style="margin:0">
	                              </td>
	                           </c:if>
	                           
	                           <c:if test="${courseList.review_status == 1 }">
	                              <td data-cno="${ courseList.c_no }" data-rno="${courseList.r_no }" data-userno="${courseList.user_no }">
	                                 <input id= "reviewDetailId"type="button" value="리뷰조회" class="btn btn-dark reviewDetail" style="margin:0">
	                              </td>
	                           </c:if>     
							</c:if>
							
                        </tr>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     <tr>
                        <td colspan="6" class="tac text-center">수강내역이 존재하지 않습니다.</td>
                     </tr>
                  </c:otherwise>
               </c:choose>
               </tbody>
            </table>
         </div>
         <%-- ==================== 리스트 종료 ==================== --%>
      </div>
   </div>
</div>

<!-- <form id = "detailForm"  target="iframe1">
   <input type = "hidden" id = "review_no" name="review_no" value = "" />
</form> -->

<!-- 리뷰 작성 폼 -->
<div id = "test1" style="display: none;">
   <%@ include file = "/WEB-INF/views/client/review/r_writeForm.jsp" %>
</div>
<!-- 리뷰 업데이트 폼 -->
<div id = "test2" style="display: none;">
   <%@ include file = "/WEB-INF/views/client/review/r_updateForm.jsp" %>
</div>
<!-- 리뷰 상세보기 폼 -->
<div id = "test3" style="display: none;">
   <%@ include file = "/WEB-INF/views/client/review/reviewDetail.jsp" %>
</div>