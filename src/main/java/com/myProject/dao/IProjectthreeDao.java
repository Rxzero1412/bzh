package com.myProject.dao;

import com.myProject.model.projectone;
import com.myProject.model.projectthree;

import java.util.List;

public interface IProjectthreeDao {
    public List<projectthree> selectProjectthree(String projecttwoid);
    public projectthree sProjectthree(String threeid);
    public boolean addProjectthree(projectthree pthree);
    public boolean addProjectthreelist(List<projectthree> pthreelist);
    public boolean deleteProjectthrees(String twoid);
    public boolean updateProjectthree(projectthree pthree);

}
