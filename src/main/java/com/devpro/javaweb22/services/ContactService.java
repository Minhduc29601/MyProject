package com.devpro.javaweb22.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb22.model.Contact;

@Service // => spring-bean được quản lí bởi spring-container
public class ContactService extends BaseService<Contact> {

	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}

}
