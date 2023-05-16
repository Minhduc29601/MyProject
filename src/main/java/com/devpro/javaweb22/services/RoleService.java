package com.devpro.javaweb22.services;

import com.devpro.javaweb22.model.Role;
import org.springframework.stereotype.Service;

@Service
public class RoleService extends BaseService<Role>{
    @Override
    protected Class<Role> clazz() {
        return Role.class;
    }
}