package mapper;

import pojo.Book;
import pojo.BorrowBookUser;
import pojo.User;

import java.util.List;

public interface BookMapper {
    public List<Book> borrowBookList();

    public void borrow(BorrowBookUser b);

    public List<Book> getBookList();
}
