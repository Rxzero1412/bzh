package com.myProject.service.impl;

import com.myProject.dao.IProjectoneDao;
import com.myProject.dao.IProjectthreeDao;
import com.myProject.model.projectone;
import com.myProject.model.projectthree;
import com.myProject.service.IProjectoneService;
import com.myProject.service.IProjectthreeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("projectthreeService")
public class ProjectthreeServiceImpl implements IProjectthreeService {

    @Resource
    private IProjectthreeDao projectthreeDao;


    @Override
    public List<projectthree> selectProjectthree(String projecttwoid) {
        return projectthreeDao.selectProjectthree(projecttwoid);
    }

    @Override
    public projectthree sProjectthree(String threeid) {
        return projectthreeDao.sProjectthree(threeid);
    }

    @Override
    public boolean addProjectthree(projectthree pthree) {
        return projectthreeDao.addProjectthree(pthree);
    }

    @Override
    public boolean updateProjectthree(projectthree pthree) {
        return projectthreeDao.updateProjectthree(pthree);
    }

    @Override
    public boolean addProjectthreelist(List<projectthree> pthreelist,String twoid) {
        if(twoid!=null) projectthreeDao.deleteProjectthrees(twoid);
        return projectthreeDao.addProjectthreelist(pthreelist);
    }
}
