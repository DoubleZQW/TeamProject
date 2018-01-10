package com.qf.service.impl;

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.mapper.TbOrderCustomMapper;
import com.qf.mapper.TbOrderMapper;
import com.qf.pojo.TbOrder;
import com.qf.pojo.TbOrderExample;
import com.qf.service.OrderService;
import com.qf.vo.TbOrderCustom;
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
    public Result<TbOrder> listOrdersByPage(Page page, TbOrderCustom query, Order order) {
        Result<TbOrder> result=new Result<TbOrder>();
        try {
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("page",page);
            map.put("query",query);
            map.put("order",order);
//            获取总数
            Long total=orderCustomMapper.listCondition(map);
//            获取商品集合
            List<TbOrder> list=orderCustomMapper.listOrdersByPage(map);
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
}
