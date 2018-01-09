package com.qf.web;

import com.qf.pojo.TbMeal;
import com.qf.service.MealService;
import com.qf.vo.Page;
import com.qf.vo.Result;
import com.qf.vo.TbMealQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value="/meals",method= RequestMethod.GET)
@ResponseBody
public class MealAction {
    @Autowired
    private   MealService mealService;

    public Result<TbMeal> listMealsByPage(Page page, TbMealQuery tbquery){
      Result<TbMeal> result=null;
      try {
          result=  mealService.ListMealsByPage(page,tbquery);
      }catch (Exception e){

          e.printStackTrace();
      }

      return  result;
    }

}
