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
import java.util.List;

@Controller
public class AdminProjectController {
    @Resource
    private IProjectoneService projectService;

    @Resource
    private IProjectthreeService projectthreeService;

    @Resource
    private IProjecttwoService projecttwoService;

    @RequestMapping("/homeiframe.do")
    @ResponseBody
    public ModelAndView homedo(String userid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        List<projectone> list =projectService.selectProjectone(userid);
//        Map<String, Object> resultMap = new HashMap<String, Object>();
        retMap.setViewName("../../homeiframe");
//        resultMap.put("username", username);
        model.addAttribute("projectlist", list);
        model.addAttribute("userid", userid);
        return retMap;
    }
    @RequestMapping("/addproject.do")
    @ResponseBody
    public ModelAndView addproject(String projectid,String userid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        List<projecttwo> list=projecttwoService.selectProjecttwos(projectid);
        projectone pone=projectService.sProjectone(projectid);

//        Map<String, Object> resultMap = new HashMap<String, Object>();
        retMap.setViewName("../../addproject");
        JSONArray json = JSONArray.fromObject(list);
        System.out.println(json.toString());
        if(pone!=null){
            model.addAttribute("projectname",pone.getProjectname());
        }
        model.addAttribute("list",json);
        model.addAttribute("size",list.size());
        model.addAttribute("projectid", projectid);
        model.addAttribute("userid", userid);
        return retMap;
    }

    @RequestMapping("/addprojectthree.do")
    @ResponseBody
    public ModelAndView addprojectthree(String projecttwoid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();//返回新的ModelAndView
        List<projectthree> list=projectthreeService.selectProjectthree(projecttwoid);
        retMap.setViewName("../../addprojectthree");
        model.addAttribute("projecttwoid",projecttwoid);
        JSONArray json = JSONArray.fromObject(list);
        System.out.println(json);
        model.addAttribute("list",json);
        model.addAttribute("size",list.size());
        return retMap;
    }

    @RequestMapping("/addprojectthreedate.do")
    @ResponseBody
    public ModelAndView addprojectthreedate(String projecttwoid,String listinput,String listinputf,String listinput2,String projectthreeidlist, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        List<projectthree> listprojectthreeadd=new ArrayList<>();
        System.out.println(listinput);
        System.out.println(listinputf);
        System.out.println(listinput2);
        System.out.println(projectthreeidlist);
        System.out.println(projecttwoid);
        String[] strlistinput=listinput.split(",");
        String[] strlistinputf=listinputf.split(",");
        String[] strlistinput2=listinput2.split(",");//TODO
        String[] strprojectthreeidlist=projectthreeidlist.split(",");
        for(int i=0;i<strlistinput.length;i++){
            projectthree pthree=new projectthree();
            pthree.setTwoid(projecttwoid);
            pthree.setThreeid(strprojectthreeidlist[i]);
            pthree.setThreef(strlistinputf[i]);
            if(strlistinput2[i]==null||strlistinput2[i].equals("")) pthree.setInput2(" ");
            else pthree.setInput2(strlistinput2[i]);
            pthree.setThreename(strlistinput[i]);
            listprojectthreeadd.add(pthree);
        }
        retMap.setViewName("../../projectthreeshow");
        JSONArray json = JSONArray.fromObject(listprojectthreeadd);
        model.addAttribute("list", json);
        projectthreeService.addProjectthreelist(listprojectthreeadd,projecttwoid);
        return retMap;
    }
    @RequestMapping("/projectthreeshow.do")
    @ResponseBody
    public ModelAndView projectthreeshow(String twoid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();//返回新的ModelAndView
        List<projectthree> list=projectthreeService.selectProjectthree(twoid);
        retMap.setViewName("../../projectthreeshow");
        model.addAttribute("projecttwoid",twoid);
        JSONArray json = JSONArray.fromObject(list);
        model.addAttribute("list",json);
        model.addAttribute("size",list.size());
        return retMap;
    }

    @RequestMapping("/addprojecttwodate.do")
    @ResponseBody
    public ModelAndView addprojecttwodate(String userid,String juanname,String twoname,String projectname,String projecttwoid,String projectid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
//        retMap.setViewName("../../homeiframe");
//        model.addAttribute("userid", userid);
        retMap=new ModelAndView("redirect:/homeiframe.do?userid="+userid);
        projectone pone=new projectone();
        pone.setProjectid(projectid);
        pone.setProjectname(projectname);
        pone.setUserid(userid);
        projecttwoService.addProjecttwo(juanname,twoname,projectname,projecttwoid,projectid);
        projectService.addProjectone(pone);
        return retMap;
    }

    @RequestMapping("/admindetails.do")
    @ResponseBody
    public ModelAndView admindetails(String projectid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        List<projectall> palllist=new ArrayList<>();
        List<projecttwo> projecttwolist=projecttwoService.selectProjecttwos(projectid);
        for (int i=0;i<projecttwolist.size();i++){
            List<projectthree> projectthreelist=projectthreeService.selectProjectthree(projecttwolist.get(i).getTwoid());
            for (int j=0;j<projectthreelist.size();j++){
                projectall pall=new projectall();
                pall.setId(projectthreelist.get(j).getThreeid());
                if(projectthreelist.get(j).getInput2()!=null&&!projectthreelist.get(j).getInput2().equals(" ")&&!projectthreelist.get(j).getInput2().equals("")){
                    pall.setInput2("关键词匹配");
                }else if(projectthreelist.get(j).getFilename()!=null&&!projectthreelist.get(j).getFilename().equals("")){
                    pall.setInput2("模板匹配");
                }else {
                    pall.setInput2("");
                }
                pall.setJuanname(projecttwolist.get(i).getJuanname());
                pall.setTwoname(projecttwolist.get(i).getTwoname());
                pall.setThreef(projectthreelist.get(j).getThreef());
                pall.setThreename(projectthreelist.get(j).getThreename());
                palllist.add(pall);
            }
        }
        retMap.setViewName("../../admindetails");
        model.addAttribute("palllist", palllist);
        model.addAttribute("projectid", projectid);
        return retMap;
    }


}
