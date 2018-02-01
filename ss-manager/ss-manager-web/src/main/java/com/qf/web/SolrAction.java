package com.qf.web;

import com.qf.dto.ResultMessage;
import com.qf.service.SearchIndexService;
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
	private SearchIndexService siService;

	public SolrAction() {
	}

	@ResponseBody
	@RequestMapping(value = "/meal/importSolr", method = RequestMethod.GET)
	public ResultMessage importMealSolr() {
		try {
			this.siService.importAllMeals();
		} catch (Exception var2) {
			this.logger.error(var2.getMessage(), var2);
			var2.printStackTrace();
		}
		return new ResultMessage(true, "导入完成!", null);
	}
}
