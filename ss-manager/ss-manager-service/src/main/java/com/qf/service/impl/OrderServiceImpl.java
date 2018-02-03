package com.qf.service.impl;

/**
 * 订单的service实现层
 */

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.mapper.TbOrderCustomMapper;
import com.qf.mapper.TbOrderMapper;
import com.qf.pojo.TbOrder;
import com.qf.pojo.TbOrderExample;
import com.qf.service.OrderService;
import com.qf.vo.TbOrderCustom;
import com.qf.vo.TbOrderQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService{
    private Logger logger=LoggerFactory.getLogger(this.getClass());

//    引入订单dao层接口
    @Autowired
    private TbOrderMapper orderMapper;

    //    引入订单dao层扩展接口
    @Autowired
    private TbOrderCustomMapper orderCustomMapper;
//    订单分页查询
    @Override
    public Result<TbOrderCustom> listOrdersByPage(Page page, TbOrderQuery query, Order order) {
        Result<TbOrderCustom> result=new Result<TbOrderCustom>();
        try {
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("page",page);
            map.put("query",query);
            map.put("order",order);
//            获取总数
            Long total=orderCustomMapper.listCondition(map);
//            获取商品集合
            List<TbOrderCustom> list=orderCustomMapper.listOrdersByPage(map);
            result.setRows(list);
            result.setTotal(total);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }

//    批量删除订单
    @Override
    public int batchUpdate(List<Long> ids) {
        int i=0;
        try {
//           创建一个对象，设置订单状态为：4,删除
            TbOrder tbOrder=new TbOrder();
            tbOrder.setOrderStatus((byte) 4);
//        创建更新模版
            TbOrderExample example=new TbOrderExample();
            TbOrderExample.Criteria criteria=example.createCriteria();
            criteria.andOrderIdIn(ids);
//            执行更新操作
            i=orderMapper.updateByExampleSelective(tbOrder,example);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    //    根据id查询订单
    @Override
    public Result<TbOrderCustom> listOrdersById(Page page, TbOrderQuery query) {
        Result<TbOrderCustom> result=new Result<TbOrderCustom>();
//        如果是第一次，就设置当前页码为1
        if (page.getPage()==null || page.getPage()==0){
            page.setPage(1);
        }
        if (page.getRows()==null ||page.getRows()==0){
            page.setRows(5);
        }
        try {
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("page",page);
            map.put("query",query);
//          获取总数
            Long total=orderCustomMapper.listCondition(map);
//            获取id查询订单的集合
            List<TbOrderCustom> orderCustoms = orderCustomMapper.listOrdersById(map);
            result.setRows(orderCustoms);
            result.setTotal(total);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }
}
