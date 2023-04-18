package com.liclass.admin.management.noticeboard.controller;

import com.liclass.admin.management.noticeboard.service.NoticeBoardService;
import com.liclass.admin.management.qnaboard.vo.QnaBoardVo;
import com.liclass.common.vo.PageDTO;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/management/noticeboard/*")
@Slf4j
public class NoticeBoardController {
    @Setter(onMethod_ = @Autowired)
    private NoticeBoardService noticeBoardService;

    @RequestMapping(value = "/noticeBoard", method = RequestMethod.GET)
    public String noticeBoardList(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("noticeBoardList() 메소드 호출");


        //전체 레코드 조회
        List<QnaBoardVo> qnaBoardList = noticeBoardService.noticeBoardList(qnaBoard);
        model.addAttribute("qnaBoardList", qnaBoardList);
        //전체 레코드 수 구현
        int total = noticeBoardService.noticeBoardCnt(qnaBoard);
        model.addAttribute("pageMaker", new PageDTO(qnaBoard, total));

        return "admin/management/noticeboard/noticeBoard";
    }

    //글쓰기 폼 호출
    @RequestMapping(value = "/insertForm")
    public String insertForm(){
        log.info("insertForm 호출");

        return "admin/management/noticeboard/insertForm";
    }

    //글쓰기 처리 메서드
    @RequestMapping(value = "/noticeInsert")
    public String noticeBoardInsert(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("noticeBoardInsert 호출");

        int result = 0;
        String url = "";

        result = noticeBoardService.noticeBoardInsert(qnaBoard);
        if(result == 1){
            url="/management/noticeboard/noticeBoard";
        } else{
            url ="/management/noticeboard/insertForm";
        }
        return "redirect:"+url;
    }
    //공지게시판 상세페이지
    @RequestMapping(value = "/noticeBoardDetail", method = RequestMethod.GET)
    public String noticeBoardDetail(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("qnaBoardDetail 호출");

        QnaBoardVo detail = noticeBoardService.noticeBoardDetail(qnaBoard);
        model.addAttribute("detail", detail);

        return "admin/management/noticeboard/noticeBoardDetail";

    }

    //글 수정 폼 출력하기
    @RequestMapping(value = "/updateForm")
    public String updateForm(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("updateForm 호출");
        log.info("qna_no =" + qnaBoard.getQna_no());

        QnaBoardVo updateData = noticeBoardService.updateForm(qnaBoard);
        model.addAttribute("updateData", updateData);

        return "admin/management/noticeboard/updateForm";
    }

    //글 수정기능 구현하기
    @RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
    public String noticeBoardUpdate(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        log.info("noticeUpdate 호출");
        log.info("qnaBoardVO" + qnaBoard);

        int result = 0;
        String url = "";

        result = noticeBoardService.noticeBoardUpdate(qnaBoard);

        if(result == 1){
            url="/management/noticeboard/noticeBoard";
        } else{
            url ="/management/noticeboard/updateForm";
        }
        return "redirect:"+url;

    }

    //글 삭제기능 구현하기
    @RequestMapping(value = "/noticeDelete", method = RequestMethod.POST)
    public String noticeBoardDelete(@ModelAttribute QnaBoardVo qnaBoard, Model model){
        int result = 0;
        String url ="";

        result = noticeBoardService.noticeBoardDelete(qnaBoard);

        if(result == 1){
            url="/management/noticeboard/noticeBoard";
        } else{
            url ="/management/noticeboard/noticeBoardDetail?qna_no=" + qnaBoard.getQna_no();
        }
        return "redirect:"+url;
    }

    //글 상태값 변경 구현
    @RequestMapping(value = "/noticeStateUpdate", method = RequestMethod.POST)
    public String noticeStateUpdate(@ModelAttribute QnaBoardVo qnaBoard, Model model){

        log.info("noticeStateUpdate 호출");

        noticeBoardService.noticeStateUpdate(qnaBoard);

        return "admin/management/noticeboard/noticeBoard";
    }

}
