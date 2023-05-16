package com.devpro.javaweb22.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.controller.BaseController;

/**
 * Tên controller luôn bắt đầu bằng Amin
 * @author daing
 *
 */
@Controller
public class AdminHomeController extends BaseController {

	/**
	 * với các request cho admin ui luôn càn phải bắt đầu bằng "/admin" vì sẽ được
	 * sử dụng trong module spring-security
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
	public String home(final Model model, 
					   final HttpServletRequest request, 
					   final HttpServletResponse response)
			throws IOException {
		return "customer/home";
	}
	
}
