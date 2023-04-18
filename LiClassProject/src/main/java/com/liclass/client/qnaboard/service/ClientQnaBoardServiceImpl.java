package com.liclass.client.qnaboard.service;

import com.liclass.admin.management.noticeboard.dao.NoticeBoardDao;
import com.liclass.admin.management.qnaboard.dao.QnaBoardDao;
import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientQnaBoardServiceImpl implements ClientQnaBoardService {

    @Setter (onMethod_ = @Autowired)
    private QnaBoardDao qnaBoardDao;

    @Setter (onMethod_ = @Autowired)
    private NoticeBoardDao noticeBoardDao;

    @Override
    public List<QnaBoardVo> qnaBoardList(QnaBoardVo qnaBoard) {
        List<QnaBoardVo> list = null;
        list = qnaBoardDao.qnaBoardList(qnaBoard);

        return list;
    }

    @Override
    public int qnaBoardInsert(QnaBoardVo qnaBoard) {
        int result = 0;
        result = qnaBoardDao.qnaBoardInsert(qnaBoard);

        return result;
    }

    @Override
    public QnaBoardVo qnaBoardDetail(QnaBoardVo qnaBoard) {
        QnaBoardVo detail = null;

        detail = qnaBoardDao.qnaBoardDetail(qnaBoard);
        if(detail != null){
            detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br />"));
        }
        return detail;
    }

    @Override
    public int qnaBoardDelete(QnaBoardVo qnaBoard) {
        int result = 0;
        result = qnaBoardDao.qnaBoardDelete(qnaBoard);

        return result;
    }

    @Override
    public QnaBoardVo updateForm(QnaBoardVo qnaBoard) {
        QnaBoardVo updateData = null;
        updateData = qnaBoardDao.qnaBoardDetail(qnaBoard);
        return updateData;
    }

    @Override
    public int qnaBoardUpdate(QnaBoardVo qnaBoard) {
        int result = 0;

        result = qnaBoardDao.qnaBoardUpdate(qnaBoard);
        return result;
    }

    @Override
    public QnaBoardVo qnaBoardAnswerDetail(QnaBoardVo qnaBoard) {
        QnaBoardVo answerDetail = null;

        answerDetail = qnaBoardDao.qnaBoardAnswerDetail(qnaBoard);
        if(answerDetail != null){
            answerDetail.setQna_content(answerDetail.getQna_content().toString().replaceAll("\n", "<br />"));
        }
        return answerDetail;
    }
}
