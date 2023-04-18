<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 클래스 상세페이지 전체 테마 관련 -->
<script src="/resources/client/classDetail/js/classDetail.js"></script>
<link href="/resources/client/classDetail/css/classDetail.css" rel="stylesheet"  />
<link href="/resources/client/classDetail/css/themify-icons.css" rel="stylesheet">
<link href='/resources/client/classDetail/css/dosis-font.css' rel='stylesheet' type='text/css'>
<!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap" rel="stylesheet">

<style>
.custom-cursor-default-hover{ margin-top: 15px;}
</style>
<div id="class-detail-div" style="padding-top: 70px; margin-left: 100px;">
	<!-- 1. class img slider section start -->
	<section id="header-slider" class="section" style="    margin-top: 80px; width: 58%; margin-left: 100px;">
		<%@ include file="/WEB-INF/views/client/class/classDetail-0.imgSlider.jsp" %>
	</section>
	<!-- 1. class img slider section end -->
	
	<!-- 2. information section start -->
	<div class="container-fluid class-info" data-title = "${clientClassDetail.c_title}" >
		<div class="row" style="display:block;">
		    <div class="col-md-10">
			      <div class="card" style="display: block; border: none; margin-left: 120px; width: 72%;" >
				      <!-- Nav tabs start -->
				      <ul class="nav nav-tabs" role="tablist">
				          <li role="presentation" class="active"><a href="#class-info" aria-controls="class-info" role="tab" data-toggle="tab">클래스정보</a></li>
				          <li role="presentation"><a href="#center-info" aria-controls="messages" role="tab" data-toggle="tab">센터</a></li>
				          <li role="presentation"><a href="#class-review" aria-controls="messages" role="tab" data-toggle="tab">후기</a></li>
				          <li role="presentation"><a href="#attention" aria-controls="settings" role="tab" data-toggle="tab">안내사항</a></li>
				      </ul>
					 <!-- Nav tabs end -->
					 
	     			 <!-- Tab panes start -->
				      <div class="tab-content">
				      	  <!-- 1. class info -->
				          <div role="tabpanel" class="tab-pane active" id="class-info" >
				          	<%@ include file="/WEB-INF/views/client/class/classDetail-1.classInfo.jsp" %>
				          </div>
						  <!-- 2. center info-->
				          <div role="tabpanel" class="tab-pane" id="center-info">
				          	<%@ include file="/WEB-INF/views/client/class/classDetail-2.centerInfo.jsp" %>
				          </div>
				          
			              <!-- 3. class-review -->
				          <div role="tabpanel" class="tab-pane" id="class-review" data-num="${clientClassDetail.c_no}">
								<%@ include file = "/WEB-INF/views/client/class/classReview.jsp" %>
						  </div>
						  
				          <!-- 4. attention  -->
				          <div role="tabpanel" class="tab-pane" id="attention">
							<%@ include file="/WEB-INF/views/client/class/classDetail-4.attention.jsp" %>
						  </div>
					  </div>
					  <!-- Tab panes end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 2. information section end -->
</div>
<!-- 3. reservation section start -->
<div id="sticky-nav" style="position: absolute;right: 20px;bottom:50px; z-index: 0; top:160px;">
	<jsp:include page="/WEB-INF/views/client/class/classReservation.jsp">
		<jsp:param value="${clientClassDetail.c_no}" name="c_no"/>
	</jsp:include> 
	 <%--<%@ include file="/WEB-INF/views/client/class/classReservation.jsp" %>--%>
</div>
<!-- 3. reservation section start -->