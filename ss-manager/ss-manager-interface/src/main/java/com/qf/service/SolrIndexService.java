package com.qf.service;

//Solr索引库的管理
public interface SolrIndexService {

	boolean importAllMeals();

	boolean cleanAllMeals();
}
