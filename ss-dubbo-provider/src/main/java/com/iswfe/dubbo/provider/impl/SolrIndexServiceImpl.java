package com.iswfe.dubbo.provider.impl;

import com.iswfe.dubbo.provider.SolrIndexService;
import com.qf.mapper.TbMealCustomMapper;
import com.qf.vo.TbSearchMealCustom;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SolrIndexServiceImpl implements SolrIndexService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private TbMealCustomMapper mcMapper;

	@Autowired
	private SolrServer solrServer;

	@Override
	public boolean importAllMeals() {
		try {
			//mapper中查询到mealList
			List<TbSearchMealCustom> mealList = this.mcMapper.getSearchMealList();

			//遍历mealList,放入solr的document对象中
			for (TbSearchMealCustom meal : mealList) {
				SolrInputDocument document = new SolrInputDocument();
				document.addField("id", meal.getMealId());
				document.addField("mealName", meal.getMealName());
				document.addField("mealPrice", meal.getMealPrice());
				document.addField("mealNum", meal.getMealNum());
				document.addField("mealPic", meal.getMealPic());
				document.addField("mealIntro", meal.getMealIntro());
				document.addField("publisher", meal.getPublisher());
				//向solrServer中添加每一个document
				this.solrServer.add(document);
			}

			//提交到solr索引库中
			solrServer.commit();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean cleanAllMeals() {
		try {
			solrServer.deleteByQuery("*:*");
			solrServer.commit();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
