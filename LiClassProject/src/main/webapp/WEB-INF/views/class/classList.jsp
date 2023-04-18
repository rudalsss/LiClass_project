<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
		<script src="/resources/include/js/html5shiv.js"></script>
		<script src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script src="/resources/include/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
		
		<!-- Google Fonts -->
		<link href="https://fonts.gstatic.com" rel="preconnect">
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
		<!-- Vendor CSS Files :::::: assets를 /resources/admin로 변경--> 
		<link href="/resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/admin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="/resources/admin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
		<link href="/resources/admin/vendor/quill/quill.snow.css" rel="stylesheet">
		<link href="/resources/admin//vendor/quill/quill.bubble.css" rel="stylesheet">
		<link href="/resources/admin/vendor/remixicon/remixicon.css" rel="stylesheet">
		<link href="/resources/admin/vendor/simple-datatables/style.css" rel="stylesheet">
		<!-- Template Main CSS File -->
		<link href="/resources/admin/css/style.css" rel="stylesheet">
		<!-- =======================================================
		* Template Name: NiceAdmin - v2.5.0
		* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
		* Author: BootstrapMade.com
		* License: https://bootstrapmade.com/license/
		======================================================== -->
	<style>
	.goDetail{
		cursor: pointer;
	}
	</style>
	<script type="text/javascript">
		$(function() {
			/**************************상세화면*********************************/ 
			$(".goDetail").click(function(){
    			let num = $(this).parents("tr").attr("data-num");
    			console.log(num);
    			location.href="/admin/class/classDetail?c_no="+num;
			});
			$("#insertBtn").click(function(){
				location.href="/admin/class/writeForm";
			});
			/*****************************검색*********************************/ 
			//1) 검색후처리
			let word = "<c:out value='${classVO.keyword}'/>"; 
    		if(word!=""){ 	//검색작업을 한 경우
    			console.log(word);
    			$("#keyword").val("<c:out value='${classVO.keyword}'/>"); 	//내가 선택한 단어
    			$("#search").val("<c:out value='${classVO.search}'/>"); //내가 선택한 카테고리 
    			if($("#category").val()=="c_category"){ //카테고리 이름바꿔주는 작업	
    				switch( word ){
    					case "0" : $("#keyword").val("공예"); break
    					case "1" : $("#keyword").val("요리"); break
    					case "2" : $("#keyword").val("미술"); break
    					case "3" : $("#keyword").val("플라워"); break
    					case "4" : $("#keyword").val("뷰티"); break
    					case "5" : $("#keyword").val("기타"); break
    				}
    			}
    			
    		}
			// 2) 검색전처리
			$("#keyword").bind("keydown", function(event){
				if(event.keyCode == 13){
					event.preventDefault();
				}
			});
			// 3) 검색변경시 처리
			$("#search").change(function(){
				if($("#search").val()=="all"){
					$("#keyword").val("전체데이터 조회합니다.");
				} else if ( $("#search").val() != "all" ){
					$("#keyword").val(""); 
					$("#keyword").focus(); //입력커서
				}
			});
			// 4) 검색처리
			$("#searchBtn").click(function(){
				// 유효성 검사 : 검색키워드가 all이 아니라면 검색단어가 반드시 입력되어야함
				if( $("#search").val()!="all" ) {
					if(!chkData("#keyword", "검색단어를")) return;
				}
				$("#pageNum").val(1); //페이징 초기화
				goPage();
			});
			
			/*********************************페이징*************************************/
			$(".page-item a").click(function(e){
				e.preventDefault(); //a태그가 href의 주소로 이동하는 이벤트를 해제
				$("#f_search").find("#pageNum").val( $(this).attr("href") );
				//클릭한 a태그의 href속성값을 폼의 pageNum값에 대입
				goPage();
			});
			
		}); //최상위$
			
		//페이지 전환 함수 :: 검색, 페이징 
		function goPage(){
			//전체조회의 경우 제어
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			//카테고리검색의 경우 제어
			if($("#search").val()=="c_category"){
				switch( $("#keyword").val() ){
					case "공예" : $("#keyword").val("0"); break
					case "요리" : $("#keyword").val("1"); break
					case "미술" : $("#keyword").val("2"); break
					case "플라워" : $("#keyword").val("3"); break
					case "뷰티" : $("#keyword").val("4"); break
					case "기타" : $("#keyword").val("5"); break
				}
			}
			
			// 값 전달 및 처리
			$("#f_search").attr({
				"method":"get",
				"action":"/admin/class/classList"
			});
			$("#f_search").submit();
		}
	</script>
