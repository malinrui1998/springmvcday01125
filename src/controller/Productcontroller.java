package controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import exception.ParamErrorException;
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
        PageHelper.startPage(page, 4);
        List<User> userList = userDao.getUserList();
        PageInfo pageInfo = new PageInfo(userList);

        model.addAttribute("pageInfo", pageInfo);
        return "left";
    }

    @RequestMapping("/userList.action")
    public String getUserList(@RequestParam(required = false, defaultValue = "1", value = "page") int page, Model model) {
        System.out.println("Productcontroller>>>productList.action");

        //首先是设置第几页，第二各参数是每页的记录数
        PageHelper.startPage(page, 4);
        List<User> userList = userDao.getUserList();
        PageInfo pageInfo = new PageInfo(userList);

        model.addAttribute("pageInfo", pageInfo);
        return "userlist";
    }

    @RequestMapping("/bookList.action")
    public String getBookList(@RequestParam(required = false, defaultValue = "1", value = "page") int page, Model model) {
        System.out.println("Productcontroller>>>productList.action");

        //首先是设置第几页，第二各参数是每页的记录数
        PageHelper.startPage(page, 4);
        List<Book> bookList = bookDao.getBookList();
        PageInfo pageInfo = new PageInfo(bookList);

        model.addAttribute("pageInfo", pageInfo);
        return "bookList";
    }

    @RequestMapping("/loginPage.action")
    public String loginPage() {
        System.out.println("Productcontroller>>>/loginPage.action");
        return "login";
    }


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
            return "redirect:/left.action";
            //return "redirect:/userList.action";
        } else {
            model.addAttribute("msg", "用户名密码错误");
            return "login";
        }
    }

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


    @RequestMapping(value = "/search.action", method = RequestMethod.POST)

    public @ResponseBody
    List<Product> search(@RequestBody User user1) {

        List<Product> list = new ArrayList<>();
        list.add(new Product(1, "phone", 20.0f, new Date(), "test"));
        list.add(new Product(1, "phone", 20.0f, new Date(), "test"));
        list.add(new Product(1, "手机", 20.0f, new Date(), "test"));
        return list;

    }


    @RequestMapping(value = "/searchUserAjax.action")
    @ResponseBody
    public List<User> searchUserAjax(@RequestBody User user) {
        List<User> users = userDao.searchByWhere(user);
        return users;


    }

    @RequestMapping("/searchUserAjaxPage.action")

    public String searchUserAjaxPage() {
        return "userSearch";

    }

    @Autowired
    BookDao bookDao;

    @RequestMapping("borrowBook.action")
    public String borrowBook(Model model) {
        List<Book> books = bookDao.borrowBookList();
        model.addAttribute("books", books);
        return "bookList";
    }

    @RequestMapping("borrow.action")
    public String borrow(BorrowBookUser b) {
        HttpSession session = reqeust.getSession();
        User user = (User) session.getAttribute("user");
        b.setUserid(user.getUser_id());
        bookDao.borrow(b);
        return "redirect:borrowBook.action";
    }


}
