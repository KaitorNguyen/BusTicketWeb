/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.controllers;

import com.dtk.pojo.Feedback;
import com.dtk.service.TripService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
@RequestMapping("/api")
public class ApiFeedbackController {

    @Autowired
    private TripService tripService;
    @GetMapping("/feedbacks")
    public ResponseEntity<List<Feedback>> getFeedbacks(){
        return new ResponseEntity<>(this.tripService.getFeedbacks(),HttpStatus.OK);
    }
    
    
}
