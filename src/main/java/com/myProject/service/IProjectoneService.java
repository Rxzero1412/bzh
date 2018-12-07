package com.myProject.service;


import com.myProject.model.projectone;
import java.util.List;

public interface IProjectoneService {

    public List<projectone> selectProjectone(String userid);
    public projectone sProjectone(String projectid);

    public boolean addProjectone(projectone pone);
    public boolean updateProjectone(projectone pone);

}
