package com.qf.mapper;

import com.qf.pojo.TbMeal;

import java.util.List;
import java.util.Map;

public interface TbMealsMapper {
    List<TbMeal> listItemsByPage(Map<String,Object> map);
    Long  ListCondition(Map<String,Object> map);
}
