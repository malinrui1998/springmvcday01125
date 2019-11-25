package service;

import mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Book;
import pojo.Borrow;

import java.util.List;

@Service
public class BookDaoImpl implements BookDao {
    @Autowired
    BookMapper bookMapper;

    @Override
    public List<Book> getBookList(Book book) {
        return bookMapper.getBookList(book);
    }

    @Override
    public boolean getBookAdd(Book book) {
        return bookMapper.getBookAdd(book);
    }

    @Override
    public Book getBookByid(Integer id) {

        return bookMapper.getBookByid(id);
    }

    @Override
    public boolean updateBook(Book book) throws Exception {
        return bookMapper.updateBook(book);
    }

    @Override
    public boolean deleteByid(Book book) throws Exception {
        return bookMapper.deleteByid(book);
    }

    @Override
    public boolean Register(Book book) throws Exception {
        return bookMapper.Register(book);
    }

    @Override
    public boolean borrow(Borrow borrow) throws Exception {
        return bookMapper.borrow(borrow);
    }

    @Override
    public boolean lendUpdate(Integer id) throws Exception {
        return bookMapper.lendUpdate(id);
    }

}
