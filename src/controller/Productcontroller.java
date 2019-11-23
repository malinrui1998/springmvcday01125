package controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pojo.*;
import service.BookDao;
import service.UserDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Controller
public class Productcontroller {

    @RequestMapping("/left.action")
    public String getLeft(@RequestParam(required = false, defaultValue = "1", value = "page") int page, Model model) {
        System.out.println("Productcontroller>>>productList.action");

        //首先是设置第几页，第二各参数是每页的记录数
        PageHelper.startPage(page, 6);
        List<User> userList = userDao.getUserList();
        PageInfo pageInfo = new PageInfo(userList);
        model.addAttribute("pageInfo", pageInfo);
        return "left";
    }

    @RequestMapping("/frame.action")
    public String frame() {
        return "frame";
    }

    @RequestMapping("/userList.action")
    public String getUserList(@RequestParam(required = false, defaultValue = "1", value = "page") int page, Model model) {
        System.out.println("Productcontroller>>>productList.action");

        //首先是设置第几页，第二各参数是每页的记录数
        PageHelper.startPage(page, 6);
        List<User> userList = userDao.getUserList();
        PageInfo pageInfo = new PageInfo(userList);
        model.addAttribute("pageInfo", pageInfo);
        return "userlist";
    }

    @RequestMapping("/loginPage.action")
    public String loginPage() {
        System.out.println("Productcontroller>>>/loginPage.action");
        return "login";
    }
//**************************************用户管理**************************************

    @Autowired
    UserDao userDao;
    @Autowired
    HttpServletRequest reqeust;

    @RequestMapping("/login.action")
    public String login(User user, Model model) {
        //  model view controller
        HttpSession session = reqeust.getSession();
        User loginUser = userDao.Login(user);
        if (loginUser != null) {
            //重定向
            session.setAttribute("user", loginUser);
            return "redirect:frame.action";
            //return "redirect:/userList.action";
        } else {
            model.addAttribute("msg", "用户名密码错误");
            return "login";
        }
    }

//    @RequestMapping("getUserByid.action")
//    public ModelAndView getUserByid(int id) {
//        User user = userDao.getUserByid(id);
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("user", user);
//        modelAndView.setViewName("modify");
//        return modelAndView;
//    }
//
//    @RequestMapping("/update.action")
//    public String update(User user, MultipartFile pictureFile) throws IOException {
//        String filename = UUID.randomUUID().toString().replaceAll("-", "");
//        String extension = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
//        filename = filename + "." + extension;
//        pictureFile.transferTo(new File("D:\\upload\\" + filename));
//        user.setHeadpath(filename);
//        int updatehead = userDao.updatehead(user);
//        return "redirect:/userList.action";
//
//    }
//
//    @RequestMapping("/check.action")
//    @ResponseBody
//    public String checkName(String name) {
//        int i = userDao.checkUserName(name);
//        if (i > 0) {
//            return "用户名已被注册";
//        } else {
//            return "用户名没有被使用可以注册";
//        }
//    }
//
//    @RequestMapping("/searchPage.action")
//    public String registerPage() {
//
//        return "search";
//    }
//
//    @RequestMapping("/checkPage.action")
//    public String checkPage() {
//        return "test";
//    }
//
//
//    @RequestMapping(value = "/searchUserAjax.action")
//    @ResponseBody
//    public List<User> searchUserAjax(@RequestBody User user) {
//        List<User> users = userDao.searchByWhere(user);
//        return users;
//
//
//    }

    @RequestMapping("/searchUserAjaxPage.action")

    public String searchUserAjaxPage() {
        return "userSearch";

    }

    //**************************************图书管理**************************************

    @Autowired
    BookDao bookDao;

    @RequestMapping("/bookList.action")
    public ModelAndView getBookList(@RequestParam(required = false, defaultValue = "1", value = "page") int page, Model model) {
        ModelAndView mad = new ModelAndView();
        PageHelper.startPage(page, 4);
        List<Book> bookList = bookDao.getBookList(null);
        PageInfo pageInfo = new PageInfo(bookList);
        mad.addObject("pageInfo",pageInfo);
        mad.setViewName("bookList");
        return mad;
    }

    @RequestMapping("/billAdd.action")
    public ModelAndView billAdd(Book book, @RequestParam(required = false, defaultValue = "1", value = "page") int page)throws SQLException {
        ModelAndView mad = new ModelAndView();
        PageHelper.startPage(page, 4);
        List<Book> bookList = bookDao.getBookList(null);
        PageInfo pageInfo = new PageInfo(bookList);
        boolean bookAdd=bookDao.getBookAdd(book);
        if (bookAdd) {
            mad.addObject("pageInfo",pageInfo);
            mad.setViewName("redirect:/bookList.action");
        } else {
            mad.setViewName("billAdd");
        }
        return mad;
    }



//    view显示页面


    }


