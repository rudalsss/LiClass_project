<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">

    $(function(){
       $("#insertBtn").click(function(){
            location.href="/management/noticeboard/insertForm";
       });
        /* 제목 클릭 시 상세페이지 이동을 위한 처리 이벤트 */
        $(".goDetail").click(function(){
            let qna_no = $(this).parents("tr").attr("data-num");
            $("#qna_no").val(qna_no);
            //상세페이지로 이동하기 위해 form 추가 (id : detailForm)
            $("#detailForm").attr({
                "method" : "get",
                "action" : "/management/noticeboard/noticeBoardDetail"
            });
            $("#detailForm").submit();
        });

        //리스트에서 수정버튼 클릭시 동작 이벤트
        $(".listUpdateBtn").click(function (){
            let qna_no = $(this).parents("tr").attr("data-num");
            $("#qna_no").val(qna_no);
            $("#detailForm").attr({
                "method" : "post",
                "action" : "/management/noticeboard/updateForm"
            });
            $("#detailForm").submit();
        });
        //리스트에서 삭제버튼 클릭시 동작 이벤트
        $(".listDeleteBtn").click(function (){
            let qna_no = $(this).parents("tr").attr("data-num");
            if(confirm("정말 삭제하시겠습니까?")){
            $("#qna_no").val(qna_no);
                $("#detailForm").attr({
                    "method" : "post",
                    "action" : "/management/noticeboard/noticeDelete"
                });
                $("#detailForm").submit();
            }
        });

        //문의게시판 게시를 위한 버튼 클릭시 동작 이벤트
        $(".notice_top_button").click(function (){
            let qna_no = $(this).parents("tr").attr("data-num");
            let btn_state = $(this).attr("notice-state");
            if(btn_state == 1){
                if(confirm("문의게시판에 게시하시겠습니까?")){
                    $("#qna_no").val(qna_no);
                    $.ajax({
                       url : "/management/noticeboard/noticeStateUpdate",
                       type : "post",
                       data : $("#detailForm").serialize(),
                       dataType : "text",
                       error : function (){
                           alert('변경 실패');
                       },
                       success : function (data){
                           $("#detailForm").submit();
                       }
                    });
                }
            }else{
                if(confirm("문의게시판에서 숨기시겠습니까?")){
                    $("#qna_no").val(qna_no);
                    $.ajax({
                        url : "/management/noticeboard/noticeStateUpdate",
                        type : "post",
                        data : $("#detailForm").serialize(),
                        dataType : "text",
                        error : function (){
                            alert('변경 실패');
                        },
                        success : function (data){
                            $("#detailForm").submit();
                            noticeStateReload();
                        }
                    });
                }

            }
            });
        });

    function noticeStateReload(){
        $("#noticeList").load(window.location.href + "#noticeList");
    }

</script>

<div class="contentContainer container">

    <div class="pagetitle">
        <h1>공지사항 관리</h1>
        <hr />
    </div><!-- End Page Title -->
    <div class="row">
        <div class="col-lg-12">
            <div class="text-right">
            <button type="button" class="btn btn-dark rounded-pill btn-lg " id="insertBtn"><i class="bi bi-cloud-upload"></i>&nbsp;공지사항등록</button>
            </div>
            <form id="detailForm">
                <input type="hidden" id="qna_no" name="qna_no"/>
            </form>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" class="order text-center col-sm-1">번호</th>
                    <th scope="col" class="text-left col-md-4">제목</th>
                    <th scope="col" class="text-center col-md-1">작성일</th>
                    <th scope="col" class="text-center col-md-1">관리</th>
                    <th scope="col" class="text-center col-md-1">게시상태</th>
                </tr>
                </thead>
                <tbody id="list" class="table-striped">
                <c:choose>
                    <c:when test="${not empty qnaBoardList}">
                        <c:forEach var="qnaBoard" items="${qnaBoardList}" varStatus="status">
                            <tr class="text-center" data-num="${qnaBoard.qna_no}">
                                <%--게시물 수에 따른 글번호로 보기--%>
                                <%--<td class="text-center">${count + status.index + 1}</td>--%>
                                <%--원래 글번호로 보기--%>
                                <td>${qnaBoard.qna_no}</td>
                                <td class="goDetail text-left">${qnaBoard.qna_category} ${qnaBoard.qna_title}</td>
                                <td class="text-center">${qnaBoard.qna_date}</td>
                                <td class="text-center">
                                    <button class="btn btn-success btn-sm me-2 listUpdateBtn">수정</button>
                                    <button class="btn btn-danger btn-sm listDeleteBtn">삭제</button>
                                </td>
                                    <c:choose>
                                        <c:when test="${qnaBoard.qna_top_state>0}">
                                            <td class="text-center"><button class="btn btn-primary btn-sm notice_top_button" notice-state="${qnaBoard.qna_top_state}">게시상태</button></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="text-center"><button class="btn btn-secondary btn-sm notice_top_button" notice-state="${qnaBoard.qna_top_state}">숨김상태</button></td>
                                        </c:otherwise>
                                    </c:choose>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
                </div>
            </div>
            <%-- ====================페이징 출력 시작==================== --%>
<%--            <nav aria-label="Page navigation example" style="text-align:center;">
                <ul class="pagination">
                    &lt;%&ndash;이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인.&ndash;%&gt;
                    <c:if test="${pageMaker.prev}">
                        <li class="page-item">
                            <a class="page-link" href="${pageMaker.startPage - 1}">Previous</a>
                        </li>
                    </c:if>

                    &lt;%&ndash;바로가기 번호 출력&ndash;%&gt;
                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li class="page-item ${pageMaker.cvo.pageNum == num ?'active':''}">
                            <a class="page-link" href="${num}">${num}</a>
                        </li>
                    </c:forEach>

                    &lt;%&ndash;다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. &ndash;%&gt;
                    <c:if test="${pageMaker.next}">
                        <li class="page-item next">
                            <a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>--%>
    <%-- ====================페이징 출력 종료==================== --%>
</div>
