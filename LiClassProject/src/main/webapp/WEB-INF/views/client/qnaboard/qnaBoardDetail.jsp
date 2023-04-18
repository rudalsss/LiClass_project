<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/client/qnaBoard/css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script type="text/javascript">

    $(function (){
        $("#updateBtn").click(function (){
            $("#f_data").attr({
               "method" : "post",
                "action" : "/client/qnaboard/qnaUpdateForm"
            });
            $("#f_data").submit();
        });
        $("#deleteBtn").click(function(){
            if(confirm("정말 삭제하시겠습니까?")){
                $("#f_data").attr({
                    "method" : "post",
                    "action" : "/client/qnaboard/qnaBoardDelete"
                });
                $("#f_data").submit();
            }
        });
        $("#listBtn").click(function (){
            location.href="/client/qnaboard/qnaBoard";
        });
    });


</script>

<div class="board_wrap">

    <form name="f_data" id="f_data" method="post">
        <input type="hidden" name="qna_no" id="qna_no" value="${detail.qna_no}"/>
        <input type="hidden" name="user_no" id="user_no" value="${detail.user_no}"/>
    </form>

    <div class="board_title">
        <c:choose>
            <c:when test="${detail.qna_category == '공지'}">
                <strong>공지사항</strong>
                <p>공지사항을 잘 확인하시기 바랍니다.</p>
            </c:when>
            <c:otherwise>
                <strong>문의사항</strong>
                <p>문의사항을 잘 작성하시고 답변을 잘 확인 바랍니다.</p>
            </c:otherwise>
        </c:choose>

    </div>
    <div class="board_view_wrap">
        <div class="board_view">
            <div class="title">
                <h3>[${detail.qna_category}]&nbsp;&nbsp;${detail.qna_title}</h3>
                <div class="info">
                    <dl>
                        <dt><strong>작성자</strong>&nbsp;:</dt>
                        <c:choose>
                            <c:when test="${detail.qna_category== '공지'}"><dd>관리자</dd></c:when>
                        <c:otherwise><dd>${detail.user_name}</dd></c:otherwise>
                        </c:choose>
                    </dl>
                    <dl>
                        <dt><strong>작성날짜</strong>&nbsp;:</dt>
                        <dd>${detail.qna_date}&nbsp;&nbsp;</dd>
                        <c:if test="${not empty detail.qna_date_fix}">
                        <dd>(</dd>
                            <dt><strong>수정날짜</strong>&nbsp;:</dt>
                        <dd>${detail.qna_date_fix})</dd>
                        </c:if>
                    </dl>
                </div>
            </div>
            <div class="cont">
                ${detail.qna_content}
            </div>
        </div>
        <c:choose>
            <c:when test="${detail.qna_group == answerDetail.qna_group}">
            <div class="board_view_answer">
                <div class="title">
                    <h3>[${answerDetail.qna_category}]&nbsp;&nbsp;${answerDetail.qna_title}</h3>
                    <div class="info">
                        <dl>
                            <dt><strong>작성자</strong>&nbsp;:</dt>
                                <dd>${answerDetail.admin_name}</dd>
                        </dl>
                        <dl>
                            <dt>작성날짜 :</dt>
                            <dd>${answerDetail.qna_date}&nbsp;&nbsp;</dd>
                            <c:if test="${not empty answerDetail.qna_date_fix}">
                                <dt>(<strong>수정날짜</strong>&nbsp;: ${ answerDetail.qna_date_fix})</dt>
                            </c:if>
                        </dl>
                    </div>
                </div>
                <div class="cont">
                    ${answerDetail.qna_content}
                </div>
            </div>
            </c:when>
        </c:choose>
        <div class="bt_wrap">
            <c:choose>
                <c:when test="${loginUser.user_no == detail.user_no}">
                    <button type="button" class="on" id="listBtn">목록</button>
                    <c:if test="${detail.qna_no != answerDetail.qna_group}">
                        <button type="button" class="on" id="updateBtn">수정</button>
                        <button type="button" class="on" id="deleteBtn">삭제</button>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <button type="button" class="on" id="listBtn">목록</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
