package com.liclass.admin.management.qnaboard.dao;

import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QnaBoardDao {
    //문의게시판 리스트 메서드
    public List<QnaBoardVo> qnaBoardList(QnaBoardVo qnaBoard);

    //문의게시판 게시물 작성 메서드
    public int qnaBoardInsert(QnaBoardVo qnaBoard);

    //문의게시판 상세페이지 메서드
    public QnaBoardVo qnaBoardDetail(QnaBoardVo qnaBoard);

    //문의게시판 문의글 삭제 메서드
    public int qnaBoardDelete(QnaBoardVo qnaBoard);

    //문의게시판 답변 작성 메서드
    public int qnaAnswerInsert(QnaBoardVo qnaBoard);

    public int qnaAnswerStepUpdate(QnaBoardVo qnaBoard);

    public int qnaBoardUpdate(QnaBoardVo qnaBoard);

    public QnaBoardVo qnaBoardAnswerDetail(QnaBoardVo qnaBoard);
}
