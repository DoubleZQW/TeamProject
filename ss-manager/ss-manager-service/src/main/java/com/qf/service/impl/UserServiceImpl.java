package com.qf.service.impl;

/**
 * 用户的service实现层
 */

import com.qf.dto.Order;
import com.qf.dto.Page;
import com.qf.dto.Result;
import com.qf.mapper.TbUserCustomMapper;
import com.qf.mapper.TbUserMapper;
import com.qf.pojo.TbUser;
import com.qf.pojo.TbUserExample;
import com.qf.service.UserService;
import com.qf.vo.TbUserCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{

//   引入dao层
    @Autowired
    private TbUserMapper userMapper;

//    引入dao层扩展
    @Autowired
    private TbUserCustomMapper userCustomMapper;

    /**
     * 测试：根据id查询用户
     * @param id
     * @return
     */
    @Override
    public TbUser getById(Long id) {
        return userMapper.selectByPrimaryKey(id);
    }

//    分页查询用户
    @Override
    public Result<TbUserCustom> listUserByPage(TbUserCustom user, Page page, Order order) {
        Result<TbUserCustom> result= new Result<TbUserCustom>();
        Map<String,Object> map = new HashMap<String,Object>();

        map.put("user",user);
        map.put("page",page);
        map.put("order",order);
        //总条数total
        long total = userCustomMapper.countUser(map);
        result.setTotal(total);
        //按条件分页查询
        List<TbUserCustom> list = userCustomMapper.listUserByPage(map);

        //如果查询出来没用户，要把当前页码置为“当前查询条件下的最大页码”，再重新查
        if(list.size()==0){
            int pageSize = page.getRows();
            int pageCount = (int)(total + pageSize - 1) / pageSize;
            if(pageCount<=0){//当前页码数不能小于等于0
                pageCount = 1;
            }
            page.setPage(pageCount);
            map.put("page",page);
            list = userCustomMapper.listUserByPage(map);
        }

        //根据字段值，返回中文字。 --》可以在前端页面上判断！
        /*List<TbUserCustom> list2 = new LinkedList<TbUserCustom>();
        for (TbUserCustom u:list){
            if (u.getUserLevel()==1){ u.setUlevel("用户"); }
            else if (u.getUserLevel()==0){ u.setUlevel("管理员"); }

            if (u.getUserStatus()==1){ u.setStatus("存在"); }
            else if (u.getUserStatus()==2){ u.setStatus("删除"); }

            if (u.getUserSex()==1){ u.setSex("男"); }
            else if (u.getUserSex()==0){ u.setSex("女"); }

            list2.add(u);
        }
        pageVo.setRows(list2);*/

        result.setRows(list);

        return result;
    }

    //删除用户
    @Override
    public int deleteUserByIds(List ids) {
        int i = 0;
        //删除  --》  把用户状态改为2
        for (int j=0;j<ids.size();j++) {
            Long id = Long.parseLong(ids.get(j)+"");
            TbUser u = userMapper.selectByPrimaryKey(id);

            TbUserExample example = new TbUserExample();
            TbUserExample.Criteria criteria = example.createCriteria();
            criteria.andUserIdEqualTo(id);
            u.setUserStatus((byte) 2);
            u.setUpdated(new Date());
            i+=userMapper.updateByExample(u,example);
        }
        return i;
    }
}
