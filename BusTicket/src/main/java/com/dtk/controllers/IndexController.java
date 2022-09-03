/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.controllers;

import com.dtk.service.CoachService;
import com.dtk.service.RouteService;
import com.dtk.service.TripService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author XGEAR
 */
@Controller
@ControllerAdvice
public class IndexController {

    @Autowired
    private TripService tripService;
    @Autowired
    private RouteService routeService;
    @Autowired 
    private CoachService coachService;
    
    @ModelAttribute
    public void commonAttr(Model model){
        model.addAttribute("routes", this.routeService.getRoutes());
        model.addAttribute("coaches", this.coachService.getCoachs());
    }
    
    @RequestMapping("/")
    public String index(Model model, 
            @RequestParam Map<String, String> params) {
        model.addAttribute("trips", this.tripService.getTrips(params, 0));
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("tripCounter", this.tripService.countTrip());
        return "index";
    }
}
