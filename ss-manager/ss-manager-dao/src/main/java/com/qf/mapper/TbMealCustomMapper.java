package com.qf.mapper;

import com.qf.pojo.TbMeal;
import com.qf.pojo.TbMealExample;
import com.qf.vo.TbMealCustom;
import com.qf.vo.TbSearchMealCustom;
import java.util.List;
import java.util.Map;

public interface TbMealCustomMapper {
//    商品分页
    List<TbMeal> listItemsByPage(Map<String, Object> var1);

//    条件查询商品总数
    Long listCondition(Map<String, Object> var1);

    int updateByExampleSelective(TbMeal var1, TbMealExample var2);

//    根据mealId查询 TbMealCustom
    TbMealCustom findMealCustomById(Long var1);

    int updateMealCustom(TbMealCustom var1);

//    查询meal到(TbSearchMealCustom)索引库
    List<TbSearchMealCustom> getSearchMealList();
}

