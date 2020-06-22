package com.icia.dal.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class FiledController {
	
	@GetMapping("/field_sport/list")
	public ModelAndView sportList() {
		// 분야 선택 후 스포츠 세부분야 리스트 페이지로 이동
		return new ModelAndView("main").addObject("viewName","field/sport_list.jsp");
	}
	@GetMapping("/field_art/list")
	public ModelAndView artList() {
		// 분야 선택 후 미술 세부분야 리스트 페이지로 이동
		return new ModelAndView("main").addObject("viewName","field/art_list.jsp");
	}
	@GetMapping("/field_music/list")
	public ModelAndView musicList() {
		// 분야 선택 후 음악 세부분야 리스트 페이지로 이동 
		return new ModelAndView("main").addObject("viewName","field/music_list.jsp");
	}
	
	@GetMapping("/field/list")
	public ModelAndView fieldList() {
		// 세부분야 선택 후 세부분야 페이지로 이동
		// 세부분야의 정보, 세부분야 달인 리스트 필요
		return new ModelAndView("main").addObject("viewName","field/list.jsp");
	}
}
