package com.liclass.client.qnaboard.controller;

import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import com.liclass.client.qnaboard.service.ClientQnaBoardService;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/client/qnaboard/*") 
public class ClientQnaBoardController {
    @Setter(onMethod_ = @Autowired)
    private ClientQnaBoardService clientQnaBoardService;

    @RequestMapping(value = "/qnaBoard", method = RequestMethod.GET)
    public String qnaBoardList(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaboard 메서드 호출");
        List<QnaBoardVo> qnaBoardList = clientQnaBoardService.qnaBoardList(qnaBoard);
        model.addAttribute("qnaBoardList", qnaBoardList);

        return "qnaboard/qnaBoard";
    }

    //문의게시판 상세페이지
    @RequestMapping(value = "/qnaBoardDetail", method = RequestMethod.GET)
    public String qnaBoardDetail(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaboarddetail 메서드 호출");

        QnaBoardVo detail = clientQnaBoardService.qnaBoardDetail(qnaBoard);
        model.addAttribute("detail", detail);
        QnaBoardVo answerDetail = clientQnaBoardService.qnaBoardAnswerDetail(qnaBoard);

        if (answerDetail != null && detail.getQna_no() == answerDetail.getQna_group()) {
            model.addAttribute("answerDetail", answerDetail);
        }

        return "qnaboard/qnaBoardDetail";
    }

    @RequestMapping(value = "/qnaInsertForm")
    public String qnaInsertForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaInsertForm 호출");

        return "qnaboard/qnaInsertForm";
    }

    @RequestMapping(value = "qnaBoardInsert")
    public String qnaBoardInsert(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 작성 호출");

        int result = 0;
        String url = "";

        result = clientQnaBoardService.qnaBoardInsert(qnaBoard);
        if(result == 1){
            url = "/client/qnaboard/qnaBoard";
        } else{
            url = "/client/qnaboard/qnaInsertForm";
        }
        return "redirect:"+url;
    }

    @RequestMapping(value = "/qnaUpdateForm")
    public String updateForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 수정 폼 호출");

        QnaBoardVo updateData = clientQnaBoardService.updateForm(qnaBoard);
        model.addAttribute("updateData", updateData);

        return "qnaboard/qnaUpdateForm";
    }

    @RequestMapping(value="/qnaBoardUpdate")
    public String qnaBoardUpdate(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 수정 메서드 호출");

        int result = 0;
        String url = "";

        result = clientQnaBoardService.qnaBoardUpdate(qnaBoard);

        if(result == 1){
            url = "/client/qnaboard/qnaBoard";
        } else{
            url = "/client/qnaboard/qnaUpdateForm";
        }
        return "redirect:"+url;
    }

    @RequestMapping(value = "/qnaBoardDelete", method = RequestMethod.POST)
    public String qnaBoardDelete(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("문의글 삭제 메서드 호출");
        int result = 0;
        String url = "";

        result = clientQnaBoardService.qnaBoardDelete(qnaBoard);
        if(result == 1){
            url = "/client/qnaboard/qnaBoard";

        } else{
            url = "/client/qnaboard/qnaBoardDetail?qna_no="+qnaBoard.getQna_no();
        }
        return "redirect:"+url;

    }

}
