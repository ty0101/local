package com.blog.controller;


import com.blog.entity.Blogger;
import com.blog.utils.SysConstant;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author KazuGin
 * @since 2019-10-11
 */
@Controller
@RequestMapping("/blogger")
public class BloggerController {


    @PostMapping("/login")
    public String login(Blogger blogger){
        //1.得到当前登录用户（主体）
        Subject subject= SecurityUtils.getSubject();
        try {
            //2.创建登录令牌
            UsernamePasswordToken token = new UsernamePasswordToken(blogger.getUserName(),blogger.getPassword());
            //3.登录
            subject.login(token);
            //保存当前登录用户
            subject.getSession().setAttribute(SysConstant.LOGINUSER,blogger);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/login.html";
        }
        //登录成功去到后台首页
        return "redirect:/admin/index";


    }

}

