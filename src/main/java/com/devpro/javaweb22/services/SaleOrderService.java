package com.devpro.javaweb22.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb22.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}

}
