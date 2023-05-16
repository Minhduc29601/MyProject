package com.devpro.javaweb22.controller.administrator;

import com.devpro.javaweb22.controller.BaseController;
import com.devpro.javaweb22.model.SaleOrder;
import com.devpro.javaweb22.services.BaseService;
import com.devpro.javaweb22.services.PagerData;
import com.devpro.javaweb22.services.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class SeoOrderController extends BaseController {
    @Autowired
    SaleOrderService saleOrderService;


    @RequestMapping(value = "/admin/saleoder" , method = RequestMethod.GET)
    String ShowSaleOder(final Model model,
                        final HttpServletRequest request,
                        final HttpServletResponse response) throws IOException {
        List<SaleOrder> saleOrders = saleOrderService.findAll();

        model.addAttribute("saleOder" , saleOrders);
        PagerData<SaleOrder> saleOderPage = new PagerData<SaleOrder>();
        saleOderPage.setSizeOfPage(5);
        saleOderPage.setCurrentPage(1);
        saleOderPage.setData(saleOrders);
        model.addAttribute("saleOder2" , saleOderPage);
        return "administrator/seoorder";
    }
}
