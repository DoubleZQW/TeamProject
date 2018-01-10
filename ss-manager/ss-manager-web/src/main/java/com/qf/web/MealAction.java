package com.qf.web;

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.pojo.TbMeal;
import com.qf.service.MealService;
import com.qf.vo.TbMealQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MealAction {
    private Logger logger= LoggerFactory.getLogger(this.getClass());

//    引入Service层
    @Autowired
    private MealService mealService;

    /**
     * 商品分页
     * @param page
     * @param tbquery
     * @param order
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/meal/query",method= RequestMethod.GET)
    public Result<TbMeal> listMealsByPage(Page page, TbMealQuery tbquery, Order order){
      Result<TbMeal> result=null;
      try {
          result=  mealService.ListMealsByPage(page,tbquery,order);
      }catch (Exception e){
          logger.error(e.getMessage(),e);
          e.printStackTrace();
      }
      return  result;
    }

    /**
     * 商品批量删除
     */
    @ResponseBody
    @RequestMapping(value = "/meal/delete",method = RequestMethod.GET)
    public int deleteMealsByIds(@RequestParam("ids[]") List<Long> ids){
        int i=0;
        try {
            i=mealService.batchUpdate(ids);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    /**
     * 商品更新
     */
    @RequestMapping(value = "/meal/update",method = RequestMethod.POST)
    public int updateMealById(TbMeal tbMeal){
        int i=0;
        try {
            i=mealService.updateMeal(tbMeal);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

}
