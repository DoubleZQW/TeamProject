package com.iswfe.dubbo.provider;

import org.springframework.stereotype.Component;

//Solr索引库的管理
@Component
public interface SolrIndexService {

	boolean importAllMeals();

	boolean cleanAllMeals();
}
