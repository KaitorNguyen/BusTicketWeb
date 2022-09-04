/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.controllers;

import com.dtk.pojo.Feedback;
import com.dtk.service.TripService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    public ResponseEntity<List<Feedback>> getFeedbacks() {
        return new ResponseEntity<>(this.tripService.getFeedbacks(), HttpStatus.OK);
    }

    @PostMapping(path = "/feedbacks", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Feedback> addFeedback(@RequestBody Map<String, String> params) {
        String comment = params.get("comment");
        int tripId = Integer.parseInt(params.get("tripId"));   
        Feedback f = this.tripService.addFeedback(comment, tripId);

        return new ResponseEntity<>(f, HttpStatus.CREATED);
    }

}
