package com.myProject.controller;

import com.myProject.model.User;
import com.myProject.service.IUserService;
import com.myProject.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

@Controller
//@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;
    //初始化
    @RequestMapping("/login.do")
    @ResponseBody
    public ModelAndView loginIn(User user, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        Map<String, Object> resultMap = new HashMap<String, Object>();
        boolean flag=false;
        if((user.getUsername()  == null)&&(user.getPassword() == null)){
            retMap.setViewName("../../login");
        }else {
            String Md5= null;
            try {
                Md5 = Utils.EncoderByMd5(user.getPassword());
                System.out.println(Md5);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            flag = userService.login(user.getUsername(),Md5);
            if(flag){
                resultMap.put("result", 1);
                String userid = userService.getuserid(user.getUsername());
                if(user.getUsername().equals("admin")){

                    retMap=new ModelAndView("redirect:/adminhome.do?username="+user.getUsername()+"&userid="+userid);
                }else {
                    retMap=new ModelAndView("redirect:/home.do?username="+user.getUsername()+"&userid="+userid);
                }
            }else{
                if((user.getUsername()  == null)&&(user.getPassword() == null)){
                    retMap.setViewName("../../login");
                }else if((user.getUsername()  == null)||(user.getPassword() == null)){
                    resultMap.put("result", 2);
                    resultMap.put("errorMsg", "登录失败！账号或密码不能为空！");
                    model.addAttribute("errorMsg", "登录失败！账号或密码不能为空！");
                    retMap.setViewName("../../login");
                }else{
                    resultMap.put("result", 3);
                    resultMap.put("errorMsg", "登录失败！账号或密码错误！");
                    model.addAttribute("errorMsg", "登录失败！账号或密码错误！");
                    retMap.setViewName("../../login");
                }
            }
        }
        return retMap;
    }
    @RequestMapping("/home.do")
    @ResponseBody
    public ModelAndView homedo(String username,String userid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("../../home");
        model.addAttribute("username", username);
        model.addAttribute("userid", userid);
        System.out.println("username:"+username);
        return retMap;
    }

    @RequestMapping("/adminhome.do")
    @ResponseBody
    public ModelAndView adminhome(String username, String userid, Model model, HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("../../adminhome");
        model.addAttribute("username", username);
        model.addAttribute("userid", userid);
        System.out.println("username:"+username);
        return retMap;
    }
}
