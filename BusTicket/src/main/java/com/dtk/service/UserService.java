/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtk.service;

import com.dtk.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author GIGABYTE
 */
public interface UserService extends UserDetailsService {

    boolean addUser(User user);

    User getUserByUsername(String username);
//    List<User> getUsers(String username);
}
