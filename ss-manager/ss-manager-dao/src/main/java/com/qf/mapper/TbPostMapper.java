package com.qf.mapper;

import com.qf.pojo.TbPost;
import com.qf.pojo.TbPostExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbPostMapper {
    int countByExample(TbPostExample example);

    int deleteByExample(TbPostExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbPost record);

    int insertSelective(TbPost record);

    List<TbPost> selectByExample(TbPostExample example);

    TbPost selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbPost record, @Param("example") TbPostExample example);

    int updateByExample(@Param("record") TbPost record, @Param("example") TbPostExample example);

    int updateByPrimaryKeySelective(TbPost record);

    int updateByPrimaryKey(TbPost record);
}