package com.qf.mapper;

import com.qf.vo.TbOrderCustom;

import java.util.List;
import java.util.Map;

public interface TbOrderCustomMapper {

//    查询订单总数
    Long listCondition(Map<String, Object> map);

//    查询订单数据
    List<TbOrderCustom> listOrdersByPage(Map<String, Object> map);

    //    根据用户id查询订单
    List<TbOrderCustom> listOrdersById(Map<String, Object> map);
}
