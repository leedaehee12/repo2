package com.javateam.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javateam.project.domain.MemberVO;
import com.javateam.project.domain.QnaVO;
import com.javateam.project.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("qna")
@Slf4j
public class QnaController {
	
	@Inject
	QnaService qnaSvc;
	
	@RequestMapping("qnaList")
	public String qnaList(HttpSession session, Model model) {
		
		log.info("qnaList");
		
		String id = ((MemberVO)session.getAttribute("LOGIN_USER")).getId();
		model.addAttribute("qnaList", qnaSvc.listQna(id));
		
		return "/qna/qna_list";
	}
	
	@RequestMapping("qnaView")
	public String qnaView(int qseq, Model model) {
		
		log.info("qnaView");
		
		model.addAttribute("qnaVO", qnaSvc.getQna(qseq));
		
		return "/qna/qna_view";
	}
	
	@RequestMapping("qnaWriteForm")
	public String qnaWriteForm() {
		
		log.info("qnaWriteForm");
		return "/qna/qna_write";
	}

	@RequestMapping("qnaWrite")
	public String qnaWrite(QnaVO qnaVO, HttpSession session, Model model) {
		
		log.info("qnaWrite : " + qnaVO);
		String msg = "";
		String movePath = "";		
		
		String id = ((MemberVO)session.getAttribute("LOGIN_USER")).getId();
		qnaVO.setId(id);
		
		if (qnaSvc.insertQna(qnaVO) == true) {
			
			msg = "게시글 저장에 성공하였습니다";
			movePath = "/qna/qnaList";
			
		} else {
			
			msg = "게시글 저장에 실패하였습니다";
			movePath = "/qna/qnaWriteForm";
		}
		
		model.addAttribute("err_msg", msg);
		model.addAttribute("move_path", movePath);
		
		return "/error/error";
	}
}
