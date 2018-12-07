package com.myProject.controller;

import com.myProject.model.projectthree;
import com.myProject.service.IProjectthreeService;
import net.sf.json.JSONArray;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class FileController {

    @Resource
    private IProjectthreeService projectthreeService;

    //单文件上传
    @RequestMapping(value = "/upload.do")
    public ModelAndView queryFileData(
            @RequestParam("uploadfile") CommonsMultipartFile file,
            @RequestParam("id") String id,
            @RequestParam("projectid") String projectid,
            @RequestParam("userid") String userid,
            Model model,
            HttpServletRequest request) {
        ModelAndView retMap;
        if(userid==null) retMap =new ModelAndView("redirect:/admindetails.do?projectid="+projectid);
        else retMap =new ModelAndView("redirect:/showaddnext.do?projectid="+projectid+"&userid="+userid);

//        projectthree pthree=projectthreeService.sProjectthree(id);
//        model.addAttribute("threename",pthree.getThreename());
//        model.addAttribute("threeid",id);
        if (!file.isEmpty()) {
            String type = file.getOriginalFilename().substring(
                    file.getOriginalFilename().indexOf("."));// 取文件格式后缀名
            String filename = id;// 取当前时间戳作为文件名
            String path = "D:\\File\\"+id+"."+type;// 存放位置
            File destFile = new File(path);
            try {
                // FileUtils.copyInputStreamToFile()这个方法里对IO进行了自动操作，不需要额外的再去关闭IO流
                FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);// 复制临时文件到指定目录下
                projectthree pthree=projectthreeService.sProjectthree(id);
                pthree.setFilename(file.getOriginalFilename());
                projectthreeService.updateProjectthree(pthree);
            } catch (IOException e) {
                e.printStackTrace();
            }

        } else {
        }
        return retMap;
    }
    @RequestMapping("/fileupload.do")
    @ResponseBody
    public ModelAndView fileupload(String threeid,String projectid,String userid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();//返回新的ModelAndView
        retMap.setViewName("../../fileupload");
        projectthree pthree=projectthreeService.sProjectthree(threeid);
        model.addAttribute("threename",pthree.getThreename());
        model.addAttribute("threeid",threeid);
        model.addAttribute("projectid",projectid);
        model.addAttribute("userid",userid);
        //model.addAttribute("size",list.size());
        return retMap;
    }
    @RequestMapping("/showpsys.do")
    @ResponseBody
    public ModelAndView showpsys(String threeid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();//返回新的ModelAndView

        //TODO 预览
        projectthree pthree=projectthreeService.sProjectthree(threeid);
        if(pthree.getFilename()!=null&&!pthree.getFilename().equals("")){
            retMap.setViewName("../../showmb");
        }else {
            retMap.setViewName("../../showgjz");
        }
        model.addAttribute("threename",pthree.getThreename());
        model.addAttribute("filename",pthree.getFilename());
        model.addAttribute("input2",pthree.getInput2());
        model.addAttribute("threeid",threeid);
        //model.addAttribute("size",list.size());
        return retMap;
    }
}