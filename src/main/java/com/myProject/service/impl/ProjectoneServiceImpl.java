package com.myProject.service.impl;

import com.myProject.dao.IProjectoneDao;
import com.myProject.dao.IUserDao;
import com.myProject.model.User;
import com.myProject.model.projectone;
import com.myProject.service.IProjectoneService;
import com.myProject.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("projectoneService")
public class ProjectoneServiceImpl implements IProjectoneService {

    @Resource
    private IProjectoneDao projectoneDao;

    @Override
    public List<projectone> selectProjectone(String userid) {
        return projectoneDao.selectProjectone(userid);
    }

    @Override
    public projectone sProjectone(String projectid) {
        return projectoneDao.sProjectone(projectid);
    }

    @Override
    public boolean addProjectone(projectone pone) {
        projectoneDao.deleteProjectone(pone.getProjectid());
        return projectoneDao.addProjectone(pone);
    }

    @Override
    public boolean updateProjectone(projectone pone) {
        return true;
    }
}
