/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtk.repository;

import com.dtk.pojo.Trip;
import java.util.List;
import java.util.Map;

/**
 *
 * @author XGEAR
 */
public interface TripRepository {
    List<Trip> getTrips(Map<String, String> params, int page);
    Trip getTripById(int id);
    int countTrip();
}
