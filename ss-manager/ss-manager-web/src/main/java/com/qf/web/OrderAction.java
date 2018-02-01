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
import com.qf.vo.TbOrderQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    public Result<TbOrderCustom> findAllOrder(Page page, TbOrderQuery query, Order order){
        Result<TbOrderCustom> result=null;
        try {
            result=orderService.listOrdersByPage(page,query,order);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 批量删除订单
     */
    @ResponseBody
    @RequestMapping(value = "/order/remove",method = RequestMethod.POST)
    public int deleteOrderById(@RequestParam("ids[]") List<Long> ids){
        int i=0;
        try {
            i=orderService.batchUpdate(ids);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}
