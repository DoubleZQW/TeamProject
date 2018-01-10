package com.qf.web;

/**
 * 订单管理Action
 */

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.pojo.TbOrder;
import com.qf.service.OrderService;
import com.qf.vo.TbOrderCustom;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderAction {
    private Logger logger= LoggerFactory.getLogger(this.getClass());

//    引入订单service层
    @Autowired
    private OrderService orderService;

    /**
     * 分页查询订单
     */
    @ResponseBody
    @RequestMapping(value = "/order/query",method = RequestMethod.GET)
    public Result<TbOrder> findAllOrder(Page page, TbOrderCustom query, Order order){
        Result<TbOrder> result=null;
        try {
            result=orderService.listOrdersByPage(page,query,order);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }

}
