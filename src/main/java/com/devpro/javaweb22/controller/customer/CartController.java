package com.devpro.javaweb22.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.dto.Cart;
import com.devpro.javaweb22.dto.CartItem;
import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.model.SaleOrder;
import com.devpro.javaweb22.model.SaleOrderProducts;
import com.devpro.javaweb22.services.ProductService;
import com.devpro.javaweb22.services.SaleOrderService;

@Controller
public class CartController extends BaseController {

	@Autowired
	private SaleOrderService saleOrderService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.GET)
	public String cartCheckout(final Model model, 
							   final HttpServletRequest request, 
							   final HttpServletResponse response ) throws IOException {

		return "customer/cart"; // -> đường dẫn tới View.
	}
	
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String cartFinished(final Model model, 
							   final HttpServletRequest request, 
							   final HttpServletResponse response) throws IOException {
		
		// Lấy thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerEmail 	= request.getParameter("customerEmail");
		String customerPhone 	= request.getParameter("customerPhone");
		String customerAddress 	= request.getParameter("customerAddress");

		// tạo hóa đơn + với thông tin khách hàng lấy được
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setTotal(calculateTotalPrice(request));
		saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // mã hóa đơn
//		saleOrder.setTotal(getTotalItems(request));
		// lấy giỏ hàng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
		// lấy sản phẩm trong giỏ hàng
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuality());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}
		
		// lưu vào database
		saleOrderService.saveOrUpdate(saleOrder);
		
		// thực hiện reset lại giỏ hàng của Session hiện tại
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", 0);
		
		return "customer/cart_success"; // -> đường dẫn tới View.
		
	}
	
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model,
														      final HttpServletRequest request,
														      final HttpServletResponse response, 
														      final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu sản phẩm muốn bổ sùng vào giỏ hàng có trong giỏ hàng nếu có thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// tăng số lượng sản phẩm lên
				item.setQuality(item.getQuality() + cartItem.getQuality());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPriceSale());
			cartItem.setImage(productInDb.getAvatar());

			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
		}

		// tính tổng tiền
//		this.calculateTotalPrice(request);
		session.setAttribute("totalPrice", calculateTotalPrice(request));
//		Product product = productService.getById(cartItem.getProductId());
//		session.setAttribute("product2", product);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));

		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/ajax/updateToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_UpdateToCart(final Model model,
															  final HttpServletRequest request,
															  final HttpServletResponse response,
															  final @RequestBody CartItem cartItem) {
		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;

		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}
		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		int currentProductQuality = 0;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				// tăng số lượng sản phẩm lên
				currentProductQuality = item.getQuality() + cartItem.getQuality();
				item.setQuality(currentProductQuality);
			}
		}

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems",getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);

		session.setAttribute("totalItems",getTotalItems(request));
		session.setAttribute("totalPrice", calculateTotalPrice(request));
		Product product = productService.getById(cartItem.getProductId());
		model.addAttribute("product2", product);
		return ResponseEntity.ok(jsonResult);
	}


	@RequestMapping(value = { "/ajax/deleteCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_deleteCart(final Model model,
															   final HttpServletRequest request,
															   final HttpServletResponse response,
															   final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		int currentProductQuality = 0;
		int index = 0;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				cart.getCartItems().remove(index);
				break;
			}
			else {
				index+=1;
			}
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);

		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("currentProductQuality", currentProductQuality);
//		jsonResult.put("totalPrice", calculateTotalPrice(request));
		session.setAttribute("totalPrice", calculateTotalPrice(request));
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	private BigDecimal calculateTotalPrice(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("cart") == null) {
			return BigDecimal.valueOf(2);
		}
		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		BigDecimal total = BigDecimal.valueOf(0);
		for (CartItem item : cartItems) {
			BigDecimal soluong = BigDecimal.valueOf(item.getQuality());
			total = total.add(soluong.multiply(item.getPriceUnit()));
		}
		return total;
	}

	/**
	 * hàm trả về số lượng sản phẩm có trong giỏ hàng
	 *
	 * @param request
	 * @return
	 */
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuality();
		}
		return total;
	}
}
