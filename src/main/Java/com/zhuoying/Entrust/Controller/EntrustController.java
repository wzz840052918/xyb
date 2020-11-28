package com.zhuoying.Entrust.Controller;

import com.zhuoying.Entrust.Service.IEntrustService;
import com.zhuoying.Entrust.bean.Entrust;
import com.zhuoying.User.Bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class EntrustController {
    @Autowired
    private IEntrustService entrustService;

    /**
     * 发布委托
     */
    @RequestMapping(value = "/publish.do", method = RequestMethod.POST)
    public String publishEntrust(String title, String content, int level, Double price, HttpServletRequest request, HttpSession session, Model model) throws ParseException {
        System.out.println("data:" + title);
        //补全
        User session_user = (User) session.getAttribute("session_user");
        Entrust entrust = new Entrust();
        entrust.setTitle(title);
        entrust.setUid(session_user.getUid());
        entrust.setNickname(session_user.getNickname());
        entrust.setContent(content);
        entrust.setLevel(level);
        entrust.setPrice(price);
        //格式化日期
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        Date date = new Date();
        String strDate = sdf.format(date);
        entrust.setDatetime(strDate);
        entrust.setState(0);

        System.out.println(entrust);
        //发布 到 管理员待审核页面
        int index = entrustService.publish_admin(entrust);

        if (index >= 1) {
            //发布成功
            model.addAttribute("msg", "请等待审核...");
            System.out.println("发布成功！");
            //返回到 已发布委托页面
            return "user/publish";
        } else {
            //发布失败  返回到 我的 界面
            model.addAttribute("msg", "发布失败...请重试");
            System.out.println("发布失败！");
            return "user/myde";
        }
    }

    /**
     * 接取委托
     */
    @RequestMapping(value = "/getEntrust.do", method = RequestMethod.POST)
    @ResponseBody
    public Integer getEntrust(@RequestParam("enid") Integer enid, HttpSession session) {
        //根据委托id获取该条委托
        //更改委托state为1，填入eid为session_user的uid
        Entrust entrust = entrustService.getEntrustById(enid);
        entrust.setState(1);
        User session_user = (User) session.getAttribute("session_user");
        entrust.setEid(Integer.valueOf(session_user.getUid()));
        //提交
        int index = entrustService.updateEntrust(entrust);
        return index;
    }

    /**
     * 完成委托
     */
    @RequestMapping("/finishEntrust.do")
    @ResponseBody
    public Integer finishEntrust(Integer enid, HttpSession session) {
        //根据委托id获取该条委托
        //更改委托state为2
        Entrust entrust = entrustService.getEntrustById(enid);
        entrust.setState(2);
        //提交
        int index = entrustService.updateEntrust(entrust);
        return index;
    }

    /**
     * 删除委托
     */
    @RequestMapping("/deleteEntrust.do")
    @ResponseBody
    public Integer deleteEntrust(Integer enid) {
        System.out.println("delete enid:" + enid);
        Integer index = entrustService.deleteEntrust(enid);
        System.out.println(index + ":index");
        return index;
    }

    /**
     * 查找所有委托
     */
    @RequestMapping("/getAllEntrust")
    public String getAllEntrust(HttpServletRequest request) {
        List<Entrust> entrustList = entrustService.getAllEntrust();
        System.out.println(entrustList);
        request.setAttribute("entrustList", entrustList);
        return "user/main";
    }

    @RequestMapping("/getAllEntrust1")
    public String getAllEntrust1(HttpServletRequest request) {
        List<Entrust> entrustList = entrustService.getAllEntrust();
        System.out.println(entrustList);
        request.setAttribute("entrustList", entrustList);
        return "user/entrust";
    }

    /**
     * 点击悬赏列表中的某一个悬赏
     * 携带enid，进入此方法，根据enid查找该委托
     * 返回到 entrustInformation。jsp页面
     *
     * @return
     */
    @RequestMapping("/entrustInformation")
    public String entrustInformation(Integer enid, HttpServletRequest request) {
        //从entrust表中找
        Entrust entrust = entrustService.getEntrustById(enid);
        request.setAttribute("entrustInformation", entrust);

        return "user/entrustInformation";
    }

    /**
     * 待审核页面进入委托信息页面
     */
    @RequestMapping("/entrustCheckInformation")
    public String entrustCheckInformation(Integer enid, HttpServletRequest request) {
        Entrust entrust = entrustService.getCheckEntrustById(enid);
        request.setAttribute("entrustInformation", entrust);
        request.setAttribute("flag", "check");
        return "user/entrustInformation";
    }

    /**
     * 获取session_user的所有接下的委托
     */
    @RequestMapping("/getPersonalEntrustById")
    public String getEntrustById(HttpSession session, HttpServletRequest request) {
        User session_user = (User) session.getAttribute("session_user");
        List<Entrust> entrustList = entrustService.getPersonalEntrustById(session_user.getUid());
        request.setAttribute("entrustList", entrustList);
        return "user/personalEntrust";
    }

    /**
     * 获取session_user 的所有发布的委托  getPersonalEntrustByUid
     * 获取session_user 的所有审核中的委托  getPersonalCheckEntrustByUid
     */
    @RequestMapping("/getPersonalEntrustByUid")
    public String getPersonalEntrustByUid(HttpSession session, HttpServletRequest request) {
        User session_user = (User) session.getAttribute("session_user");
        //所有已发布的委托
        List<Entrust> entrustList = entrustService.getPersonalEntrustByUid(session_user.getUid());
        request.setAttribute("entrustList", entrustList);
        //所有未审核的委托
        List<Entrust> checkEntrustList = entrustService.getPersonalCheckEntrustByUid(session_user.getUid());
        request.setAttribute("checkEntrustList", checkEntrustList);
        return "user/personalCheckEntrust";
    }
}
