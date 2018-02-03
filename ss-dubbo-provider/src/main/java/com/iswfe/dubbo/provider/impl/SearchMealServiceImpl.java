package com.iswfe.dubbo.provider.impl;

import com.iswfe.dubbo.provider.SearchMealService;
import com.qf.jedis.JedisClient;
import com.qf.mapper.ContentMapper;
import com.qf.pojo.Content;
import com.qf.pojo.ContentExample;
import com.qf.pojo.ContentExample.Criteria;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchMealServiceImpl implements SearchMealService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ContentMapper contentMapper;

	@Autowired
	private JedisClient jedisClient;

	public SearchMealServiceImpl() {
	}

	@Override
	public List<Content> searchByPage(String keyword, Integer page, Integer pageSize) {
		List<Content> contents = null;

		try {
			ContentExample example = new ContentExample();
			Criteria criteria = example.createCriteria();
			criteria.andCategoryIdEqualTo(10);
			criteria.andTitleLike("%" + keyword + "%");
			contents = contentMapper.selectByExample(example);
		} catch (Exception e) {
			this.logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return contents;
	}

}