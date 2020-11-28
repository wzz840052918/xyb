package com.zhuoying.User.Service;

import com.zhuoying.User.Bean.User;

import java.util.List;

public interface IUserService {
    //login
    public User login(String username, String password);

    //regist
    public Integer regist(User user);

    Integer editPassword(Integer uid, String password1);

    //获取所有用户信息
    List<User> getAllUserInformation();

    int updateUser(User user);

    User findByUid(Integer uid);

    int deleteUserInformation(Integer id);
}
