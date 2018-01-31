package com.qf.mapper;

import com.qf.pojo.TbMeal;
import com.qf.pojo.TbMealExample;
import com.qf.vo.TbMealCustom;
import com.qf.vo.TbSearchMealCustom;
import java.util.List;
import java.util.Map;

public interface TbMealCustomMapper {
    List<TbMeal> listItemsByPage(Map<String, Object> var1);

    Long listCondition(Map<String, Object> var1);

    int updateByExampleSelective(TbMeal var1, TbMealExample var2);

    TbMealCustom findMealCustomById(Long var1);

    int updateMealCustom(TbMealCustom var1);

    List<TbSearchMealCustom> getSearchMealList();
}

