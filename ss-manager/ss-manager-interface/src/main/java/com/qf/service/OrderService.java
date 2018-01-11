package com.qf.service;

/**
 * 订单的service层
 */

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.pojo.TbOrder;
import com.qf.vo.TbMealQuery;
import com.qf.vo.TbOrderCustom;
import com.qf.vo.TbOrderQuery;

import java.util.List;

public interface OrderService {

    //    订单查询分页
    Result<TbOrderCustom> listOrdersByPage(Page page, TbOrderQuery query, Order order);

    //    批量删除
    int batchUpdate(List<Long> ids);

    TbOrder findById(Long id);
}
