package com.devpro.javaweb22.services;

import com.devpro.javaweb22.model.BaseEntity;

public interface MappingCustomEntity<E extends BaseEntity> {
	public E convert(Object[] data);
}
