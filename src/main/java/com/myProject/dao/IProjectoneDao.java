package com.myProject.dao;

import com.myProject.model.projectone;

import java.util.List;

public interface IProjectoneDao {
    public List<projectone> selectProjectone(String userid);
    public projectone sProjectone(String projectid);
    public boolean addProjectone(projectone pone);
    public boolean deleteProjectone(String projectid);
    public boolean updateProjectone(projectone pone);
}
