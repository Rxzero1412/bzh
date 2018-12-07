package com.myProject.service;


import com.myProject.model.projectone;
import com.myProject.model.projectthree;

import java.util.List;

public interface IProjectthreeService {

    public List<projectthree> selectProjectthree(String projecttwoid);
    public projectthree sProjectthree(String threeid);
    public boolean addProjectthree(projectthree pthree);
    public boolean updateProjectthree(projectthree pthree);
    public boolean addProjectthreelist(List<projectthree> pthreelist,String twoid);

}
