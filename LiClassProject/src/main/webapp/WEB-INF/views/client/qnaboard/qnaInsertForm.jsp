<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="/resources/client/qnaBoard/css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script type="text/javascript">
    $(function(){

        $("#insertBtn").click(function() {
            if (!chkData("#qna_title", "제목을")) return;
            else if (!chkData("#qna_content", "본문을")) return;
            $("#insertForm").attr({
                "method": "post",
                "action": "/client/qnaboard/qnaBoardInsert"
            });
            $("#insertForm").submit();
        });

        $("#listBtn").click(function (){
            location.href="/client/qnaboard/qnaBoard";
        });

    });


</script>

<div class="board_wrap">
    <div class="board_title">
        <strong>고객센터</strong>
        <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
    </div>

    <form id="insertForm">
        <input type="hidden" id="qna_category" name="qna_category" value="[문의]">
        <input type="hidden" id="user_no" name="user_no" value="${loginUser.user_no}">
        <%--<input type="hidden" id="user_no" name="user_no" value="${}">--%>
        <%--<input type="hidden" id="qna_category" name="qna_category" value="[문의]">--%>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" id="qna_title" name="qna_title"></dd>
                    </dl>
                </div>

                <div class="cont">
                    <textarea placeholder="내용 입력" id="qna_content" name="qna_content"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <button type="button" class="on" id="insertBtn">등록</button>
                <button type="button" class="on" id="listBtn">목록</button>
            </div>
        </div>
    </form>
</div>
