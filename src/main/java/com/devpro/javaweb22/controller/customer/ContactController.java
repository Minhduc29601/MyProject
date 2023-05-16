package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.model.Contact;
import com.devpro.javaweb22.model.Employee;
import com.devpro.javaweb22.services.ContactService;

@Controller // => spring-bean được quản lí bởi spring-container
public class ContactController extends BaseController {

	//cách sử dụng 1 spring-bean trong một spring-bean khác
	@Autowired // inject spring-bean nghĩa là spring tìm kiếm các spring-bean trong spring-container có type ContactService và set cho biến.
	private ContactService contactService;
	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final Model model, 
						  final HttpServletRequest request, 
						  final HttpServletResponse response)
			throws IOException {
		
		String sql = "select * from tbl_contact where status = 1";
		List<Contact> contacts = contactService.getEntitiesByNativeSQL(sql);
//		System.out.println("SL = " + contacts.size());
		
//		String sql2 = "select * from tbl_contact where id = 21";
//		Contact contact2 = contactService.getEntityByNativeSQL(sql2);
//		System.out.println(contact2.getEmail());
		
//		String fullName = request.getParameter("fullName");
//		System.out.println("fullName = " + fullName);
		
		// đẩy danh sách nhân viên xuống view
		List<Employee> employees = new ArrayList<Employee>();
		employees.add(new Employee(1000, "Nguyen Van A"));
		employees.add(new Employee(1001, "Nguyen Van B"));
		employees.add(new Employee(1002, "Nguyen Van C"));
		model.addAttribute("employees", employees);
		
		// đẩy một data có tên là contactModel xuống view 
		// và có kiểu là Contact => spring-form mới có thể
		// mapping giữa html attribute với class property
		model.addAttribute("contactModel", new Contact());
		
		return "customer/contact";
		
	}
	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String contact_(final Model model, 
						   final HttpServletRequest request, 
						   final HttpServletResponse response)
			throws IOException {

		// lấy dữ liệu từ view đẩy lên thông qua object request
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		System.out.println(firstName + " " + lastName);
		
		// đẩy dữ liệu xuống view thông qua object model
		model.addAttribute("message", "Cảm ơn bạn " + firstName + " " + lastName + " đã liên hệ với chúng tôi.");
		
		return "customer/contact";
		
	}
	
	/**
	 * Để hứng dữ liệu khi click submit button trong một spring form
	 * thì cần sử dụng {@ModelAttribute} và giá trị phải giống với html attribute modelAttribute 
	 */
	@RequestMapping(value = { "/contact-spring-form" }, method = RequestMethod.POST)
	public String contact_post_springform(final Model model, 
									   	  final HttpServletRequest request,
									   	  final HttpServletResponse response, 
									   	  final @ModelAttribute("contactModel") Contact contact) throws IOException {
		System.out.println(contact.getFirstName() + " " + contact.getLastName() + " " + contact.getEmail());
		
		// lưu contact vào trong database
		contactService.saveOrUpdate(contact);
		
		//final @ModelAttribute("contactModel") Contact contact
		// lệnh trên đồng thời cũng đẩy contact xuống view với tên là contactModel
		// <=> model.addAttribute("contactModel", contact);
		// do vậy, cần ghi đề contact mới
		model.addAttribute("contactModel", new Contact());
		
		return "customer/contact";
	}
	
	/**
	 * ajax trả về 1 ResponseEntity có data là 1 kiểu Map không phải view
	 * @RequestBody: để hứng dữ liệu từ ajax đẩy lên
	 * @param model
	 * @param request
	 * @param response
	 * @param contact
	 * @return
	 */
	@RequestMapping(value = { "/contact-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(
			final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody Contact contact) {
		System.out.println(contact.getEmail());
		System.out.println(contact.getMessage());
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("statusCode", 200);
		jsonResult.put("statusMessage", 
						"Cảm ơn bạn " + 
						contact.getEmail() + 
						", Chúng tôi sẽ liên hệ sớm nhất!");
		
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = {"/admin/contact"} , method = RequestMethod.GET)
	public String adminContact ( final Model model,
								 final HttpServletRequest request,
								 final HttpServletResponse response) throws IOException {
		List<Contact> contacts = contactService.findAll();
		model.addAttribute("contacts",contacts);
		return "administrator/contacts";
	}
}
