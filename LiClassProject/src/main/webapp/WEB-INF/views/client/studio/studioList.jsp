<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/WEB-INF/views/client/studiocommon/common.jspf" %>
	
	<script type="text/javascript">
	$(function(){
			
			
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */		
			$(".goDetail").click(function(){
				let s_no =  $(this).parents("tr").attr("data-num");	
				$("#s_no").val(s_no);
				console.log("글번호 : "+s_no);
				// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm) 
				$("#detailForm").attr({
					"method":"get",
					"action":"/studio/studioDetail"
				});
				$("#detailForm").submit(); 
			});
			
			$(".paginate_button a").click(function(e) {
				 e.preventDefault();
				 $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				 goPage();
			});
			
		}); // $ 함수 종료문
	
	</script>
	
	<style>
		#title-font{
			font-weight: bold;
		}
	</style>
	
	</head>
	<body>
		<!-- Main -->
					<%-- <div id="main">
						<div class="inner">
							<!-- <header>
								<h1>스튜디오 홍보</h1>
							</header> -->
							<section class="tiles">
							
							<c:choose>
							<c:when test="${not empty studioList}" >
								<c:forEach var="studio" items="${studioList}" varStatus="status">
								<article class="style1">
									<span class="image">
										<img src="/uploadLiClass/studio/thumbnail/${studio.s_thumb}" style="width: 100%; height: 300px;"/>
									</span>
									<a href="/client/studio/studioDetail?s_no=${studio.s_no}">
										<span class="goDetail">${studio.s_title}</span>
										<div class="content">
											<p>어서오세요!</p>
										</div>
									</a>
								</article>
								</c:forEach>
								</c:when>
								
								<c:otherwise>
								
								<tr>
									<td colspan="4" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
								</tr>
								</c:otherwise>
								
								</c:choose>
							</section>
						</div>
					</div> --%>
					



			<section class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="row">
				<c:choose>
				<c:when test="${not empty studioList}" >
				<c:forEach var="studio" items="${studioList}" varStatus="status">
				<div class="col-lg-3 col-md-6">
							<article class="post-grid mb-5">
								<a class="post-thumb mb-4 d-block" href="/studio/studioDetail?s_no=${studio.s_no}">
									<img src="/uploadLiClass/studio/thumbnail/${studio.s_thumb}" style="height: 180px;" alt="" class="img-fluid w-100" >
								</a>
								<h3 class="post-title mt-1"><a id="title-font" href="/studio/studioDetail?s_no=${studio.s_no}">${studio.s_title}</a></h3>

								<span class="text-muted letter-spacing text-uppercase font-sm">${studio.s_date}</span>

							</article>
				</div>
				</c:forEach>
				</c:when>
								
							<c:otherwise>
							<tr>
								<td colspan="4" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
							</tr>
							</c:otherwise>
							
				</c:choose>
						</div>
				</div>
			</div>
		</div>
	</section>
					
		<%-- <div class="contentContainer container">
         <!-- <div class="contentTit page-header"><h3 class="text-center">명언테이블</h3></div> -->
         
         <form id="detailForm">
         	<input type="hidden" id="s_no" name="s_no" />
         </form>
      
	      
	      =================== 리스트 시작  =================
			<div id="studioList" class="table-height">
				<table summary="게시판 리스트" class="table table-striped" >
					<thead>
						<tr>
							<th data-value="s_num" class="order text-center col-md-1" >글번호</th>
							<th class="text-center col-md-4">글제목</th>
							<th data-value="b_date" class="order col-md-1">작성일</th>
							<th class="text-center col-md-3">이미지</th>
						</tr>
					</thead>
			 		<tbody id="list" class="table-striped" >
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty studioList}" >
								<c:forEach var="studio" items="${studioList}" varStatus="status">
									<tr class="text-center" data-num="${studio.s_no}">
										<td>${studio.s_no}</td>
										<td class="goDetail">${studio.s_title}</td>
										<td class="text-left">${studio.s_date}</td>
										<td>
											<c:if test="${not empty studio.s_thumb}">
												<img src="/uploadLiClass/studio/thumbnail/${studio.s_thumb}" />
											</c:if>
											<c:if test="${empty studio.s_thumb}">
												<img src="/resources/images/common/noimage.jpg" />
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody> 
				</table>
			</div>
			=================== 리스트 종료  =================

	   
	      </div>
					 --%>
				
					
			<!-- Scripts -->
			<!-- <script src="/resources/include/dist/studio/assets/js/jquery.min.js"></script> -->
			<!-- <script src="/resources/include/dist/studio/assets/js/browser.min.js"></script>
			<script src="/resources/include/dist/studio/assets/js/breakpoints.min.js"></script>
			<script src="/resources/include/dist/studio/assets/js/util.js"></script>
			<script src="/resources/include/dist/studio/assets/js/main.js"></script> -->
					
	</body>
</html>