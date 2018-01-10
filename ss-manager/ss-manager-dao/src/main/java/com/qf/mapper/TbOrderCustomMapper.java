package com.qf.mapper;

import com.qf.pojo.TbOrder;

import java.util.List;
import java.util.Map;

public interface TbOrderCustomMapper {

//    查询订单总数
    Long listCondition(Map<String, Object> map);

//    查询订单数据
    List<TbOrder> listOrdersByPage(Map<String, Object> map);
}
