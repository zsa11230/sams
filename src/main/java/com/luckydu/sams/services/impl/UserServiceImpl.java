package com.luckydu.sams.services.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.luckydu.sams.entity.SysUser;
import com.luckydu.sams.mapper.UserMapper;
import com.luckydu.sams.services.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;



/**
 * @author rcg
 */


@Slf4j
@Service
@AllArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, SysUser> implements UserService {

    @Override
    public SysUser getUserById(int id) {
        return baseMapper.selectById(id);
    }

    @Override
    public Boolean createUser(SysUser sysUser) {
        baseMapper.insert(sysUser);
        return Boolean.TRUE;
    }


}
