package com.qf.service;

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.pojo.TbOrder;
import com.qf.vo.TbOrderCustom;

import java.util.List;

public interface OrderService {

    //    订单查询分页
    Result<TbOrder> listOrdersByPage(Page page, TbOrderCustom query, Order order);

    //    批量删除
    int batchUpdate(List<Long> ids);

}
