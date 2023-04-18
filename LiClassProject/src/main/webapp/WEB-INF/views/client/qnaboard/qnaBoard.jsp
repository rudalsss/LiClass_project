<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/resources/client/qnaBoard/css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<script type="text/javascript">
    $(function (){
        $("#insertForm").click(function(){
            let login_user_no = $("#login_user_no").val();
            if(login_user_no != 0){
            location.href="/client/qnaboard/qnaInsertForm";
            } else {
                alert("로그인 후 글쓰기 가능합니다.")
            }

        });
        /* 제목 클릭 시 상세페이지 이동을 위한 처리 이벤트 */
        $(".goDetail").click(function(){
            let qna_no = $(this).parents("div").attr("data-num");
            let qna_top_state = $(this).parents("div").attr("state-num");
            let user_no = $(this).parents("div").attr("data-user_no");
            let login_user_no = $("#login_user_no").val();
            let group_no = $(this).parents("div").attr("group-num");

            $("#qna_no").val(qna_no);
            $("#qna_top_state").val(qna_top_state);
            $("#user_no").val(user_no);
            $("#qna_group").val(group_no);
            if(qna_top_state == 1){
                // 로그인한 사용자이거나 qna_top_state 값이 1인 경우 상세페이지로 이동
                $("#detailForm").attr({
                    "method" : "get",
                    "action" : "/client/qnaboard/qnaBoardDetail"
                });
                $("#detailForm").submit();
            } else if(qna_top_state == 0) {
                if (login_user_no == user_no) {
                    $("#detailForm").attr({
                        "method": "get",
                        "action": "/client/qnaboard/qnaBoardDetail"
                    });
                    $("#detailForm").submit();
                } else {
                    alert("로그인 하시거나, 자신이 작성한 글만 확인할 수 있습니다.");
                }
            }
        });
        $(".goAnswerDetail").click(function(){
            let qna_no = $(this).parents("div").attr("group-num");
            let qna_top_state = $(this).parents("div").attr("state-num");
            let user_no = $(this).parents("div").attr("data-user_no");
            let login_user_no = $("#login_user_no").val();
            let group_no = $(this).parents("div").attr("group-num");

            $("#qna_no").val(qna_no);
            $("#qna_top_state").val(qna_top_state);
            $("#user_no").val(user_no);
            $("#qna_group").val(group_no);
            if(qna_top_state == 1){
                // 로그인한 사용자이거나 qna_top_state 값이 1인 경우 상세페이지로 이동
                $("#detailForm").attr({
                    "method" : "get",
                    "action" : "/client/qnaboard/qnaBoardDetail"
                });
                $("#detailForm").submit();
            } else if(qna_top_state == 0) {
                if (login_user_no == user_no) {
                    $("#detailForm").attr({
                        "method": "get",
                        "action": "/client/qnaboard/qnaBoardDetail"
                    });
                    $("#detailForm").submit();
                } else {
                    alert("로그인 하시거나, 자신이 작성한 글만 확인할 수 있습니다.");
                }
            }
        });
    });
</script>
    <form id="detailForm">
        <input type="hidden" id="qna_no" name="qna_no"/>
        <input type="hidden" id="user_no" name="user_no"/>
        <input type="hidden" id="qna_top_state" name="qna_top_state"/>
        <input type="hidden" id="qna_group" name="qna_group"/>
        <input type="hidden" id="login_user_no" name="login_user_no" value="${loginUser.user_no}">
    </form>

    <div class="board_wrap">
        <div class="board_title">
            <strong>QNA</strong>
            <p>공지사항을 확인하거나 문의사항을 작성할 수 있습니다.</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <%--상단--%>
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                </div>
                <%--내용--%>
                <c:choose>
                    <c:when test="${not empty qnaBoardList}">
                    <c:set var="count" value="0"/>
                        <c:forEach var="qnaBoard" items="${qnaBoardList}" varStatus="status">
                            <div data-num="${qnaBoard.qna_no}" state-num="${qnaBoard.qna_top_state}" data-user_no="${qnaBoard.user_no}" group-num="${qnaBoard.qna_group}">
                                <c:choose>
                                    <c:when test="${qnaBoard.qna_top_state > 0}">
                                        <div class="num" ><i class="bi bi-megaphone"></i></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="num" >${count + 1} <c:set var="count" value="${count + 1}"/></div>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${qnaBoard.qna_top_state > 0}">
                                        <div class="title goDetail"><span style="font-weight: bold">[${qnaBoard.qna_category}] &nbsp;&nbsp;${qnaBoard.qna_title}</span>
                                    </c:when>
                                    <c:otherwise>
                                            <div class="title goAnswerDetail">
                                                <c:if test="${qnaBoard.qna_step>0}">
                                                    <c:forEach begin="1" end="${qnaBoard.qna_indent}">

                                                    </c:forEach>
                                                    &nbsp;&nbsp;&nbsp;<i class="bi bi-arrow-return-right"></i>
                                                </c:if>
                                                <i class="bi bi-lock"></i>&nbsp;<span>[${qnaBoard.qna_category}] &nbsp;&nbsp;${qnaBoard.qna_title}</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                                <%--<div class="title goDetail">${qnaBoard.qna_category} ${qnaBoard.qna_title}</a></div>--%>
                            <c:choose>
                                <c:when test="${qnaBoard.admin_no > 0}">
                                    <div class="writer">${qnaBoard.admin_name}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="writer">${qnaBoard.user_name} </div>
                                </c:otherwise>
                            </c:choose>
                                <div class="date">${qnaBoard.qna_date}</div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center">등록된 게시글이 존재하지 않습니다.</div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="bt_wrap">
                <button type="button" class="on" id="insertForm">등록</button>
                <!--<a href="#">수정</a>-->
            </div>
        </div>
    </div>
</div>