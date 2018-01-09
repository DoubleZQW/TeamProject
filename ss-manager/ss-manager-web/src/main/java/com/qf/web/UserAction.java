package com.qf.web;

import com.qf.dto.Page;
import com.qf.dto.Sort;
import com.qf.pojo.TbUser;
import com.qf.service.UserService;
import com.qf.vo.ResultMessage;
import com.qf.vo.UserVo;
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
    public UserVo findAll(TbUser user, Page page, Sort sort) {

        UserVo userVo = new UserVo();

	    List<TbUser> users = userService.findAll();
	    userVo.setTotal((double) users.size());
	    userVo.setRows(users);
        return userVo;
    }
}
