package com.luckydu.sams.services;

import com.luckydu.sams.entity.SysUser;
import com.luckydu.sams.entity.SysUser;

public interface UserService {
    public SysUser getUserById(int id);

    Boolean createUser(SysUser sysUser);
}
