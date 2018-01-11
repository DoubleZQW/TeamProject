package com.qf.service;

/**
 * 商品的service层
 */

import com.qf.pojo.TbMeal;

import java.util.List;

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.vo.TbMealQuery;

public interface MealService {

    //    商品查询分页（包含模糊查询、排序）
    Result<TbMeal> ListMealsByPage(Page page, TbMealQuery tbquery, Order order);

    //    批量删除
    int batchUpdate(List<Long> ids);

    //    更新
    int updateMeal(TbMeal tbMeal);
}
