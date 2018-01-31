package com.qf.service.impl;

import com.qf.jedis.JedisClient;
import com.qf.mapper.ContentMapper;
import com.qf.pojo.Content;
import com.qf.pojo.ContentExample;
import com.qf.pojo.ContentExample.Criteria;
import com.qf.service.SearchMealService;
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

	public List<Content> searchByPage(String keyword, Integer page, Integer pageSize) {
		List contents = null;

		try {
			ContentExample example = new ContentExample();
			Criteria criteria = example.createCriteria();
			criteria.andCategoryIdEqualTo(10);
			criteria.andTitleLike("%" + keyword + "%");
			contents = this.contentMapper.selectByExample(example);
		} catch (Exception var7) {
			this.logger.error(var7.getMessage(), var7);
			var7.printStackTrace();
		}

		return contents;
	}
}