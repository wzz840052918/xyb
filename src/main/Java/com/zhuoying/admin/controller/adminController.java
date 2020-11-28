package com.zhuoying.admin.controller;

import com.zhuoying.Entrust.Service.IEntrustService;
import com.zhuoying.Entrust.bean.Entrust;
import com.zhuoying.User.Bean.User;
import com.zhuoying.User.Service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class adminController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IEntrustService entrustService;

    /**
     * adduser
     * 添加用户
     */
    @RequestMapping("/adduser")
    public String addUser(Integer uid, String nickname, String username, String password, HttpServletRequest request) {
        User user = new User();
        user.setUid(uid);
        user.setNickname(nickname);
        user.setUsername(username);
        System.out.println(nickname);
        user.setPassword(password);
        int index = userService.regist(user);
        if (index > 0) {
            //成功
            request.setAttribute("msg", "添加成功！");
        } else {
            //失败
            request.setAttribute("msg", "添加失败！");
        }
        return "admin/adduser";
    }

    /**
     * 修改用户  先获取所有的用户信息
     */
    @RequestMapping("/getAllUserInformation")
    public String getAllUserInformation(Model model) {
        List<User> userList = userService.getAllUserInformation();
        model.addAttribute("userList", userList);
        return "admin/edituser";
    }

    /**
     * 删除用户
     */
    @RequestMapping("/deleteUserInformation")
    public String deleteUserInformation(Integer uid, Model model) {
        int index = userService.deleteUserInformation(uid);
        if (index > 0) {
            model.addAttribute("msg", "删除成功!");
            return "forward:/getAllUserInformation";
        } else {
            model.addAttribute("msg", "删除失败!");
            return "forward:/getAllUserInformation";
        }
    }

    /**
     * 获取所有未审核委托
     */
    @RequestMapping("/getAllEntrusting")
    public String getAllEntrsting(Model model) {
        List<Entrust> entrustList = entrustService.getAllEntrsting();
        model.addAttribute("entrustList", entrustList);
        model.addAttribute("index", 0);
        return "admin/entrusting";
    }

    /**
     * 获取所有已审核委托
     */
    @RequestMapping("/getAllEntrusted")
    public String getAllEntrsted(Model model) {
        List<Entrust> entrustList = entrustService.getAllEntrust();
        model.addAttribute("entrustList", entrustList);
        model.addAttribute("index", 0);
        return "admin/entrusted";
    }

    /**
     * 删除委托
     */
    @RequestMapping("/deleteEntrust")
    public String deleteEntrust(Integer enid, Model model) {
        int index = entrustService.deleteEntrust(enid);
        if (index > 0) {
            //删除成功
            model.addAttribute("msg", "删除成功!");
            return "forward:getAllEntrusted";
        } else {
            model.addAttribute("msg", "删除失败!");
            return "forward:getAllEntrusted";
        }

    }

    /**
     * 通过委托
     */
    @RequestMapping("/passEntrust")
    public String passEntrust(Integer enid, Model model) {
        //先获取该Entrust
        Entrust entrust = entrustService.getEntrustByIdInAdmin(enid);
        entrust.setState(0);
        int index = entrustService.deleteEntrustByEnid(enid);
        System.out.println(index);
        if (index > 0) {
            model.addAttribute("msg", "删除成功!");
            //提交到Entrust表中
            int index1 = entrustService.publish(entrust);
            if (index1 > 0) {
                model.addAttribute("msg", "已通过！");
                return "forward:getAllEntrusting";
            } else {
                model.addAttribute("msg", "审核失败，未通过！");
                return "forward:getAllEntrusting";
            }
        } else {
            model.addAttribute("msg", "数据库错误！");
            return "forward:getAllEntrusting";
        }
    }

    /**
     * 不通过委托
     */
    @RequestMapping("/noPassEntrust")
    public String noPassEntrust(Integer enid, Model model) {
        //直接删除该委托
        int index = entrustService.deleteEntrustByEnid(enid);
        if (index > 0) {
            //删除成功
            model.addAttribute("msg", "删除成功!");
            return "forward:getAllEntrusting";
        } else {
            model.addAttribute("msg", "删除失败!");
            return "forward:getAllEntrusting";
        }
    }

    /**
     * 修改用户信息
     */
    @RequestMapping("/edituserInformation")
    public String edituserInformation(User form, Model model) {
        //把 用户信息传入到jsp中
        User user = userService.findByUid(form.getUid());
        model.addAttribute("user", user);
        return "admin/edituserInformation";
    }

    @RequestMapping("/editUser")
    public String editUser(User form, Model model) {
        int index = userService.updateUser(form);
        if (index > 0) {
            //修改成功
            model.addAttribute("msg", "修改成功!");
        } else {
            model.addAttribute("msg", "修改失败！");
        }
        return "forward:getAllUserInformation";
    }

    /**
     * 批量通过
     */
    @RequestMapping("/DuoPass")
    public String duoPass(int[] array1, Model model) {
        //先获得所有要通过的委托，
        List<Entrust> entrustList = entrustService.getAllEntrustByArray(array1);
        //把List中的所有元素的state的值变为0
        for (int i = 0; i < entrustList.size(); i++) {
            entrustList.get(i).setState(0);
        }
        System.out.println("现在list中的state的值：" + entrustList.get(0).getState());
        System.out.println(entrustList);
        //删除这些委托
        int index = entrustService.deleteDuoEntrust(array1);
        if (index > 0) {
            System.out.println("删除成功！");
            //把这些entrulist中的委托加入到 entrust表中
            int index1 = entrustService.addDuoEntrust(entrustList);
            if (index1 > 0) {
                model.addAttribute("msg", "审核成功！");
                System.out.println("审核成功了！");
                return "forward:getAllEntrusting";
            } else {
                model.addAttribute("msg", "审核失败！");
                return "forward:getAllEntrusting";
            }
        } else {
            System.out.println("审核失败！");
            model.addAttribute("msg", "审核失败！");
            return "forward:getAllEntrusting";
        }
    }

    /**
     * 批量不通过
     */
    @RequestMapping("/DuoNoPass")
    public String duoNoPass(int[] array1, Model model) {
        //删除这些委托
        int index = entrustService.deleteDuoEntrust(array1);
        if (index > 0) {
            model.addAttribute("msg", "取消审核成功!");
        } else {
            System.out.println("取消审核失败！");
            model.addAttribute("msg", "取消审核失败！");
            return "forward:getAllEntrusting";
        }
        return "forward:getAllEntrusting";
    }

    /**
     * 批量删除
     */
    @RequestMapping("/DuoDelete")
    public String duoDelete(int array1[], Model model) {
        //删除这些委托
        int index = entrustService.deleteDuoEntrustOnEntrustTable(array1);
        if (index > 0) {
            model.addAttribute("msg", "删除成功!");
        } else {
            model.addAttribute("msg", "删除失败！");
            return "forward:getAllEntrusted";
        }
        return "forward:getAllEntrusted";
    }
}
