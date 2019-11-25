package service;

import mapper.UserMapper;
import pojo.User;

import java.util.List;

public interface UserDao {

    public User Login(User user);

    public List<User> getUserList();
    public User getUserByid(int id);
    public int updatehead(User user);

    public int checkUserName(String name);

    public List<User> searchByWhere(User user);


    public List<User> search(User user);

    public int modifyPs(User user);
}
