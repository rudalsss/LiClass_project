package com.liclass.client.post.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.liclass.client.login.vo.UserVO;
import com.liclass.client.post.service.PostService;
import com.liclass.client.post.vo.PostVO;
import com.liclass.common.file.PostFileUpload;

import lombok.Setter;

@Controller
@SessionAttributes("loginUser")
public class PostController {
	
	@Setter(onMethod_ = @Autowired)
	private PostService postService;
	@Setter(onMethod_ = @Autowired)
	private PostFileUpload fileUploadUtil;
	
	/************************************************
	 * 1.post 등록
	 * 요청 url : http://localhost:8080/posting
	************************************************/
	@PostMapping("/posting")
	public String posting(PostVO vo,Model model,@RequestParam("file") MultipartFile file)throws Exception{
		//사진등록
		vo.setFile(file);
		if(vo.getFile().getSize() > 0) {
			String post_img = PostFileUpload.fileUpload(vo.getFile(),String.valueOf(vo.getUser_no()));
			vo.setPost_img(post_img);
		}else {
			vo.setPost_img("default-post-img.jpg");
		}
		
		int result = postService.postInsert(vo);
		if(result == 1) {
			return "redirect:/mypage/myPost";
		}else {
			model.addAttribute("message", "포스팅에 실패하였습니다. 잠시후 다시 시도해주세요");
		}
		return "client/mypage/postingForm";
	}
	/************************************************
	 * 2.post 수정화면
	 * 요청 url : http://localhost:8080/updatePostingForm
	************************************************/
	@GetMapping("/updatePostingForm")
	public String updatePostingForm(int post_no,Model model,HttpSession session){
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "/";
		}else {
			PostVO vo = new PostVO();
			vo.setPost_no(post_no);
			PostVO originPost = postService.postDetail(vo);
			model.addAttribute("originPost",originPost);
		}
		return "client/mypage/updatePostingForm";
	}
	/************************************************
	 * 3. post 수정 처리
	 * 요청 url : http://localhost:8080/updatePosting
	************************************************/
	@PostMapping("/updatePosting")
	public String updatePosting(PostVO vo,Model model,@RequestParam("file") MultipartFile file)throws Exception{


		String originImg = vo.getUser_img();
		if(file != null) {
			
			//1. 기존 사진을 서버에서 지운다.
			if(originImg != "default-post-img.jpg") {
				PostFileUpload.fileDelete(originImg);
			}
			
			//사진등록
			vo.setFile(file);
			if(vo.getFile().getSize() > 0) {
				String post_img = PostFileUpload.fileUpload(vo.getFile(),String.valueOf(vo.getUser_no()));
				vo.setPost_img(post_img);
			}
		}else {
			vo.setPost_img("default-post-img.jpg");
		}
		int result = postService.postUpdate(vo);
		if(result == 1) {
			return "redirect:/mypage/myPost";
		}else {
			model.addAttribute("message", "포스팅에 실패하였습니다. 잠시후 다시 시도해주세요");
		}
		return "redirect:/mypage/myPost";
	}
	/************************************************
	 * 4. post 삭제 처리
	 * 요청 url : http://localhost:8080/deletePosting
	************************************************/
	@PostMapping("/deletePosting")
	public String deletePosting(PostVO vo,Model model,@RequestParam("file") MultipartFile file)throws Exception{


		String originImg = vo.getUser_img();
		if(file != null) {
			
			//1. 기존 사진을 서버에서 지운다.
			if(originImg != "default-post-img.jpg") {
				PostFileUpload.fileDelete(originImg);
			}
		}
		int result = postService.postDelete(vo);
		if(result == 1) {
			return "redirect:/mypage/myPost";
		}else {
			model.addAttribute("message", "포스팅에 실패하였습니다. 잠시후 다시 시도해주세요");
		}
		return "redirect:/mypage/myPost";
	}
}
