package pojo;

public class Borrow{
    private Integer id;
    private Integer user_id;
    private Integer bookid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    @Override
    public String toString() {
        return "Borrow{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", bookid=" + bookid +
                '}';
    }
}
