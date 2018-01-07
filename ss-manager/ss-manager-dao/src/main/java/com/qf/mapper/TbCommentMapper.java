package com.qf.mapper;

import com.qf.pojo.TbComment;
import com.qf.pojo.TbCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbCommentMapper {
    int countByExample(TbCommentExample example);

    int deleteByExample(TbCommentExample example);

    int deleteByPrimaryKey(Integer commentId);

    int insert(TbComment record);

    int insertSelective(TbComment record);

    List<TbComment> selectByExample(TbCommentExample example);

    TbComment selectByPrimaryKey(Integer commentId);

    int updateByExampleSelective(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByExample(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByPrimaryKeySelective(TbComment record);

    int updateByPrimaryKey(TbComment record);
}