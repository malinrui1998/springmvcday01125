package controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pojo.*;
import service.BookDao;
import service.UserDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
public class BookContorller {

    @RequestMapping("/left.action")
    public String getLeft(@RequestParam(required = false, defaultValue = "1", value = "page") int page, Model model) {
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

    @RequestMapping("/bill2.action")
    public ModelAndView bill2(@RequestParam(required = false,defaultValue = "1",value = "page")int page,Book book){
        ModelAndView mad=new ModelAndView();
        PageHelper.startPage(page,5);
        List<Book> bookList = bookDao.getBookList(book);
        PageInfo pageInfo=new PageInfo(bookList);

        mad.addObject("pageInfo",pageInfo);
        mad.setViewName("bill2");
        return mad;
    }
    @RequestMapping("/billView.action")
    public ModelAndView billView(@RequestParam(required = false,defaultValue = "1",value = "page")int page,String bookname, String writer){
        ModelAndView mav = new ModelAndView();
//      PageHelper.startPage(page,5);
        List<Book> books = bookDao.selectById(bookname,writer);
        PageInfo pageInfo=new PageInfo(books);
        mav.addObject("pageInfo",pageInfo);
        mav.setViewName("billList");
        return mav;
    }

    @RequestMapping("/deleteBook.action")
    public String deleteBook(Model model,Integer bookid) {
        bookDao.deleteBook (bookid);
        return "billList";
    }
    @RequestMapping("/billUpdate.action")
    public ModelAndView billUpdate(String bookname,String writer) {
        ModelAndView mav = new ModelAndView();
        List<Book> books= bookDao.selectById(bookname,writer);
        mav.addObject("books", books);
        mav.setViewName("billUpdate");
        return mav;
    }
    @RequestMapping("/updateBook.action")
    public ModelAndView update(Book book){
        ModelAndView mav = new ModelAndView();
        bookDao.updateBook (book);
        Book book1=null;
        List<Book> billList = bookDao.getBookList(book);
        mav.addObject("billList",billList);
        mav.setViewName("billList");
        return mav;
    }

//    view显示页面


    }

