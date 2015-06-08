package com.ymz.common.category.dao;

import java.util.List;

import com.ymz.common.category.vo.Category;

public interface CategoryDAO {

	public abstract List<Category> selectAllCategory();

	public abstract List<Category> selectSecondCategoryByFId(String categoryId);
	
	//////////////////////////
	public List<Category> selectCategories(String id);
	public String selectCategoryName(String categoryId);
}