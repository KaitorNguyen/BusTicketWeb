/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.controllers;

import com.dtk.pojo.Coach;
import com.dtk.pojo.Route;
import com.dtk.pojo.User;
import com.dtk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author GIGABYTE
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @GetMapping("/users")
    public String list(Model model) {
        model.addAttribute("user", new User());
        return "users";
    }

    @PostMapping("/users")
    public String add(Model model, @ModelAttribute(value = "user") User user) {
        String errMsg = "";
        if (user.getPassword().equals(user.getConfirmPassword())) {
            if (this.userService.addUser(user) == true) {
                return "redirect:/admin/users";
            } else {
                errMsg = "Da co loi xay ra!";
            }
        } else {
            errMsg = "Mat khau khong khop!";
        }
        model.addAttribute("errMsg", errMsg);
        return "users";
    }

    @GetMapping("/coaches")
    public String listCoaches(Model model) {
        model.addAttribute("coaches", new Coach());
        return "coaches";
    }

    @GetMapping("/routes")
    public String listRoutes(Model model) {
        model.addAttribute("routes", new Route());
        return "routes";
    }
}
