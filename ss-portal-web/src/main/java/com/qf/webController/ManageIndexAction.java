package com.qf.webController;

import com.qf.pojo.Content;
import com.qf.service.ContentService;
import com.qf.utils.PropKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * midnightcategoryId=1
 dinnercategoryId=2
 breakfastcategoryId=3
 afternoonteacategoryId=4
 lunchcategoryId=5

 */
@Controller
public class ManageIndexAction {

    @Autowired
    private ContentService contentService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String toIndex(Model model){

        Integer midnightcategoryId = PropKit.use("picture.properties").getInt("midnightcategoryId");
        Integer dinnercategoryId = PropKit.use("picture.properties").getInt("dinnercategoryId");
        Integer breakfastcategoryId = PropKit.use("picture.properties").getInt("breakfastcategoryId");
        Integer afternoonteacategoryId = PropKit.use("picture.properties").getInt("afternoonteacategoryId");
        Integer lunchcategoryId = PropKit.use("picture.properties").getInt("lunchcategoryId");
        List<Content> midnightlist = contentService.getContentListByCid(midnightcategoryId);
        model.addAttribute("midnightlist",midnightlist);
        List<Content> dinnerList = contentService.getContentListByCid(dinnercategoryId);
        model.addAttribute("dinnerList",dinnerList);
        List<Content> breakfastList = contentService.getContentListByCid(breakfastcategoryId);
        model.addAttribute("breakfastList",breakfastList);
        List<Content> afternoonteaList= contentService.getContentListByCid(afternoonteacategoryId);
        model.addAttribute("afternoonteaList",afternoonteaList);
        List<Content> lunchList = contentService.getContentListByCid(lunchcategoryId);
        model.addAttribute("lunchList",lunchList);
        return "index";
    }

    /**
     * 跳转页面
     * @param page
     * @return
     */
    @RequestMapping(value = "/{page}", method = RequestMethod.GET)
    public String page(@PathVariable("page") String page) {
        return page;
    }
}
