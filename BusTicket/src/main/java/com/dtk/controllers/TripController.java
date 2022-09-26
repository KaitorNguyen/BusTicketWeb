/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.controllers;

import com.dtk.pojo.Route;
import com.dtk.pojo.Trip;
import com.dtk.service.CoachService;
import com.dtk.service.RouteService;
import com.dtk.service.TripService;
import com.dtk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
    @Autowired
    private RouteService routeService;
    @Autowired
    private CoachService coachService;
    @Autowired
    private UserService userService;

    @GetMapping("/trips")
    public String list(Model model) {
        return "trips";
    }

    @GetMapping("/trips/add_trip")
    public String addTripView(Model model) {
        model.addAttribute("trip", new Trip());
        model.addAttribute("coaches", this.coachService.getCoachs(null));
        model.addAttribute("userDriver", this.userService.getUserByRole("ROLE_DRIVER"));
        return "add-trip";
    }

    @PostMapping("/trips/add_trip")
    public String addTrip(@ModelAttribute(value = "trip") Trip trip) {
        if (this.tripService.addTrip(trip) == true) {
            return "redirect:/admin/trips";
        }
        return "add-trip";
    }

    @RequestMapping("/trips/remove/{tripId}")
    public String removeTrip(Model model, @PathVariable("tripId") Integer tripId) {
        if (tripService.getTripById(tripId) != null) {
            tripService.deleteTrip(tripId);
        }
        return "redirect:/admin/trips";
    }
}
