package com.qf.web;

import com.qf.pojo.Content;
import com.qf.service.SearchIndexService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SearchIndexAction {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SearchIndexService siService;

	@ResponseBody
	@RequestMapping(value = "/")
	public List<Content> serchIndex(String q, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer pageSize) {

		try {
			//查询得到结果
			List<Content> contents = siService.searchByPage(q, page, pageSize);
			if (contents == null || contents.size() > 0)
				return contents;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return null;
	}
}
