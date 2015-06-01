package com.ymz.common.category.dao;

import java.util.List;

import com.ymz.common.category.vo.Category;

public interface CategoryDAO {

	public abstract List<Category> selectAllCategory();

	public abstract Category selectCategoryById(String categoryId);

}