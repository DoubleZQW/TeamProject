package com.qf.mapper;

import com.qf.vo.TbUserCustom;

import java.util.List;
import java.util.Map;

public interface TbUserCustomMapper {
    long countUser(Map<String,Object> map);

    List<TbUserCustom> listUserByPage(Map<String,Object> map);

}
