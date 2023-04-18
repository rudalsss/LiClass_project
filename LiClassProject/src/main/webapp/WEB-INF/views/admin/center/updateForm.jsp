<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
		$(function(){
			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#boardUpdateBtn").click(function(){
				//입력값 체크
				if(!chkData("#ct_bizno","사업자등록번호를"))return;
				else if(!chkData("#ct_name","센터명을"))return;
				else if(!chkData("#ct_opbiz_ym","센터개업년월을"))return;
				else if(!chkData("#ct_intro","센터 소개를"))return;
				else if(!chkData("#ct_mainart","센터 주요작품을"))return;
				else if(!chkData("#ct_zipno","센터 우편번호를"))return;
				else if(!chkData("#ct_addr","센터 주소를"))return;
				else if(!chkData("#ct_detail_addr","센터 상세주소를"))return;
				else if(!chkData("#ct_tel","센터 대표전화를"))return;
				else if(!chkData("#ct_hmpg_addr","센터 홈페이지주소를"))return;
				else{
					$("#f_updateForm").attr({
						"method":"post",
						"action":"/admin/center/centerUpdate"
					});
					$("#f_updateForm").submit();
				}
			});
			
			/* 취소 버튼 클릭 시 처리 이벤트 */
			$("#boardCancelBtn").click(function(){
				$("#f_updateForm").each(function(){
					this.reset();
				});
			});				
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/admin/center/centerList"; 
			});
		});
	</script>


	</head>
	<body>
		<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 글수정</h3></div> -->
				
			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="ct_bizno" name="ct_bizno" value="${updateData.ct_bizno}" />
					
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-3">사업자등록번호</td> 
								<td class="text-left col-md-3">${updateData.ct_bizno}</td>						
								
								<td>센터명</td>
								<td colspan="3" class="text-left">
									<input type="text" name="ct_name" id="ct_name" value="${updateData.ct_name}" class="form-control" />
								</td>
								
								<td>센터개업년월</td>
								<td colspan="3" class="text-left">
									<input type="text" name="ct_opbiz_ym" id="ct_opbiz_ym" value="${updateData.ct_opbiz_ym}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>센터 소개</td>
								<td colspan="3" class="text-left">
									<input type="text" name="ct_intro" id="ct_intro" value="${updateData.ct_intro}" class="form-control" />
								</td>
								
								<td>센터 주요작품</td>
								<td colspan="3" class="text-left">
									<input type="text" name="ct_mainart" id="ct_mainart" value="${updateData.ct_mainart}" class="form-control" />
								</td>
							</tr>
							<tr>	
								<td>센터 우편번호</td>
								<td colspan="3" class="text-left">
									<input type="text" name="ct_zipno" id="ct_zipno" value="${updateData.ct_zipno}" class="form-control" />
								</td>
								<td>센터 주소</td>
								<td colspan="3" class="text-left">
									<input type="text" name="ct_addr" id="ct_addr" value="${updateData.ct_addr}" class="form-control" />
								</td>
								<td>센터 상세주소</td>
								<td colspan="3" class="text-left">
									<input type="text" name="ct_detail_addr" id="ct_detail_addr" value="${updateData.ct_detail_addr}" class="form-control" />
								</td>
							</tr>
							<tr>			
								<td>센터 대표전화</td>
								<td colspan="3" class="text-left">
									<input type="text" name="ct_tel" id="ct_tel" value="${updateData.ct_tel}" class="form-control" />
								</td>	
								<td>센터 홈페이지주소</td>
								<td colspan="3" class="text-left">
									<input type="text" name="ct_hmpg_addr" id="ct_hmpg_addr" value="${updateData.ct_hmpg_addr}" class="form-control" />
								</td>
							</tr>
							
						</tbody>	
					</table>
				</form>
			</div>	
			
			<div class="contentBtn text-right">
				<input type="button" value="수정" id="boardUpdateBtn" class="btn btn-success" />
				<input type="button" value="취소" id="boardCancelBtn" class="btn btn-success" />				
				<input type="button" value="목록" id="boardListBtn" class="btn btn-success" />
			</div>
		</div>
	</body>
</html>