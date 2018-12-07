package com.myProject.service;


import com.myProject.model.projectthree;
import com.myProject.model.projecttwo;

import java.util.List;

public interface IProjecttwoService {
    public List<projecttwo> selectProjecttwos(String projectid);
    public boolean addProjecttwolist(List<projecttwo> ptwolist,String projectid);
    public boolean addProjecttwo(String juanname,String twoname,String projectname,String projecttwoid,String projectid);
    public boolean deleteProjecttwo(String twoid);
}
