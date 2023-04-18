package com.liclass.client.qnaboard.service;

import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;

import java.util.List;

public interface ClientQnaBoardService {

    public List<QnaBoardVo> qnaBoardList(QnaBoardVo qnaBoard);

    //문의게시판 게시물 작성 메서드
    public int qnaBoardInsert(QnaBoardVo qnaBoard);

    //문의게시판 상세페이지 메서드
    public QnaBoardVo qnaBoardDetail(QnaBoardVo qnaBoard);

    //문의게시판 문의글 삭제 메서드
    public int qnaBoardDelete(QnaBoardVo qnaBoard);

    public QnaBoardVo updateForm(QnaBoardVo qnaBoard);

    public int qnaBoardUpdate(QnaBoardVo qnaBoard);

    public QnaBoardVo qnaBoardAnswerDetail(QnaBoardVo qnaBoard);
}
