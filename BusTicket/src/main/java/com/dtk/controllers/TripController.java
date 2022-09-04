/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.controllers;

import com.dtk.pojo.Route;
import com.dtk.pojo.Trip;
import com.dtk.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/admin")
public class TripController {

    @Autowired
    private TripService tripService;

    @GetMapping("/trips")
    public String list(Model model) {
        model.addAttribute("trip", new Trip());
        return "trips";
    }

    @PostMapping("/trips")
    public String addTrip(@ModelAttribute(value = "trip") Trip trip) {
        if (this.tripService.addTrip(trip) == true) {
            return "redirect:/admin/trips";
        }
        return "trips";
    }
}

