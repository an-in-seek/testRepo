package com.ymz.common.category.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ymz.common.category.vo.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	private String namespace="category.dao.CategoryMapper.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Category> selectAllCategory(){
		return session.selectList(namespace+"selectAllCategory");
	}
	
	@Override
	public List<Category> selectSecondCategoryByFId(String categoryId){
		return session.selectList(namespace+"selectSecondCategoryByFId", categoryId);
	}

	@Override
	public List<Category> selectCategories(String id) {
		return session.selectList(namespace+"selectCategories", id);
	}

	@Override
	public String selectCategoryName(String categoryId) {
		return session.selectOne(namespace+"selectCategoryName", categoryId);
	}
}
