package com.qf.service;

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.pojo.TbUser;
import com.qf.vo.TbUserCustom;

import java.util.List;

public interface UserService {
//    根据id查询用户
    TbUser getById(Long id);

//    分页查询用户
    Result<TbUserCustom> listUserByPage(TbUserCustom user, Page page, Order order);

//    删除用户
    int deleteUserByIds(List ids);
}
