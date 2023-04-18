<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%-- 은아) 클래스 상세페이지 탭메뉴1. 클래스정보 --%>	
	
<section id="services" class="section services" style="margin:0px; width:100%;">
  <div class="container-fluid">
    <div class="row" style="justify-content: left;">
      <div class="col-md-12 col-sm-6">
        <div class="services-content">
          <h5 style="margin-bottom: 2%;">
          	<i class="fa-solid fa-quote-left"></i>  
          	안녕하세요, ${clientCenterDetail.ct_name} 입니다.  
          	<i class="fa-solid fa-quote-right"></i>
          </h5>
         	${fn:replace(clientClassDetail.c_content, replaceChar, "<br/>")}
          </div>
   	  </div>
    </div>
  </div>
</section>