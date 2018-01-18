package com.qf.web;


import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.pojo.TbUser;
import com.qf.service.UserService;
import com.qf.vo.TbUserCustom;
import com.sun.xml.internal.ws.util.Pool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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

    //预修改,将要修改的user查出放入model中,渲染视图jsp给前端.
    @RequestMapping(value = "user/edit/{userId}", method = RequestMethod.GET)
    public String sentUserToModel(@PathVariable("userId") Long userId, Model model) {
    	TbUserCustom user = userService.getUserCustomById(userId);
        model.addAttribute("user", user);
        return "user-edit";
    }

    /**
     * 更改用户
     */
    @ResponseBody
    @RequestMapping(value = "/user/update",method =RequestMethod.POST)
    public int motifyUser(TbUser user){
        int i=0;
        try {
            i=userService.updateUser(user);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    /*跳转到用户登录界面
     *
     */
    @RequestMapping("/tologin.action")
    public String toLogin(){
        return "login";
    }



    /**
     * 用户登录
     */
    @RequestMapping("/login.action")
    public @ResponseBody String doLogin(TbUser tbUser,HttpSession session,String mess){

        if(tbUser!=null){
            if(tbUser.getUserName().equals("")){
                mess = "0";//用户名不能为空
            }else if(tbUser.getUserPassword().equals("")){
                mess="1";//密码不能为空
            }else{

                TbUser findUser = userService.findByName(tbUser);
                if(findUser!=null){
                    if(findUser.getUserPassword().equals(tbUser.getUserPassword())&&findUser.getUserLevel()==1){
                        session.setAttribute("sessionUser", findUser);
                        mess="3";//表示为管理员登录成功
                    }else if(findUser.getUserPassword().equals(tbUser.getUserPassword())&&findUser.getUserLevel()==2){
                        session.setAttribute("sessionUser", findUser);
                        mess="4";//表示为普通用户登录成功
                    }
                    else{
                        mess="2";//用户或密码错误
                    }
                }else{
                    mess="2";//用户或密码错误
                }
            }
        }
        return mess;
    }

    @RequestMapping("/user/add")
    public @ResponseBody String addUserAjax(TbUser tbUser,String mess) throws Exception{
        System.out.println("用户为"+tbUser);
        if(tbUser!=null){
            TbUser findByNameUser = userService.findByName(tbUser);//查看是否用户名是否已经被注册过
            if(findByNameUser!=null){
                mess = "110";//返回用户名注册重复
            }else{
                if(tbUser.getUserName().equals("")){
                    mess="0";//返回用户名不能为空
                }else if(tbUser.getUserPassword().equals("")){
                    mess="1";//返回用户密码不能为空；
                }else if(tbUser.getUserPhone().equals("")){
                    mess = "2";//返回用户手机号码不能为空；
                }else if(tbUser.getUserOthername().equals("")){
                    mess = "3";//返回用户昵称不能为空
                }else{
                 int addUserInt=userService.addUser(tbUser);
                   System.out.println("增加用户返回值为:"+addUserInt);


                    if(addUserInt==1){
                        mess = "4";//返回添加成功
                    }else{
                        mess="5";//返回添加失败
                    }

                }
            }
        }

        System.out.println("最后mess为"+mess);
        return mess;
    }

}
