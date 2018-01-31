package com.qf.service;

import com.qf.pojo.Content;
import java.util.List;

public interface SearchMealService {
	List<Content> searchByPage(String var1, Integer var2, Integer var3);
}