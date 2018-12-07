package com.myProject.dao;

import com.myProject.model.User;


public interface IUserDao {
    public User selectByName(String userName);

}
