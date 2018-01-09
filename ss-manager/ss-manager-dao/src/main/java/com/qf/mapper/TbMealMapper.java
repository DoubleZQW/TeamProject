package com.qf.mapper;

import com.qf.pojo.TbMeal;
import com.qf.pojo.TbMealExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TbMealMapper {
    int countByExample(TbMealExample example);

    int deleteByExample(TbMealExample example);

    int deleteByPrimaryKey(Long mealId);

    int insert(TbMeal record);

    int insertSelective(TbMeal record);

    List<TbMeal> selectByExample(TbMealExample example);

    TbMeal selectByPrimaryKey(Long mealId);

    int updateByExampleSelective(@Param("record") TbMeal record, @Param("example") TbMealExample example);

    int updateByExample(@Param("record") TbMeal record, @Param("example") TbMealExample example);

    int updateByPrimaryKeySelective(TbMeal record);

    int updateByPrimaryKey(TbMeal record);

}