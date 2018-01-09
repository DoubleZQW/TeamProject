package com.qf.service.impl;

import com.qf.mapper.TbMealMapper;
import com.qf.mapper.TbMealsMapper;
import com.qf.pojo.TbMeal;
import com.qf.service.MealService;
import com.qf.vo.Order;
import com.qf.vo.Page;
import com.qf.vo.Result;
import com.qf.vo.TbMealQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MealServiceImpl implements MealService {
    @Autowired
    private TbMealsMapper mealDao;
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
}
