package com.qf.service.impl;

import com.qf.mapper.TbMealMapper;
import com.qf.mapper.TbMealsMapper;
import com.qf.pojo.TbMeal;
import com.qf.pojo.TbMealExample;
import com.qf.service.MealService;
import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.vo.TbMealQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MealServiceImpl implements MealService {

    private Logger logger= LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TbMealsMapper mealDao;

    @Autowired
    private TbMealMapper mealMapper;

    @Override
    public Result<TbMeal> ListMealsByPage(Page page, TbMealQuery tbquery ,Order order) {
      Result<TbMeal> result=new Result<TbMeal>();
       try{
           Map<String,Object> map=new HashMap<String,Object>();
           map.put("page",page);
           map.put("tbquery",tbquery);
           map.put("order",order);
           //获取总数
          Long total= mealDao.ListCondition(map);
           //获得总条数
           List<TbMeal> list=mealDao.listItemsByPage(map);
           result.setRows(list);
           result.setTotal(total);
       } catch(Exception e){
          e.printStackTrace();
        }
        return result;
    }

    //    批量删除
    @Override
    public int batchUpdate(List<Long> ids) {
        int i=0;
        try {
//        创建一个对象，设置商品状态为：3,删除
            TbMeal tbMeal=new TbMeal();
            tbMeal.setMealStatus((byte)3);
//            创建更新模版
            TbMealExample example=new TbMealExample();
            TbMealExample.Criteria criteria=example.createCriteria();
            criteria.andMealIdIn(ids);
//            执行更新操作
            i=mealMapper.updateByExampleSelective(tbMeal,example);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int updateMeal(TbMeal tbMeal) {
        int i=0;
        try {
            i = mealMapper.updateByPrimaryKeySelective(tbMeal);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}
