package com.devpro.javaweb22.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devpro.javaweb22.model.Role;
import com.devpro.javaweb22.model.User;
import com.devpro.javaweb22.services.RoleService;
import com.devpro.javaweb22.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController extends BaseController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(final Model model, 
					   	final HttpServletRequest request, 
					   	final HttpServletResponse response)
			throws IOException {
		return "login";
	}
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String register(final Model model,
						   final HttpServletRequest request,
						   final HttpServletResponse response
	) {
		User newUser = new User();
		model.addAttribute("user", newUser);

		return "customer/register"; // -> /WEB-INF/views/customer/index.jsp
	}
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public String newUser(final Model model,
						  final HttpServletRequest request,
						  final HttpServletResponse response,
						  @ModelAttribute("user") User user
	) {

		Role role = roleService.getById(2);
		if(userService.loadUserByUsername(user.getUsername())==null) {
			if(user.getEmail()==null||user.getPhone()==null||user.getShippingAddress()==null||user.getPassword()==null||user.getUsername()==null
					||user.getEmail().isEmpty()||user.getPhone().isEmpty()||user.getShippingAddress().isEmpty()||user.getPassword().isEmpty()||user.getUsername().isEmpty()) {

				model.addAttribute("message","Vui lòng nhập đầy đủ thông tin");
				return "customer/register";
			}
			else {
				user.addRoles(role);
				user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
				userService.saveOrUpdate(user);
				return "login";
			}
		}
		else {
			model.addAttribute("message","Tài khoản đã tồn tại!");
			return "customer/register";
		}
		// -> /WEB-INF/views/customer/index.jsp
	}
}
