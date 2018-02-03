package com.qf.web;

import com.iswfe.dubbo.provider.SolrIndexService;
import com.qf.dto.ResultMessage;
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
	private SolrIndexService siService;

	@ResponseBody
	@RequestMapping(value = "/meals/importSolr", method = RequestMethod.GET)
	public ResultMessage importMealSolr() {
		if (siService.importAllMeals())
			return new ResultMessage(true, "导入完成!", null);
		return new ResultMessage(false, "导入失败!", null);
	}

	@ResponseBody
	@RequestMapping(value = "/meals/cleanSolr", method = RequestMethod.GET)
	public ResultMessage cleanAllMeals() {
		if (siService.cleanAllMeals())
			return new ResultMessage(true, "清空完成!", null);
		return new ResultMessage(false, "清空失败!", null);
	}
}
