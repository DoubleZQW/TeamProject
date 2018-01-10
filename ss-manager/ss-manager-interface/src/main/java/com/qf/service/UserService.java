package com.qf.service;

import com.qf.dto.Page;
import com.qf.dto.Sort;
import com.qf.pojo.TbUser;
import com.qf.vo.PageVo;
import com.qf.vo.TbUserCustom;

import java.util.List;

public interface UserService {
    TbUser getById(Long id);

    List<TbUser> findAll();

    PageVo<TbUserCustom> listUserByPage(TbUserCustom user, Page page, Sort sort);

    int deleteUserByIds(List ids);
}
