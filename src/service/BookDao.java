package service;

import pojo.Book;

import java.util.List;

public interface BookDao {
    public List<Book> getBookList(Book book);
    public boolean getBookAdd(Book book);
}
