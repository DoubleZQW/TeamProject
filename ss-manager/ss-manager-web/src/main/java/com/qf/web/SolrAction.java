package com.qf.web;

import com.qf.dto.ResultMessage;
import com.qf.service.SearchMealService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SolrAction {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SearchMealService smService;

	@ResponseBody
	@RequestMapping(value = "/meal/importSolr", method = RequestMethod.GET)
	public ResultMessage importMealSolr() {
		try {
			smService.importAllMeals();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return new ResultMessage(true, "导入完成!", null);
	}
}
