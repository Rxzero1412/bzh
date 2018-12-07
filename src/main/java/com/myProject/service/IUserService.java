package com.myProject.service;


import com.myProject.model.User;

public interface IUserService {


    public boolean login(String userName, String password);

    public String getuserid(String userName);

}
