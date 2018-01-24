package com.qf.webController;

import com.qf.pojo.TbUser;
import com.qf.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class UserAction {
    private Logger logger= LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    public @ResponseBody String doLogin(TbUser tbUser,HttpSession session){
        String mess = "";
        if(tbUser!=null){
            if(tbUser.getUserName().equals("")){
                mess = "0";//用户名不能为空
            }else if(tbUser.getUserPassword().equals("")){
                mess="1";//密码不能为空
            }else{

                TbUser findUser = userService.findByName(tbUser);
                if(findUser!=null){
                    if(findUser.getUserPassword().equals(tbUser.getUserPassword())&&findUser.getUserLevel()==1){
                        session.setAttribute("sess", findUser);
                        mess="3";//表示为管理员登录成功
                    }else if(findUser.getUserPassword().equals(tbUser.getUserPassword())&&findUser.getUserLevel()==2){
                        session.setAttribute("sess", findUser);
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

    /**
     * 验证用户名
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/user/checkName",method = RequestMethod.GET)
    public String checkUserName(TbUser user){
        try {
            TbUser findUser = userService.findByName(user);
            if(findUser!=null){
                return "false";
            }else{
                return "true";
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return "false";
    }

    /**
     * 添加用户
     */
    @ResponseBody
    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    public String saveUser(TbUser user){
        try {
            int i=userService.save(user);
            if (i>0){
                return "true";
            }else {
                return "false";
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return "false";
    }


}
