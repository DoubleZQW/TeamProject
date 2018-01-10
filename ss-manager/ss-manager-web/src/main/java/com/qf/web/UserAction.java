package com.qf.web;

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Sort;
import com.qf.pojo.TbUser;
import com.qf.service.UserService;
import com.qf.vo.PageVo;


import com.qf.vo.TbUserCustom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserAction {

//    引入service层
    @Autowired
    private UserService userService;

    /**
     * 根据id查询用户
     */
    @ResponseBody
    @RequestMapping(value = "/user/{id}",method = RequestMethod.GET)
    public TbUser findById(@PathVariable("id") Long id){
        return userService.getById(id);
    }

    @ResponseBody
    @RequestMapping(value = "/user/query", method = RequestMethod.GET)
    public PageVo<TbUserCustom> listUserByPage(TbUserCustom user, Page page, Sort sort) {
        PageVo<TbUserCustom> pageVo = new PageVo<TbUserCustom>();
        pageVo = userService.listUserByPage(user,page,sort);
        return pageVo;
    }

    @ResponseBody
    @RequestMapping(value = "user/remove", method = RequestMethod.POST)
    public int removeUserByIds(@RequestParam("ids[]")List ids) {
        int i=0;
        i = userService.deleteUserByIds(ids);
        return i;
    }
}
