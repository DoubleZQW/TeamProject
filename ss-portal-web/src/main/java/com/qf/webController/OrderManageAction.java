package com.qf.webController;

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.service.OrderService;
import com.qf.vo.TbOrderCustom;
import com.qf.vo.TbOrderQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderManageAction {
    private Logger logger= LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrderService orderService;

    //订单查询
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
}
