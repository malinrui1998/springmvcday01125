package service;

import pojo.Book;
import pojo.Borrow;

import java.util.List;

public interface BookDao {
    public List<Book> getBookList(Book book);

    public boolean getBookAdd(Book book);

    public Book getBookByid(Integer id);

    public boolean updateBook(Book book) throws Exception;

    public boolean deleteByid(Book book) throws Exception;

    public boolean Register(Book book) throws Exception;

    public boolean borrow(Borrow borrow) throws Exception;

    public boolean lendUpdate(Integer id) throws Exception;

}
