package com.qf.mapper;

import com.qf.pojo.TbMealOrder;
import com.qf.pojo.TbMealOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbMealOrderMapper {
    int countByExample(TbMealOrderExample example);

    int deleteByExample(TbMealOrderExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbMealOrder record);

    int insertSelective(TbMealOrder record);

    List<TbMealOrder> selectByExample(TbMealOrderExample example);

    TbMealOrder selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbMealOrder record, @Param("example") TbMealOrderExample example);

    int updateByExample(@Param("record") TbMealOrder record, @Param("example") TbMealOrderExample example);

    int updateByPrimaryKeySelective(TbMealOrder record);

    int updateByPrimaryKey(TbMealOrder record);
}