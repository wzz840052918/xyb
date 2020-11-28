package com.zhuoying.User.Controller;

import com.zhuoying.User.Bean.User;
import com.zhuoying.User.Service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    IUserService userService;

    /**
     * 拦截器作用
     */
    @RequestMapping("/login.pass")
    public String InterceptorLogin() {
        return "redirect:/jsps/user/publish.jsp";

    }

    @RequestMapping("/login1.pass")
    public String InterceptorLogin1() {
        return "redirect:/jsps/user/myde.jsp";

    }

    /**
     * 登录
     *
     * @param username 表单获取
     * @param password 表单获取
     * @param session  向session域中保存登录用户
     * @param model    携带错误数据返回页面
     * @return
     */
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session, Model model) {
        System.out.println(username + "," + password);
        if ("root".equals(username) && "2552293".equals(password)) {
            return "admin/adduser";
        }
        User user = userService.login(username, password);
        if (user == null) {
            model.addAttribute("msg", "该用户不存在！");
        } else {
            if (password.equals(user.getPassword())) {
                session.setAttribute("session_user", user);
                return "forward:/getAllEntrust";
            } else {
                model.addAttribute("username", username);
                model.addAttribute("msg", "您输入的密码错误！");

            }
        }
        return "user/login1";
    }

    /**
     * 注册
     *
     * @param request 用来存放数据
     * @return 成功，返回到登录页面，失败返回到注册页面
     */
    @RequestMapping("/regist")
    public String regist(HttpServletRequest request) {
        Integer uid = Integer.valueOf(request.getParameter("uid"));
        String nickname = request.getParameter("nickname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setNickname(nickname);
        user.setUid(uid);
        user.setUsername(username);
        user.setPassword(password);

        Integer index = userService.regist(user);
        if (index >= 1) {
            //成功
            //给个拟态框，三秒后跳转到 登录界面
            request.setAttribute("msg", "注册成功！三秒后跳转到登录界面...");

        } else {
            //失败
            request.setAttribute("msg", "注册失败...该用户名已存在！");
        }
        return "user/regist";
    }

    /**
     * 登出
     */
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        //消除session  转发到myde页面
        session.invalidate();
        return "user/login1";
    }


    /**
     * 修改密码
     * <p>
     * 从session中获取属性session_user,
     * 传进来两个String，第一个是旧密码，第二个是新密码
     */
    @RequestMapping("/editPassword")
    public String editPassword(HttpSession session, String oldpassword, String newpassword, HttpServletRequest request) {
        User user = (User) session.getAttribute("session_user");
        if (!user.getPassword().equals(oldpassword)) {
            request.setAttribute("msg", "您输入的旧密码错误！");
            return "user/editPassword";
        }
        Integer index = userService.editPassword(user.getUid(), newpassword);
        if (index >= 1) {
            //修改成功
            return "user/myde";
        } else {
            //修改失败
            request.setAttribute("msg", "您输入的旧密码错误！");
            return "user/editPassword";
        }
    }
}
