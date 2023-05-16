package com.devpro.javaweb22.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb22.model.Categories;

@Service
public class CategoriesService extends BaseService<Categories> {

	@Override
	protected Class<Categories> clazz() {
		return Categories.class;
	}

}
