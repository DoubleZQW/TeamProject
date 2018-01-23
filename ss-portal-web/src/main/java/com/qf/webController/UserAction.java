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

    //
    @RequestMapping("/user/add")
    public @ResponseBody String addUserAjax(TbUser tbUser) throws Exception{
        String mess = "";
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
