/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.controllers;

import com.dtk.pojo.Coach;
import com.dtk.service.CoachService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author GIGABYTE
 */
@RestController
@RequestMapping("/api")
public class ApiCoachController {

    @Autowired
    private CoachService coachService;

    @GetMapping("/coaches")
    public ResponseEntity<List<Coach>> getCoaches() {
        return new ResponseEntity<>(this.coachService.getCoachs(null), HttpStatus.OK);
    }

    @DeleteMapping("/coaches/{coachId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteCoach(@PathVariable(value = "coachId") int id) {
        this.coachService.deleteCoach(id);
    }
}
