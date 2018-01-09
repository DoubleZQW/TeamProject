package com.qf.service;

import com.qf.pojo.TbMeal;
import java.util.List;
import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.vo.TbMealQuery;

public interface MealService {
   Result<TbMeal> ListMealsByPage(Page page, TbMealQuery tbquery ,Order order);




//    批量删除
    int batchUpdate(List<Long> ids);

//    更新
    int updateMeal(TbMeal tbMeal);
}