</head>
	<body>

    <div class="pagetitle">
      <h1>클래스 관리</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Tables</li>
          <li class="breadcrumb-item active">General</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
        
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">LiClass List</h5>
			 <button type="button" class="btn btn-dark rounded-pill btn-lg" id="insertBtn">
			 <i class="bi bi-cloud-upload"></i>&nbsp;신규등록</button>
			 
			<!-- 검색영역 --> 
			<!-- 검색 & 페이징을 동시에 처리하기 위한 form = 하나의 cvo저장 -->
			<form class="form-inline text-right"  id="f_search"> 
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}" />
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount}" />
				<div class="form-group" > 
					<select id="search" name="search"  class="form-control">
						<option value="all">전체</option>
						<option value="c_title">클래스명</option>
						<option value="c_area">클래스 지역</option>
						<option value="c_category">카테고리</option>
					</select>
				</div>
				<input type="text"  name="keyword"  id="keyword" class="form-control" placeholder="검색내용을 입력해주세요.."/>
        		<button type="button" class="btn btn-outline-primary btn-lg"  id="searchBtn">Search</button>
			</form> 
			 
              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                  	<td colspan="3"></td>
                  	<td colspan="2">
                  	<div id="boardSrch" class="text-right">
                  			
					</div>
                  	</td>
                  </tr>
                  <tr>
                    <th scope="col"  class="text-center">번호</th>
                    <th scope="col"  class="text-center">카테고리</th>
                    <th scope="col" class="text-center">제목</th>
                    <th scope="col" class="text-center">지역</th>
                    <th scope="col" class="text-center">센터번호</th>
                  </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${ not empty classList }">
                			<c:forEach var="liclass"  items="${classList}"  varStatus="status">
                				<tr data-num="${liclass.c_no}">
				                    <th scope="row" class="text-center">${ liclass.c_no}</th>
				                    <td class="text-center">
				                    	<c:choose>
				                    	<c:when test="${ liclass.c_category eq 0}">공예</c:when>
				                    	<c:when test="${ liclass.c_category eq 1}">요리</c:when>
				                    	<c:when test="${ liclass.c_category eq 2}">미술</c:when>
				                    	<c:when test="${ liclass.c_category eq 3}">플라워</c:when>
				                    	<c:when test="${ liclass.c_category eq 4}">뷰티</c:when>
				                    	<c:when test="${ liclass.c_category eq 5}">체험 및 기타</c:when>
				                    	</c:choose>
				                    </td>
				                    <td class="goDetail">${liclass.c_title}</td>
				                    <td class="text-center">${liclass.c_area}</td>
				                    <td class="text-center">${liclass.ct_bizno }</td>
				              </tr>
                			</c:forEach>
                		</c:when>
                		<c:otherwise>
                			<td colspan="5"> 조회내용이 없습니다. </td>
                		</c:otherwise>
                	</c:choose>
                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>
           <!-- ======== 페이징 출력시작 =======--> 
            <!-- Pagination with icons -->
              <nav aria-label="Page navigation example" style="text-align:center;">
                <ul class="pagination">
                
                  <c:if test="${pageMaker.prev}">
                  <li class="page-item">
                    <a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">
                      <span aria-hidden="true">«</span>
                    </a>
                  </li>
                  </c:if>
                  
                  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                  	<li class="page-item ${pageMaker.cvo.pageNum==num?'active':''}"><a class="page-link" href="${num}">${num}</a></li>
                  </c:forEach>
                  
                  <c:if test="${pageMaker.next}">
                  <li class="page-item">
                    <a class="page-link" href="${pageMaker.endPage+1}" aria-label="Next">
                      <span aria-hidden="true">»</span>
                    </a>
                  </li>
                  </c:if>
                  
                </ul>
              </nav><!-- End Pagination with icons -->

        </div>
      </div>
    </section><!-- End #main -->
 
   
   <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <!-- Vendor JS Files -->
  <script src="/resources/admin/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/admin/vendor/chart.js/chart.umd.js"></script>
  <script src="/resources/admin/vendor/echarts/echarts.min.js"></script>
  <script src="/resources/admin/vendor/quill/quill.min.js"></script>
  <script src="/resources/admin/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="/resources/admin/vendor/tinymce/tinymce.min.js"></script>
  <script src="/resources/admin/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/admin/js/main.js"></script>
  
	</body>
</html>