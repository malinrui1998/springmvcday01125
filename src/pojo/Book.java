package pojo;

import java.util.Date;

public class Book {
    private Integer id;
    private String name;
    private String author;
    private Date publishDate;

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", publishDate=" + publishDate +
                ", borrowBookUser=" + borrowBookUser +
                '}';
    }

    private BorrowBookUser borrowBookUser;

    public BorrowBookUser getBorrowBookUser() {
        return borrowBookUser;
    }

    public void setBorrowBookUser(BorrowBookUser borrowBookUser) {
        this.borrowBookUser = borrowBookUser;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }
}
