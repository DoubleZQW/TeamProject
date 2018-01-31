package com.qf.service.impl;

import com.qf.mapper.SearchMealDao;
import com.qf.mapper.TbMealCustomMapper;
import com.qf.service.SearchIndexService;
import com.qf.vo.TbSearchMealCustom;
import com.qf.vo.TbSearchMealResult;
import java.util.Iterator;
import java.util.List;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchIndexServiceImpl implements SearchIndexService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private TbMealCustomMapper mcMapper;
	@Autowired
	private SolrServer solrServer;
	@Autowired
	private SearchMealDao smDao;

	public SearchIndexServiceImpl() {
	}

	public void importAllMeals() {
		try {
			List<TbSearchMealCustom> list = this.mcMapper.getSearchMealList();
			Iterator var2 = list.iterator();

			while(var2.hasNext()) {
				TbSearchMealCustom meal = (TbSearchMealCustom)var2.next();
				SolrInputDocument document = new SolrInputDocument();
				document.addField("id", meal.getMealId());
				document.addField("mealName", meal.getMealName());
				document.addField("mealPrice", meal.getMealPrice());
				document.addField("mealNum", meal.getMealNum());
				document.addField("mealPic", meal.getMealPic());
				document.addField("mealIntro", meal.getMealIntro());
				document.addField("publisher", meal.getPublisher());
				this.solrServer.add(document);
			}

			this.solrServer.commit();
		} catch (Exception var5) {
			this.logger.error(var5.getMessage(), var5);
			var5.printStackTrace();
		}

	}

	public TbSearchMealResult searchIndex(String keyword, Integer page, Integer rows) throws Exception {
		SolrQuery query = new SolrQuery();
		query.setQuery(keyword);
		if (page <= 0) {
			page = 1;
		}

		query.setStart((page - 1) * rows);
		query.setRows(rows);
		query.set("df", new String[]{"mealName"});
		query.setHighlight(true);
		query.addHighlightField("mealName");
		query.addHighlightField("mealIntro");
		query.setHighlightSimplePre("<em style='color: red'>");
		query.setHighlightSimplePost("</em>");
		TbSearchMealResult mealResult = this.smDao.searchIndex(query);
		long recordCount = mealResult.getRecordCount();
		Long totalPage = recordCount / (long)rows;
		if (recordCount % (long)rows > 0L) {
			totalPage = totalPage + 1L;
		}

		mealResult.setTotalPages(totalPage);
		return mealResult;
	}
}