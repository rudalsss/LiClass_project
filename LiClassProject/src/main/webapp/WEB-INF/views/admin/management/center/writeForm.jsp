<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
		$(function(){
			
			/* 저장 버튼 클릭시 처리 이벤트 */
			$("#boardInsertBtn").click(function(){
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
					$("#f_writeForm").attr({
						"method":"post",
						"action":"/management/center/centerInsert"
					});
					$("#f_writeForm").submit();
				}
			});
			
			/* 취소 버튼 클릭시 처리 이벤트 */
			$("#boardCancelBtn").click(function(){
				$("#f_writeForm").each(function(){
					this.reset();
				});
			});
			
			/* 목록 버튼 클릭시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/management/center/centerList";
			});
		}); //종료
	</script>

	
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTB text-center">
				<form id="f_writeForm" name="f-writeForm" class="form-horizontal">
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>사업자등록번호</td>
								<td class="text-left"><input type="text" name="ct_bizno" id="ct_bizno" class="form-control" /></td>
							</tr>
							<tr>
								<td>센터명</td>
								<td class="text-left"><input type="text" name="ct_name" id="ct_name" class="form-control" /></td>
							</tr>
							<tr>
								<td>센터개업년월</td>
								<td class="text-left"><input type="text" name="ct_opbiz_ym" id="ct_opbiz_ym" class="form-control" /></td>
							</tr>
							<tr>
								<td>센터 소개</td>
								<td class="text-left"><input type="text" name="ct_intro" id="ct_intro" class="form-control" /></td>
							</tr>
							<tr>
								<td>센터 주요작품</td>
								<td class="text-left"><input type="text" name="ct_mainart" id="ct_mainart" class="form-control" /></td>
							</tr>
							<tr>
								<td>센터 우편번호</td>
								<td class="text-left"><input type="text" name="ct_zipno" id="ct_zipno" class="form-control" /></td>
							</tr>
							<tr>
								<td>센터 주소</td>
								<td class="text-left"><input type="text" name="ct_addr" id="ct_addr" class="form-control" /></td>
							</tr>
							<tr>
								<td>센터 상세주소</td>
								<td class="text-left"><input type="text" name="ct_detail_addr" id="ct_detail_addr" class="form-control" /></td>
							</tr>
							<tr>
								<td>센터 대표전화</td>
								<td class="text-left"><input type="text" name="ct_tel" id="ct_tel" class="form-control" /></td>
							</tr>
							<tr>
								<td>센터 홈페이지주소</td>
								<td class="text-left"><input type="text" name="ct_hmpg_addr" id="ct_hmpg_addr" class="form-control" /></td>
							</tr>
							
						</tbody>
					</table>
					
					<div class="text-right">
						<input type="button" value="저장" id="boardInsertBtn" class="btn btn-success"/>
						<input type="button" value="취소" id="boardCancelBtn" class="btn btn-success"/>
						<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>
					</div>
				</form>
			
			</div>
		</div>
	</body> 
</html>