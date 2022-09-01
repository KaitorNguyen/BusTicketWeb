/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.service.impl;

import com.dtk.pojo.Trip;
import com.dtk.repository.TripRepository;
import com.dtk.service.TripService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author XGEAR
 */
@Service
public class TripServiceImpl implements TripService{

    @Autowired
    private TripRepository tripRepository;
    @Override
    public List<Trip> geTrips(Map<String, String> params, int page) {
        return this.tripRepository.getTrips(params, page);
    }
    
}
