package com.qf.webController;

import com.iswfe.dubbo.provider.SearchMealIndexService;
import com.iswfe.dubbo.provider.SearchMealService;
import com.qf.pojo.Content;
import com.qf.vo.TbSearchMealResult;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchIndexAction {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SearchMealService smService;

	@Autowired
	private SearchMealIndexService smiService;

	public SearchIndexAction() {
	}

	@ResponseBody
	@RequestMapping("/")
	public List<Content> searchMeal(String q, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer pageSize) {
		try {
			List<Content> contents = smService.searchByPage(q, page, pageSize);
			if (contents == null || contents.size() > 0) {
				return contents;
			}
		} catch (Exception e) {
			this.logger.error(e.getMessage(), e);
			e.printStackTrace();
		}

		return null;
	}

	@RequestMapping(value = "/meals/query", method = RequestMethod.GET)
	public String searchMealIndex(String keyword, @RequestParam(defaultValue = "1") Integer page, Model model) {
		try {
			if (keyword != null) {
				keyword = keyword.trim();
				TbSearchMealResult mealResult = smiService.searchIndex(keyword, page, 10);
				model.addAttribute("query", keyword);
				model.addAttribute("totalPages", mealResult.getTotalPages());
				model.addAttribute("page", page);
				model.addAttribute("recordCount", mealResult.getRecordCount());
				model.addAttribute("mealList", mealResult.getMealList());
			}
		} catch (Exception e) {
			this.logger.error(e.getMessage(), e);
			e.printStackTrace();
		}

		return "search";
	}
}
