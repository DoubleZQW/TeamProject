package com.qf.mapper;

import com.qf.pojo.TbMealCat;
import com.qf.pojo.TbMealCatExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbMealCatMapper {
    int countByExample(TbMealCatExample example);

    int deleteByExample(TbMealCatExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbMealCat record);

    int insertSelective(TbMealCat record);

    List<TbMealCat> selectByExample(TbMealCatExample example);

    TbMealCat selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbMealCat record, @Param("example") TbMealCatExample example);

    int updateByExample(@Param("record") TbMealCat record, @Param("example") TbMealCatExample example);

    int updateByPrimaryKeySelective(TbMealCat record);

    int updateByPrimaryKey(TbMealCat record);
}