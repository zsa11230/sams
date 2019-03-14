package com.luckydu.sams.controller;

import com.luckydu.sams.entity.SysUser;
import com.luckydu.sams.services.UserService;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    @ApiOperation(value = "测试")
    @GetMapping("/home")
    String home() {
        return "Hello World!";
    }

    @RequestMapping(value = "/getUser", method = RequestMethod.GET)
    public SysUser helloUser() {
        SysUser user = userService.getUserById(1);
        return user;
    }

    @RequestMapping(value = "/getUser", method = RequestMethod.POST)
    public Boolean create(@RequestBody SysUser sysUser) {
        return userService.createUser(sysUser);
    }

}