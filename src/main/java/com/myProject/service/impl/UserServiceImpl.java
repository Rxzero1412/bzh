package com.myProject.service.impl;

import com.myProject.dao.IUserDao;
import com.myProject.model.User;
import com.myProject.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;


    public boolean login(String userName, String password){
        User user = userDao.selectByName(userName);
        if (user != null) {
            if (user.getUsername().equals(userName) && user.getPassword().equals(password))
                return true;
        }
        return false;
    }

    @Override
    public String getuserid(String userName) {
        return userDao.selectByName(userName).getUserid();
    }


}
