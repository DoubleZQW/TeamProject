package com.qf.service;

/**
 * 用户的service层
 */

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

   //添加用户
     int addUser(TbUser tbUser);


//   根据userId查询UserCustom
    TbUserCustom getUserCustomById(Long userId);

// 根据用户名查找用户
    TbUser findByName(TbUser tbUser);


//    更新用户
    int  updateUser(TbUser user);

// 用户登录
    int login(String TbName,String TbPassword);
}

