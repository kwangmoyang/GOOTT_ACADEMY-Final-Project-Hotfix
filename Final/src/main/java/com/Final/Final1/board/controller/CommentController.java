package com.Final.Final1.board.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Final.Final1.board.model.CommentDTO;
import com.Final.Final1.board.service.CommentService;


@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService; 
	
	@ResponseBody
	@RequestMapping("comment/insert")
	public ModelAndView insert(CommentDTO dto) {
		commentService.insert(dto);
		List<CommentDTO> list = commentService.list(dto.getPost_num());
		ModelAndView mv = new ModelAndView();
		
		int count = commentService.count(dto.getPost_num());
		
		mv.setViewName("board/comment_list");
		
		mv.addObject("list", list);
		mv.addObject("count", count);
		return mv;
		
		
	}
	
	@RequestMapping("comment/list")
	public ModelAndView list(int Post_num, ModelAndView mv) {
		
		List<CommentDTO> list = commentService.list(Post_num);
		int count = commentService.count(Post_num);
		
		mv.setViewName("board/comment_list");
		
		mv.addObject("list", list);
		mv.addObject("count", count);
		return mv;
	}				
	
	  @ResponseBody
	  @RequestMapping("comment/delete")
	  public ModelAndView delete(@RequestBody Map<String, Object> map) {
		 System.out.println(map);
		  ModelAndView mv = new ModelAndView();
		
		  commentService.remove(map);
		  
		  mv.setViewName("redirect:/list"); 	 
		 
		    return mv; 
	  }
	  
	
}













