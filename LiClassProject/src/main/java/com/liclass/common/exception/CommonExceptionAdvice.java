package com.liclass.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;

@ControllerAdvice//이 컨트롤러는 발생하는 예외를 처리하는거야 라고 명시하는 용도
@Slf4j
public class CommonExceptionAdvice {
	
	@ExceptionHandler(Exception.class) //500번대 에러
	public String exceptionMethod(Exception ex, Model model) {
		log.error("exceptionMethod()" + ex.getMessage());
		model.addAttribute("exception",ex);
		return "common/error/error_500";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class) //400번대 에러
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		log.error("handle404()" + ex.getMessage());
		return "common/error/error_404";
	}
}
