package com.devpro.javaweb22.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.dto.ProductSerach;
import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.services.BaseService;
import com.devpro.javaweb22.services.PagerData;
import com.devpro.javaweb22.services.ProductService;

@Controller
public class AdminProductController extends BaseController {
	
	@Autowired
	private ProductService productService;
	
	//ex: /admin/product/management/144 (thông tin sản phẩm có id = 144) <=> Path Variable
	//ex: /admin/product/management?productId=144						 <=> request param
	@RequestMapping(value = { "/admin/product/management/{productId}" }, method = RequestMethod.GET)
	public String adminProductDetail(final Model model, 
							   		 final HttpServletRequest request,
								   	 final HttpServletResponse response, 
								   	 @PathVariable("productId") int productId) throws IOException {

		// lấy product trong db theo ProductId
		Product productInDatabase = productService.getById(productId);
		model.addAttribute("product", productInDatabase);
		
		return "administrator/product_management";
		
	}
	
	@RequestMapping(value = { "/admin/product/management" }, method = RequestMethod.GET)
	public String adminProductAdd(final Model model, 
								  final HttpServletRequest request,
							  	  final HttpServletResponse response) throws IOException {
		// khởi tạo 1 product(entity) mới
		Product newProduct = new Product();
		model.addAttribute("product", newProduct); // đẩy data xuống view
		
		// trả về view
		return "administrator/product_management";
	}
	
	@RequestMapping(value = { "/admin/product/management" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, 
										  final HttpServletRequest request,
										  final HttpServletResponse response, 
										  @ModelAttribute("product") Product product, //spring-form binding
										  @RequestParam("productAvatar") MultipartFile productAvatar,
										  @RequestParam("productPictures") MultipartFile[] productPictures) throws Exception {
		// kiểm tra xem thông tin product đẩy lên khi click submit nên là tạo mới hay chỉnh sửa
		if(product.getId() != null && product.getId() > 0) { //chỉnh sửa sản phẩm
			productService.updateProduct(product, productAvatar, productPictures);
		} else { //thêm mới
			productService.saveProduct(product, productAvatar, productPictures);	
		}
		
		// trở về trang danh sách sản phẩm
		return "redirect:/admin/product/list";
	}

	@RequestMapping(value = { "/admin/product/list" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		// lấy thông tin từ request param
		String keyword = request.getParameter("keyword");
		Integer categoryId = 0;
		try {
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		} catch (Exception e) { };
		Integer currentPage = BaseService.NO_PAGING; //mặc định luôn là page số 1
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) { };
				
		// set các giá trị lấy được vào ProductSearch dto
		ProductSerach productSerach = new ProductSerach();
		productSerach.setKeyword(keyword);
		productSerach.setCategoryId(categoryId);
		productSerach.setCurrentPage(currentPage);
		
		PagerData<Product> products = productService.searchProduct(productSerach);;
		
		model.addAttribute("productSerach", productSerach);
		model.addAttribute("products", products);
		
		return "administrator/product_list";
		
	}
	
}
