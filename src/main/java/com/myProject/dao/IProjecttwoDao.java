package com.myProject.dao;

import com.myProject.model.projectthree;
import com.myProject.model.projecttwo;

import java.util.List;

public interface IProjecttwoDao {
    public List<projecttwo> selectProjecttwos(String projectid);
    public boolean addProjecttwolist(List<projecttwo> ptwolist);
    public boolean deleteProjecttwo(String projectid);

}
