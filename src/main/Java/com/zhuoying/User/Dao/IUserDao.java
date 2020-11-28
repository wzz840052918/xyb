package com.zhuoying.User.Dao;

import com.zhuoying.User.Bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUserDao {

    public List<User> findAll();

    User findByUsername(String username);

    int addOne(User user);

    int editPassword(Integer uid, String password1);

    User findByUid(Integer uid);

    int UpdateUser(User user);

    int deleteUserInformation(Integer uid);
}
