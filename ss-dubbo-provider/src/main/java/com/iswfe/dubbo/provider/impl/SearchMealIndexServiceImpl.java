package com.iswfe.dubbo.provider.impl;

import com.iswfe.dubbo.provider.SearchMealIndexService;
import com.qf.mapper.SearchMealDao;
import com.qf.mapper.TbMealCustomMapper;
import com.qf.vo.TbSearchMealResult;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchMealIndexServiceImpl implements SearchMealIndexService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private TbMealCustomMapper mcMapper;

	@Autowired
	private SolrServer solrServer;

	@Autowired
	private SearchMealDao smDao;

	@Override
	public TbSearchMealResult searchIndex(String keyword, Integer page, Integer rows) throws Exception {
		SolrQuery query = new SolrQuery();
		query.setQuery(keyword);
		if (page <= 0) {
			page = 1;
		}

		query.setStart((page - 1) * rows);
		query.setRows(rows);
		query.set("df", "mealName");
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