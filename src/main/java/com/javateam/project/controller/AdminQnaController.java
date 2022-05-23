package com.javateam.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javateam.project.domain.PageVO;
import com.javateam.project.domain.QnaVO;
import com.javateam.project.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("admin")
@Slf4j
public class AdminQnaController {
	
	@Inject
	QnaService qnaSvc;
	
	@RequestMapping("/qna/qnaList")
	public String qnaList(@RequestParam(value="page", defaultValue="1") int page,
						  @RequestParam(value="limit", defaultValue="5") int limit,
						  Model model) {
		
		log.info("admin qnaList");
		
		List<QnaVO> qnaList = qnaSvc.listQnaByPaging(page, limit);
		
		int totalQnasCount = qnaSvc.getTotalQnasCount();
		
		// 마지막 페이지
		int startPage = 1;
		int maxPage = (int)((double)totalQnasCount/limit + 0.95); 
		
		PageVO pageVO = new PageVO();
		pageVO.setCurrPage(page);
		pageVO.setStartPage(startPage);		
		pageVO.setEndPage(maxPage);
		pageVO.setLimit(limit);
		pageVO.setMaxPage(maxPage);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageVO", pageVO);
		
		return "/admin/qna/qna_list";
	}
	
	@RequestMapping("/qna/qnaDetailForm")
	public String qnaDetail(@RequestParam("qseq") int qseq, Model model) {
		
		log.info("qnaDetail");
		
		model.addAttribute("qnaVO", qnaSvc.getQna(qseq));
		
		return "/admin/qna/qna_detail";
	}
	
	@RequestMapping("/qna/qnaRepsave")
	public String qnaRepsave(@RequestParam("qseq") int qseq, 
							 @RequestParam("reply") String reply,
						 	 Model model) {
		
		log.info("qnaRepsave");
		String msg = "";
		String movePath = "";	
		
		if (qnaSvc.updateQna(qseq, reply) == true) {
			
			msg = "게시글 답글 저장(수정)에 성공하였습니다";
			movePath = "/admin/qna/qnaList";
			
		} else {
			
			msg = "게시글 답글 저장(수정)에 실패하였습니다";
			movePath = "/admin/qna/qnaWriteForm";
		}
		
		model.addAttribute("err_msg", msg);
		model.addAttribute("move_path", movePath);
		
		return "/error/error";
	}

}
