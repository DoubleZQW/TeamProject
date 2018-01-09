package com.qf.service;

import com.qf.pojo.TbMeal;
import com.qf.vo.Order;
import com.qf.vo.Page;
import com.qf.vo.Result;
import com.qf.vo.TbMealQuery;

public interface MealService {
   Result<TbMeal> ListMealsByPage(Page page, TbMealQuery tbquery ,Order order);
}
