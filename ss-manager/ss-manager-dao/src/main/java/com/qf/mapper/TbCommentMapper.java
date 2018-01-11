package com.qf.mapper;

import com.qf.pojo.TbComment;
import com.qf.pojo.TbCommentExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbCommentMapper {
    int countByExample(TbCommentExample example);

    int deleteByExample(TbCommentExample example);

    int deleteByPrimaryKey(Long commentId);

    int insert(TbComment record);

    int insertSelective(TbComment record);

    List<TbComment> selectByExample(TbCommentExample example);

    TbComment selectByPrimaryKey(Long commentId);

    int updateByExampleSelective(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByExample(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByPrimaryKeySelective(TbComment record);

    int updateByPrimaryKey(TbComment record);
}