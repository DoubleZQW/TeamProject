package com.qf.web;

import com.qf.pojo.TbUser;
import com.qf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    public TbUser findById(@PathVariable("id") Integer id){
        return userService.getById(id);
    }

    @RequestMapping(value = "user/query",method = RequestMethod.GET)
    public String query(){
        return "user-query";
    }

}