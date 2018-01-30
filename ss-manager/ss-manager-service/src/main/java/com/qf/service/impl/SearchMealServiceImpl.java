package com.qf.service.impl;

import com.qf.mapper.TbMealCustomMapper;
import com.qf.service.SearchMealService;
import com.qf.vo.TbSearchMealCustom;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchMealServiceImpl implements SearchMealService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private TbMealCustomMapper mcMapper;

	@Autowired
	private SolrServer solrServer;

	@Override
	public void importAllMeals() {
		try {
			//采集数据
			List<TbSearchMealCustom> list = mcMapper.getSearchMealList();

			//遍历数据
			for (TbSearchMealCustom meal : list) {
				//新建一个solr的文档域
				SolrInputDocument document = new SolrInputDocument();
				//向文档域中添加字段
				document.addField("id", meal.getMealId());
				document.addField("mealName", meal.getMealName());
				document.addField("mealPrice", meal.getMealPrice());
				document.addField("mealNum", meal.getMealNum());
				document.addField("mealPic", meal.getMealPic());
				document.addField("mealIntro", meal.getMealIntro());
				document.addField("publisher", meal.getPublisher());
				//写入索引库
				solrServer.add(document);

			}
			solrServer.commit();
		}  catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
	}
}
