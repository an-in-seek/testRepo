package com.ymz.common.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ymz.common.category.dao.CategoryDAO;
import com.ymz.common.category.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO dao;
	
	@Override
	public List<Category> getCategoryList(){
		List<Category> list = dao.selectAllCategory();
		return list;
	}
	
	@Override
	public List<Category> getCategoryByFirstId(String categoryId){
		List<Category> category = dao.selectSecondCategoryByFId(categoryId);
		return category;
	}
	
}
