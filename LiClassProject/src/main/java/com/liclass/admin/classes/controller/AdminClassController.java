package com.liclass.admin.classes.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liclass.admin.classes.service.AdminClassService;
import com.liclass.admin.classes.vo.AdminClassVO;
import com.liclass.admin.img.vo.AdminClassImgVO;
import com.liclass.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdminClassController {
	
	@Setter(onMethod_=@Autowired )
	private AdminClassService classService;

	/* 페이징 처리된 전체 클래스 조회 */
	@GetMapping( "/class/classList" )
	public String classList( Model model , @ModelAttribute AdminClassVO liclass ) {
		log.info("classList 호출...");
		List<AdminClassVO> classList = classService.classList(liclass);
		model.addAttribute("classList", classList);
		
		int total = classService.classListCnt(liclass);
		model.addAttribute("pageMaker", new PageDTO(liclass, total));
		return "admin/class/classList";
	}
	
	/* 하나의 클래스 상세조회 ( 클래스 + 센터 ) */
	@GetMapping("/class/classDetail")
	public String classDetail(@RequestParam("c_no") int number, Model model) {
		Map<String, String> liclass = classService.classDetail2(number);
		model.addAttribute("liclass",liclass);	 //map객체를 넘긴다.. ( 레코드 한줄의 컬럼명(대문자?) + 대응값 )
		
		//해당클래스의 사진정보도 함께 넘긴다..
		List<AdminClassImgVO> list = classService.imgList(number);
		model.addAttribute("imgList", list);
		return "admin/class/classDetail";
	}
	
	/*클래스 등록화면 */
	@GetMapping("/class/writeForm")
	public String writeForm() {
		return "admin/class/classForm";
	}
	
	/*클래스 등록처리( 클래스 + 이미지 등록(fileList필드로 받아옴) )*/
	@PostMapping("/class/classInsert")
	public String classInsert( @ModelAttribute AdminClassVO liclass ) throws Exception {
		int result = classService.classInsert(liclass);
		if(result==1) {
			return "redirect:/admin/class/classList";
		} else {
			return "redirect:/admin/class/wirteForm";
		}
		
	}
	
	/* 클래스 수정화면 ( 클래스 + 이미지 정보 ) */
	@GetMapping("/class/updateForm")
	public String classForm( @ModelAttribute AdminClassVO vo, Model model ) {
		AdminClassVO updateData = classService.updateForm(vo.getC_no());
		model.addAttribute("updateData", updateData);
		
		//해당클래스의 사진정보묶음들 함께 넘긴다..
		List<AdminClassImgVO> list = classService.imgList(vo.getC_no());
		model.addAttribute("imgList", list);
		return "admin/class/classUpdate";
	}
	
	/* 클래스 수정처리( 클래스만 수정 )  */
	@PostMapping("/class/classUpdate")
	public String classUpdate( @ModelAttribute AdminClassVO vo , @ModelAttribute AdminClassImgVO img ) {
		int result = 0;
		result = classService.classUpdate(vo);
		if(result==1) {
			return "redirect:/admin/class/classDetail?c_no="+vo.getC_no();
		} else  {
			return "redirect:/admin/class/updateForm?c_no="+vo.getC_no(); 
		}
	}
	
	/* 클래스 삭제처리( 클래스 + 전체 이미지 삭제 ) */
	@PostMapping("/class/classDelete")
	public String classDelete( @ModelAttribute AdminClassVO liclass ) throws Exception{
		int result = 0;
		result = classService.classDelete(liclass);
		
		if(result==1) {
			return "redirect:/admin/class/classList";
		} else {
			return "redirect:/admin/class/classDetail?b_num="+liclass.getC_no();
		}
	}
	
	/*사진변경 화면으로 이동*/
	@GetMapping("/image/imageUpdate")
	public String imageUpdate( @RequestParam("c_no") int number, Model model ) {
		List<AdminClassImgVO> list = classService.imgList(number);
		model.addAttribute("imgList", list);
		return "admin/class/classImgUpdate";
	}

	/*이미지 삭제처리*/
	@ResponseBody
	@PostMapping( value="/image/imageDelete", produces = "text/plain;charset=utf-8" )
	public String imageDelete( @ModelAttribute AdminClassImgVO vo ) throws Exception{
		int result = classService.imgDel2(vo);
		return (result==1) ? "사진삭제" : "삭제실패";
	}
	
	/*이미지 수정(대체)*/
	@ResponseBody
	@PostMapping( value="image/imageChange", produces = "text/plain;charset=utf-8" )
	public String imageUpdate( @ModelAttribute AdminClassImgVO vo ) throws Exception{
		int result = classService.imgUpd(vo);
		return (result==1) ? "사진변경" : "수정실패";
	}
	
	/*이미 추가*/
	@ResponseBody
	@PostMapping( value="image/imageAdd", produces = "text/plain;charset=utf-8" )
	public String imageInsert( @ModelAttribute AdminClassImgVO vo ) throws Exception{
		int result = classService.imgInsert(vo);
		return(result==1) ? "사진등록" : "등록실패";
	}
	
	/*이미지 갯수 카운트*/
	@ResponseBody
	@RequestMapping( value="image/imageCnt", produces = "text/plain;charset=utf-8" )
	public String imageCnt( @RequestParam int c_no ) {
		int cnt = classService.imgCnt(c_no);
		return Integer.toString(cnt);
	}
	
}
