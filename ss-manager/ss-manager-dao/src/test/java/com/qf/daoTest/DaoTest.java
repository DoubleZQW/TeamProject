package com.qf.daoTest;

import com.qf.mapper.TbUserMapper;
import com.qf.pojo.TbUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao-test.xml"})
public class DaoTest {
    @Autowired
    private TbUserMapper userMapper;

    @Test
    public void run(){
       TbUser user=userMapper.selectByPrimaryKey(543210L);
        System.out.println(user.getUserEmail());
    }
}
