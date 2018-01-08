package com.qf.service;

import com.qf.pojo.TbUser;

import java.util.List;

public interface UserService {
    TbUser getById(Long id);

    List<TbUser> findAll();
}
