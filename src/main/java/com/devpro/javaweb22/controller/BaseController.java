package com.devpro.javaweb22.controller;

import java.util.List;


import com.devpro.javaweb22.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;



import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.devpro.javaweb22.model.Categories;
import com.devpro.javaweb22.services.CategoriesService;

public abstract class BaseController {

	@Autowired
	private CategoriesService categoriesService;
	
	@ModelAttribute("categories")
	public List<Categories> getAllCategories() {
		return categoriesService.findAll();
	}

	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined instanceof UserDetails)

			return (User) userLogined;

		return new User();
	}
}
