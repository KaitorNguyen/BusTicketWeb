/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.service;

import com.dtk.pojo.Trip;
import java.util.List;
import java.util.Map;

/**
 *
 * @author GIGABYTE
 */
public interface TripService {
    List<Trip> geTrips(Map<String, String> params, int page);
    int countTrip();
}
