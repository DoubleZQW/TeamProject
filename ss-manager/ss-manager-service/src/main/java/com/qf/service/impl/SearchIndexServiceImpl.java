package com.qf.service.impl;

import com.qf.jedis.JedisClient;
import com.qf.mapper.ContentMapper;
import com.qf.pojo.Content;
import com.qf.pojo.ContentExample;
import com.qf.service.SearchIndexService;
import com.qf.utils.JsonUtils;
import com.qf.utils.StrKit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchIndexServiceImpl implements SearchIndexService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ContentMapper contentMapper;

	@Autowired
	private JedisClient jedisClient;

	@Override
	public List<Content> searchByPage(String keyword, Integer page, Integer pageSize) {
		//创建空的结果集
		List<Content> contents = null;

		try {
			//创建模板
			ContentExample example = new ContentExample();
			//创建查询对象
			ContentExample.Criteria criteria = example.createCriteria();
			//添加查询条件
			criteria.andCategoryIdEqualTo(10);
			criteria.andTitleLike("%"+ keyword +"%");

			//执行查询
			contents = contentMapper.selectByExample(example);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		return contents;
	}

}
