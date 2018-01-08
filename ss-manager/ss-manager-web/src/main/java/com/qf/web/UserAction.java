package com.qf.web;

import com.qf.pojo.TbUser;
import com.qf.service.UserService;
import com.qf.vo.ResultMessage;
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
    @RequestMapping(value = "/user/query", method = RequestMethod.POST)
    public ResultMessage findAll() {
        ResultMessage rm = new ResultMessage();
	    List<TbUser> users = userService.findAll();
	    rm.setData(users);
        return rm;
    }
}
