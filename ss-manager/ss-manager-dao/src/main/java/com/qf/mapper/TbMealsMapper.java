package com.qf.mapper;

import com.qf.pojo.TbMeal;
import com.qf.pojo.TbMealExample;
import com.qf.vo.TbMealCustom;

import java.util.List;
import java.util.Map;

public interface TbMealsMapper {
//    分页查询商品
    List<TbMeal> listItemsByPage(Map<String,Object> map);

    Long  listCondition(Map<String,Object> map);

    int updateByExampleSelective(TbMeal tbMeal, TbMealExample example);

//    根据mealId查询 TbMealCustom
    TbMealCustom findMealCustomById(Long mealId);
}
