package com.qf.service.impl;

import com.qf.jedis.JedisClient;
import com.qf.mapper.ContentMapper;
import com.qf.pojo.Content;
import com.qf.pojo.ContentExample;
import com.qf.service.ContentService;
import com.qf.utils.JsonUtils;
import com.qf.utils.StrKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentServiceImpl implements ContentService{

    @Autowired
    private JedisClient jedisClient;
    @Autowired
    private ContentMapper contentDao;

    @Override
    public List<Content> getContentListByCid(Integer cid) {
        try{
            String listJson = jedisClient.hget("CONTENT_LIST",Integer.toString(cid));
            if(StrKit.notBlank(listJson)){
                List<Content> contentList = JsonUtils.jsonToList(listJson,Content.class);
                return contentList;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        ContentExample example = new ContentExample();
        ContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(cid);
        List<Content> contentList = contentDao.selectByExample(example);

        try {
            jedisClient.hset("CONTENT_LIST",Integer.toString(cid),JsonUtils.objectToJson(contentList));
        }catch (Exception e){
            e.printStackTrace();
        }

        return contentList;
    }
}
