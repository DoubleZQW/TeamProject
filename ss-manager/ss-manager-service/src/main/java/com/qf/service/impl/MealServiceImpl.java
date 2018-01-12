package com.qf.service.impl;

/**
 * 商品的service的实现层
 */

import com.qf.mapper.TbMealMapper;
import com.qf.mapper.TbMealCustomMapper;
import com.qf.pojo.TbMeal;
import com.qf.pojo.TbMealExample;
import com.qf.service.MealService;
import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.vo.TbMealCustom;
import com.qf.vo.TbMealQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MealServiceImpl implements MealService {

    private Logger logger= LoggerFactory.getLogger(this.getClass());

//    引入商品扩展类
    @Autowired
    private TbMealCustomMapper mealDao;

//    引入商品类
    @Autowired
    private TbMealMapper mealMapper;

    //    商品查询分页（包含模糊查询、排序）
    @Override
    public Result<TbMeal> ListMealsByPage(Page page, TbMealQuery query ,Order order) {
      Result<TbMeal> result=new Result<TbMeal>();
       try{
           Map<String,Object> map=new HashMap<String,Object>();
           map.put("page",page);
           map.put("query",query);
           map.put("order",order);
           //获取总数
          Long total= mealDao.listCondition(map);
           //获得查询商品集合
           List<TbMeal> list=mealDao.listItemsByPage(map);
           result.setRows(list);
           result.setTotal(total);
       } catch(Exception e){
           logger.error(e.getMessage(),e);
          e.printStackTrace();
        }
        return result;
    }

    //    批量删除
    @Override
    public int batchUpdateStatus(List<Long> ids,TbMeal tbMeal) {
        int i=0;
        try {
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

//   更新商品
    @Override
    public int updateMeal(TbMeal meal) {
        int i=0;
        try {
            meal.setUpdatTime(new Date());
            i =mealMapper.updateByPrimaryKeySelective(meal);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

//    添加商品

    @Override
    public int saveMeals(TbMeal tbMeal) {
        int i=0;
        try {
            tbMeal.setCreateTme(new Date());
            i=mealMapper.insertSelective(tbMeal);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

//    根据mealId查询 TbMealCustom
    @Override
    public TbMealCustom getMealCustomById(Long mealId) {
        return mealDao.findMealCustomById(mealId);
    }
}
