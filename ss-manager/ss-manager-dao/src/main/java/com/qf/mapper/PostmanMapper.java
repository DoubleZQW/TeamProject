package com.qf.mapper;



import com.qf.pojo.Postman;
import com.qf.pojo.PostmanExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostmanMapper {
    int countByExample(PostmanExample example);

    int deleteByExample(PostmanExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Postman record);

    int insertSelective(Postman record);

    List<Postman> selectByExample(PostmanExample example);

    Postman selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Postman record, @Param("example") PostmanExample example);

    int updateByExample(@Param("record") Postman record, @Param("example") PostmanExample example);

    int updateByPrimaryKeySelective(Postman record);

    int updateByPrimaryKey(Postman record);
}