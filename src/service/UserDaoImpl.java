package service;

import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import pojo.User;

import java.util.List;

@Service
public class UserDaoImpl implements UserDao {
    @Autowired
    UserMapper userMapper;

    @Override
    public User Login(User user) {
        return userMapper.login(user);
    }

    @Override
    public List<User> getUserList() {
        return userMapper.getUserList();
    }

    @Override
    public User getUserByid(int id) {
        return userMapper.getUserByid(id);
    }

    @Override
    public int updatehead(User user) {
        int result = userMapper.updatehead(user);
        return result;
    }

    @Override
    public int checkUserName(String name) {
        return userMapper.checkUserName(name);
    }

    @Override
    public List<User> searchByWhere(User user) {
        return userMapper.searchByWhere(user);
    }

    @Override
    public List<User> search(User user) {
        return userMapper.search(user);
    }


}
