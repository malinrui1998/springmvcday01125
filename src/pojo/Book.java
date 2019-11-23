package pojo;

import java.util.Date;

public class Book {
    private Integer bookid;
    private String productName;
    private String productUnit;
    private String proId;
    private String payed;

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductUnit() {
        return productUnit;
    }

    public void setProductUnit(String productUnit) {
        this.productUnit = productUnit;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public String getPayed() {
        return payed;
    }

    public void setPayed(String payed) {
        this.payed = payed;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookid=" + bookid +
                ", productName='" + productName + '\'' +
                ", productUnit='" + productUnit + '\'' +
                ", proId='" + proId + '\'' +
                ", payed='" + payed + '\'' +
                '}';
    }
}
