package com.qf.service;


import com.qf.pojo.Content;

import java.util.List;

public interface SearchIndexService {

	List<Content> searchByPage(String keyword, Integer page, Integer pageSize);
}
