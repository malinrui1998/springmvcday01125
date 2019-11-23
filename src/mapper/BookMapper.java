package mapper;

import pojo.Book;

import java.util.List;

public interface BookMapper {
    public List<Book> getBookList(Book book);
    public boolean getBookAdd(Book book);
}
