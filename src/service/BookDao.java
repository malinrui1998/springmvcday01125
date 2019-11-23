package service;

import pojo.Book;
import pojo.BorrowBookUser;
import pojo.User;

import java.util.List;

public interface BookDao {
    public List<Book> borrowBookList();
    public void borrow(BorrowBookUser b);
    public List<Book> getBookList(Book book);


    public boolean getBookAdd(Book book);
}
