package com.liclass.admin.management.noticeboard.service;

import com.liclass.admin.management.noticeboard.dao.NoticeBoardDao;
import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{

    @Setter(onMethod_ = @Autowired)
    private NoticeBoardDao noticeBoardDao;

    //공지게시판 리스트
    @Override
    public List<QnaBoardVo> noticeBoardList(QnaBoardVo qnaBoard) {
        List<QnaBoardVo> list = null;
        list = noticeBoardDao.noticeBoardList(qnaBoard);

        return list;
    }

    //전체 레코드 수 구현
    @Override
    public int noticeBoardCnt(QnaBoardVo qnaBoard){
        return noticeBoardDao.noticeBoardCnt(qnaBoard);
    }

    //공지게시판 글 작성
    @Override
    public int noticeBoardInsert(QnaBoardVo qnaBoard){
        int result = 0;

        result = noticeBoardDao.noticeBoardInsert(qnaBoard);
        return result;
    }

    @Override
    public QnaBoardVo noticeBoardDetail(QnaBoardVo qnaBoard){
        QnaBoardVo detail = null;

        detail = noticeBoardDao.noticeBoardDetail(qnaBoard);
        if(detail != null){
            detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br />"));
        }
        return detail;
    }

    @Override
    public QnaBoardVo updateForm(QnaBoardVo qnaBoard){
        QnaBoardVo updateData = null;
        updateData = noticeBoardDao.noticeBoardDetail(qnaBoard);

        return updateData;
    }
    @Override
    public int noticeBoardUpdate(QnaBoardVo qnaBoard){
        int result = 0;

        result = noticeBoardDao.noticeBoardUpdate(qnaBoard);
        return result;
    }

    @Override
    public int noticeBoardDelete(QnaBoardVo qnaBoard) {
        int result = 0;

        result = noticeBoardDao.noticeBoardDelete(qnaBoard);
        return result;
    }

    @Override
    public int noticeStateUpdate(QnaBoardVo qnaBoard) {
        int result = 0;

        result = noticeBoardDao.noticeStateUpdate(qnaBoard);
        return result;
    }

}
