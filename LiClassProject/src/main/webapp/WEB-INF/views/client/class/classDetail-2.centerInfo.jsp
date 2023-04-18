<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 은아) 클래스 상세페이지 탭메뉴2. 센터정보 --%>	
		<section id="services" class="section services" style="margin:0px; width:100%;">
		  <div class="container-fluid">
		    <div class="row" style="justify-content: left;">
		      <div class="col-md-12 col-sm-6">
		        <div class="services-content" style="margin:10px;">
		            <h5 style="margin-bottom: 2%; text-align: left">
			          	<c:if test="${clientCenterDetail.ct_hmpg_addr != null}">
	            			<a href="${clientCenterDetail.ct_hmpg_addr}"><i class="fa-solid fa-house"></i></a>
	        			</c:if>
			          	<c:if test="${clientCenterDetail.ct_hmpg_addr == null}">
			          		<i class="fa-solid fa-store"></i>
			          	</c:if>  
			          	${clientCenterDetail.ct_name} 
		            </h5>
		         	<p>${clientCenterDetail.ct_intro}</p>
		         	
		          </div>
		   	  </div>
		    </div>
			<div class="main-white-button" id="map-click" style="margin:5px;">
				<a href="#"><i class="fa-solid fa-map-pin"></i>${clientClassDetail.c_area}</a>
				<span style="padding: 12px 25px; font-size: 12px;"><i class="fa-regular fa-circle-check"></i>자세한 주소는 수강내역에서 확인해주세요.</span>
			</div>
	 	 </div>
	  </section>
	  <div id="map" style="width:100%;height:350px;"></div>
	<!--  kakao map start  -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93dabf793b8403bbf540b6d314c75a8f&libraries=services"></script>
	<script type="text/javascript" >
		$("#map-click").click(function(){
			var mapContainer = document.getElementById('map'), 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667),
			        level: 4
			    };  
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
				map.relayout();
				map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));
				
				var centerAddr = "${clientCenterDetail.ct_addr}";
				console.log("센터 주소 : "+centerAddr);
				var geocoder = new kakao.maps.services.Geocoder();
				
				geocoder.addressSearch(centerAddr, function(result, status) {
				   
				     if (status === kakao.maps.services.Status.OK) {
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					        map.setCenter(coords);
							var markerPosition  = coords;
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});
			
							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
							marker.open(map);
					    } 
				});
		});
	</script>
	<!--  kakao map end  -->