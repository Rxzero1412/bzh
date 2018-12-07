package com.myProject.service.impl;

import com.myProject.dao.IProjectthreeDao;
import com.myProject.dao.IProjecttwoDao;
import com.myProject.model.projectthree;
import com.myProject.model.projecttwo;
import com.myProject.service.IProjectthreeService;
import com.myProject.service.IProjecttwoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("projecttwoService")
public class ProjecttwoServiceImpl implements IProjecttwoService {

    @Resource
    private IProjecttwoDao projecttwoDao;


    @Override
    public List<projecttwo> selectProjecttwos(String projectid) {
        return projecttwoDao.selectProjecttwos(projectid);
    }

    @Override
    public boolean addProjecttwolist(List<projecttwo> ptwolist,String projectid) {
        projecttwoDao.deleteProjecttwo(projectid);
        return projecttwoDao.addProjecttwolist(ptwolist);
    }

    @Override
    public boolean addProjecttwo(String juanname, String twoname, String projectname, String projecttwoid, String projectid) {
        List<projecttwo> listprojecttwoadd=new ArrayList<>();
        String[] juannamestr=juanname.split(",");
        String[] twonamestr=twoname.split(",");
        String[] projecttwoidstr=projecttwoid.split(",");
        for(int i=0;i<projecttwoidstr.length;i++){
            projecttwo ptwo=new projecttwo();
            ptwo.setJuanname(juannamestr[i]);
            ptwo.setTwoname(twonamestr[i]);
            ptwo.setTwoid(projecttwoidstr[i]);
            ptwo.setProjectid(projectid);
            listprojecttwoadd.add(ptwo);
        }
        projecttwoDao.deleteProjecttwo(projectid);
        return projecttwoDao.addProjecttwolist(listprojecttwoadd);
    }

    @Override
    public boolean deleteProjecttwo(String twoid) {
        return projecttwoDao.deleteProjecttwo(twoid);
    }
}
