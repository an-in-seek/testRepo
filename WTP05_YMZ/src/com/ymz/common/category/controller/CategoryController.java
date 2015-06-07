package com.ymz.common.category.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ymz.common.category.service.CategoryService;
import com.ymz.common.category.vo.Category;

@Controller
@RequestMapping("/category/")
public class CategoryController {

	@Autowired
	private CategoryService service;
	
	// 카테고리 전체목록 조회
	@RequestMapping("login/categoryList.do")
	@ResponseBody
	public ModelAndView categoryList() {
		List<Category> categoryList = service.getCategoryList();
		return new ModelAndView("qna/qna_modify_form.tiles", "categoryList", categoryList);
	}
	
	@RequestMapping("login/category.do")
	@ResponseBody
	public ModelAndView CategoryView(@RequestParam String categoryId) {
		List<Category> categoryList = service.getCategoryByFirstId(categoryId);
		return new ModelAndView("qna/qna_modify_form.tiles", "categoryList", categoryList);
	}
}
