package com.qf.mapper;

import com.qf.vo.TbSearchMealCustom;
import com.qf.vo.TbSearchMealResult;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class SearchMealDao {

	@Autowired
	private SolrServer solrServer;

	//根据查询条件查询索引库
	public TbSearchMealResult searchIndex(SolrQuery query) throws Exception {
		//创建一个mealResult结果集
		TbSearchMealResult mealResult = new TbSearchMealResult();

		//根据query查询索引库
		QueryResponse queryResponse = solrServer.query(query);
		//获得查询结果
		SolrDocumentList solrDocumentList = queryResponse.getResults();

		//得到结果的总记录数
		long numFound = solrDocumentList.getNumFound();
		mealResult.setRecordCount(numFound);

		//得到商品列表
		Map<String, Map<String, List<String>>> highlighting = queryResponse.getHighlighting();
		//放入mealList中
		List<TbSearchMealCustom> mealList = new ArrayList<>();
		for (SolrDocument document : solrDocumentList) {
			TbSearchMealCustom meal = new TbSearchMealCustom();
			//meal.setMealName( (String) document.get("mealName"));
			Integer id = Integer.parseInt( (String) document.get("id"));
			meal.setMealId(id);
			meal.setMealPrice(document.get("mealPrice").toString());
			meal.setMealNum( Integer.parseInt(document.get("mealNum").toString()) );
			meal.setMealPic( (String) document.get("mealPic"));
			//meal.setMealIntro( (String) document.get("mealIntro"));
			meal.setPublisher( (String) document.get("publisher"));

			//得到高亮显示
			//1 拿到每项高亮的原始list
			List<String> mealNameHL = highlighting.get(id.toString()).get("mealName");
			List<String> mealIntroHL = highlighting.get(id.toString()).get("mealIntro");
			//2 从list中取出并设回meal对象中
			String mealName, mealIntro;
			if (mealNameHL != null && mealNameHL.size() > 0)
				mealName = mealNameHL.get(0);
			else
				mealName = (String) document.get("mealName");
			meal.setMealName(mealName);
			if (mealIntroHL != null && mealIntroHL.size() > 0)
				mealIntro = mealIntroHL.get(0);
			else
				mealIntro = (String) document.get("mealIntro");
			meal.setMealIntro(mealIntro);

			//添加到商品列表
			mealList.add(meal);
		}
		//将mealList设回mealResult中
		mealResult.setMealList(mealList);

		return mealResult;
	}
}
