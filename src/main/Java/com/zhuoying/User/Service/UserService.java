package com.zhuoying.User.Service;

import com.zhuoying.User.Bean.User;
import com.zhuoying.User.Dao.IUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService implements IUserService {
    @Autowired
    private IUserDao userDao;

    @Override
    public User login(String username, String password) {
        User user = userDao.findByUsername(username);
        return user;
    }

    @Override
    public Integer regist(User form) {
        //先根据 username 进行查询，如果有则返回0 表示已存在该用户
        User user = userDao.findByUsername(form.getUsername());
        if (user != null) {
            return 0;
        } else {
            int index = userDao.addOne(form);
            if (index >= 1) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    @Override
    public Integer editPassword(Integer uid, String password1) {
        int index = userDao.editPassword(uid, password1);
        return index;
    }

    @Override
    public List<User> getAllUserInformation() {
        try {
            List<User> userList = userDao.findAll();
            return userList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int updateUser(User user) {
        return userDao.UpdateUser(user);
    }

    @Override
    public User findByUid(Integer uid) {
        return userDao.findByUid(uid);
    }

    @Override
    public int deleteUserInformation(Integer uid) {
        return userDao.deleteUserInformation(uid);
    }

}
