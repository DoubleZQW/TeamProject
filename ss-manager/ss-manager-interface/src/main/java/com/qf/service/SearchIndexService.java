package com.qf.service;

import com.qf.vo.TbSearchMealResult;

public interface SearchIndexService {
	void importAllMeals();

	TbSearchMealResult searchIndex(String var1, Integer var2, Integer var3) throws Exception;
}