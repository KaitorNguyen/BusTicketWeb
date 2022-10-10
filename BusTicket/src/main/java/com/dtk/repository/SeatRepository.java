/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtk.repository;

import com.dtk.pojo.Seat;
import java.util.List;
import java.util.Map;

/**
 *
 * @author GIGABYTE
 */
public interface SeatRepository {
    List<Seat> getSeats(Map<String, String> params);
    boolean addSeat(int idCoach, int totalSeat);
}
