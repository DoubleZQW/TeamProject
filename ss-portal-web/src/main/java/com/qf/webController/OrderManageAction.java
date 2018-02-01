package com.qf.webController;

import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.pojo.TbUser;
import com.qf.service.OrderService;
import com.qf.vo.TbOrderCustom;
import com.qf.vo.TbOrderQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class OrderManageAction {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrderService orderService;

    /**
     * 用户订单分页查询
     * @param session
     * @param page
     * @param query
     * @return
     */
    @RequestMapping(value = "/order/query", method = RequestMethod.GET)
    public ModelAndView findOrderByUser(HttpSession session, Page page, TbOrderQuery query) {
        ModelAndView mav=new ModelAndView("order");
//        获取用户
        TbUser user = (TbUser) session.getAttribute("sess");
        Result<TbOrderCustom> result = null;
        try {
//           根据用户id查询订单
            query.setUid(user.getUserId());
            result = orderService.listOrdersById(page, query);
            mav.addObject("result",result);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return mav;
    }
}
