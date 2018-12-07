package com.myProject.controller;

import com.myProject.model.projectall;
import com.myProject.model.projectone;
import com.myProject.model.projectthree;
import com.myProject.model.projecttwo;
import com.myProject.service.IProjectoneService;
import com.myProject.service.IProjectthreeService;
import com.myProject.service.IProjecttwoService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class userProjectController {
    @Resource
    private IProjectoneService projectoneService;

    @Resource
    private IProjectthreeService projectthreeService;

    @Resource
    private IProjecttwoService projecttwoService;


    @RequestMapping("/useraddproject.do")
    @ResponseBody
    public ModelAndView useraddproject(String projectid,String userid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        List<projectone> list =projectoneService.selectProjectone("0");
        retMap.setViewName("../../useraddproject");
        JSONArray json = JSONArray.fromObject(list);
        System.out.println(json.toString());
        model.addAttribute("list",json);
        model.addAttribute("size",list.size());
        model.addAttribute("projectid", projectid);
        model.addAttribute("userid", userid);
        return retMap;
    }

    @RequestMapping("/showaddnext.do")
    @ResponseBody
    public ModelAndView showaddnext(String projectid,String userid,Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("../../useraddprojectnext");
        List<projectall> palllist=new ArrayList<>();
        List<projecttwo> listtwo =projecttwoService.selectProjecttwos(projectid);
        for (int i=0;i<listtwo.size();i++){
            projecttwo ptwo=listtwo.get(i);
            List<projectthree> listthree =projectthreeService.selectProjectthree(ptwo.getTwoid());
            for (int j=0;j<listthree.size();j++){
                projectthree pthree=listthree.get(j);
                projectall pall=new projectall();
                pall.setId(pthree.getThreeid());
                pall.setJuanname(ptwo.getJuanname());
                pall.setTwoname(ptwo.getTwoname());
                pall.setThreename(pthree.getThreename());
                pall.setFilename(pthree.getFilename());
                palllist.add(pall);
            }
        }
        JSONArray json = JSONArray.fromObject(palllist);
        System.out.println(json.toString());
        model.addAttribute("list",json);
        model.addAttribute("userid",userid);
        model.addAttribute("projectid",projectid);

        return retMap;
    }

    @RequestMapping("/addnext.do")
    @ResponseBody
    public ModelAndView addnext(String projectid,String userid,String projectname,String projects, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView("../showaddnext.do?projectid="+projectid+"&userid="+userid);
        List<projectone> list =projectoneService.selectProjectone("0");
        projectone pone=new projectone();
        pone.setUserid(userid);
        pone.setProjectname(projectname);
        pone.setProjectid(projectid);
        projectoneService.addProjectone(pone);
        String projectsid="";
        for (int i=0;i<list.size();i++){
            projectone p=list.get(i);
            if(p.getProjectname().equals(projects)){
                projectsid=p.getProjectid();
            }
        }
        List<projecttwo> listtwo =projecttwoService.selectProjecttwos(projectsid);
        for (int i=0;i<listtwo.size();i++){
            projecttwo ptwo=listtwo.get(i);
            List<projectthree> listthree =projectthreeService.selectProjectthree(ptwo.getTwoid());
            Date date = new Date();
            String twoid=Long.toString(date.getTime()+1+i);
            listtwo.get(i).setProjectid(projectid);
            listtwo.get(i).setTwoid(twoid);
            for (int j=0;j<listthree.size();j++){
                Date datethree = new Date();
                String threeid=Long.toString(datethree.getTime()+2+j);
                listthree.get(j).setTwoid(twoid);
                listthree.get(j).setThreeid(threeid);
            }
            projectthreeService.addProjectthreelist(listthree,null);
        }
        projecttwoService.addProjecttwolist(listtwo,projectid);
        return retMap;
    }
}
