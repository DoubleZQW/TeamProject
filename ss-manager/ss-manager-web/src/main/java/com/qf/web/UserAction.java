package com.qf.web;

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.pojo.TbUser;
import com.qf.service.UserService;
import com.qf.vo.TbUserCustom;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
public class UserAction {
    private Logger logger= LoggerFactory.getLogger(this.getClass());

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

    /**
     * 分页查询用户
     * @param user
     * @param page
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/user/query", method = RequestMethod.GET)
    public Result<TbUserCustom> listUserByPage(TbUserCustom user, Page page, Order order) {
        Result<TbUserCustom> result = null;
        try {
            result = userService.listUserByPage(user,page,order);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 可批量删除用户
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "user/remove", method = RequestMethod.POST)
    public int removeUserByIds(@RequestParam("ids[]") List ids) {
        int i=0;
        try {
            i = userService.deleteUserByIds(ids);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}
