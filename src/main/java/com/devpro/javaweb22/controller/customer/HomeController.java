package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devpro.javaweb22.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.services.ProductService;

@Controller
public class HomeController extends BaseController {

	@Autowired
	private ProductService productService;


	@RequestMapping(value = { "/","home" }, method = RequestMethod.GET)
	public String home(final Model model, 
					   final HttpServletRequest request, 
					   final HttpServletResponse response)
			throws IOException {
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		
		return "customer/home";
	}

	@RequestMapping(value = { "/home/detail/{productId}" },  method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
								   final HttpServletResponse response ,
								   @PathVariable("productId") int productId) throws IOException {
		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		return "customer/detail";
	}
}
