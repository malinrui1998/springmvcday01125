package service;

import pojo.Book;
import pojo.Borrow;

import java.util.List;

public interface BookDao {
    public List<Book> getBookList(Book book);

    public boolean getBookAdd(Book book);

    public List<Book> selectBill2(Book book);

    public List<Book> selectById(String productName, String productUnit);

    public void insertBorrow(Borrow borrow);

    public void deleteBook(Integer id);

    public void updateBook(Book book);

    public void updatePress(Book book);
}
