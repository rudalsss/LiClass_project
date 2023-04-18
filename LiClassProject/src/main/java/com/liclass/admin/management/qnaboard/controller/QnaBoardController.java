package com.liclass.admin.management.qnaboard.controller;

import com.liclass.admin.management.qnaboard.service.QnaBoardService;
import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@RequestMapping("/management/qnaboard/*")
@Controller
@Slf4j
public class QnaBoardController {
    @Setter(onMethod_ = @Autowired)
    private QnaBoardService qnaBoardService;

    //문의게시판 리스트 화면 출력
    @RequestMapping(value = "/qnaBoard", method = RequestMethod.GET)
    public String qnaBoardList(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaboard 메서드 호출");
        List<QnaBoardVo> qnaBoardList = qnaBoardService.qnaBoardList(qnaBoard);
        model.addAttribute("qnaBoardList", qnaBoardList);

        return "admin/management/qnaboard/qnaBoard";
    }

    //문의게시판 상세페이지
    @RequestMapping(value = "/qnaBoardDetail", method = RequestMethod.GET)
    public String qnaBoardDetail(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaboarddetail 메서드 호출");

        QnaBoardVo detail = qnaBoardService.qnaBoardDetail(qnaBoard);
        model.addAttribute("detail", detail);
        QnaBoardVo answerDetail = qnaBoardService.qnaBoardAnswerDetail(qnaBoard);
        if (answerDetail != null && detail.getQna_no() == answerDetail.getQna_group()) {
            model.addAttribute("answerDetail", answerDetail);
        }
        return "admin/management/qnaboard/qnaBoardDetail";
    }

    //문의 답변글 작성 메서드
    @RequestMapping(value = "/qnaAnswerForm")
    public String qnaAnswerForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaAnswerForm 호출");

        QnaBoardVo answerData = qnaBoardService.qnaAnswerForm(qnaBoard);
        model.addAttribute("answerData", answerData);

        return "admin/management/qnaboard/qnaAnswerForm";
    }

    @RequestMapping(value = "/qnaInsertForm")
    public String qnaInsertForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaInsertForm 호출");

        return "admin/management/qnaboard/qnaInsertForm";
    }

    @RequestMapping(value = "qnaBoardInsert")
    public String qnaBoardInsert(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 작성 호출");

        int result = 0;
        String url = "";


        result = qnaBoardService.qnaBoardInsert(qnaBoard);
        if(result == 1){
            url = "/management/qnaboard/qnaBoard";
        } else{
            url = "/management/qnaboard/qnaInsertForm";
        }
        return "redirect:"+url;
    }


    @RequestMapping(value = "qnaAnswerInsert")
    public String qnaAnswerInsert(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 작성 메서드 호출");

        int result = 0;
        String url = "";


        result = qnaBoardService.qnaAnswerInsert(qnaBoard);
        if(result == 1){
            url = "/management/qnaboard/qnaBoard";
        } else{
            url = "/management/qnaboard/qnaAnswerForm";
        }
        return "redirect:"+url;
    }

    @RequestMapping(value = "/qnaBoardDelete", method = RequestMethod.POST)
    public String qnaBoardDelete(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 삭제 메서드 호출");
        int result = 0;
        String url = "";

        result = qnaBoardService.qnaBoardDelete(qnaBoard);
        if(result == 1){
            url = "/management/qnaboard/qnaBoard";

        } else{
            url = "/management/qnaboard/qnaBoardDetail?qna_no="+qnaBoard.getQna_no();
        }
        return "redirect:"+url;

    }

    @RequestMapping(value = "/answerUpdateForm")
    public String updateForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("updateForm 호출");
        log.info("qna_no =" + qnaBoard.getQna_no());

        QnaBoardVo detail = qnaBoardService.qnaBoardDetail(qnaBoard);
        model.addAttribute("detail", detail);
        QnaBoardVo updateData = qnaBoardService.answerUpdateForm(qnaBoard);
        model.addAttribute("updateData", updateData);

        return "admin/management/qnaboard/answerUpdateForm";
    }

    @RequestMapping(value = "/answerUpdate", method = RequestMethod.POST)
    public String answerUpdate(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        int result = 0;

        String url = null;

        result = qnaBoardService.qnaBoardUpdate(qnaBoard);
        if(result == 1){
            url = "/management/qnaboard/qnaBoard";
        } else {
            url = "/management/qnaboard/answerUpdateForm";
        }
        return "redirect:"+url;
    }
}
