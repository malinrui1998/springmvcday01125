package controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pojo.User;
import service.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    UserDao userDao;
    @Autowired
    HttpServletRequest request;

    @RequestMapping("getUserByid.action")
    public ModelAndView getUserByid(int id) {
        User user = userDao.getUserByid(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("modify");
        return modelAndView;
    }

    @RequestMapping("/update.action")
    public String update(User user, MultipartFile pictureFile) throws IOException {
        String filename = UUID.randomUUID().toString().replaceAll("-", "");
        String extension = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
        filename = filename + "." + extension;
        pictureFile.transferTo(new File("D:\\upload\\" + filename));
        user.setHeadpath(filename);
        int updatehead = userDao.updatehead(user);
        return "redirect:/userList.action";
    }

    @RequestMapping("/check.action")
    @ResponseBody
    public String checkName(String name) {
        int i = userDao.checkUserName(name);
        if (i > 0) {
            return "用户名已被注册";
        } else {
            return "用户名没有被使用可以注册";
        }
    }

    @RequestMapping("/searchPage.action")
    public String registerPage() {

        return "search";
    }

    @RequestMapping("/checkPage.action")
    public String checkPage() {
        return "test";
    }
    @RequestMapping(value = "/searchUserAjax.action")
    @ResponseBody
    public List<User> searchUserAjax(@RequestBody User user) {
        List<User> users = userDao.searchByWhere(user);
        return users;
    }

    @RequestMapping("/updatePwd.action")
    public  String  updatePwd2(User user) throws Exception {
        // Integer user_id = (Integer) request.getSession().getAttribute("user_id");
        HttpSession session = request.getSession();
        User user1 = (User) session.getAttribute("user");
        user.setUser_id(user1.getUser_id());
        int ps = userDao.modifyPs(user);
        if (ps>0){
            //重定向
            session.invalidate();
            return "login";//内部转发不用redirect（直接写frame）
        }else{
            return "updatePwd";
        }

}
}
