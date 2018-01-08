package com.qf.service.impl;

import com.qf.mapper.TbUserMapper;
import com.qf.pojo.TbUser;
import com.qf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

//   引入dao层
    @Autowired
    private TbUserMapper userMapper;
    /**
     * 测试：根据id查询用户
     * @param id
     * @return
     */
    @Override
    public TbUser getById(Integer id) {
        System.out.println(id);
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<TbUser> findAll() {
        return userMapper.selectByExample(null);
    }
}
