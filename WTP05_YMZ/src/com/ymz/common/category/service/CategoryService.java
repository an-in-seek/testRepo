package com.ymz.common.category.service;

import java.util.List;

import com.ymz.common.category.vo.Category;

public interface CategoryService {

	public abstract List<Category> getCategoryList();

	public abstract Category getCategoryById(String categoryId);

}