/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtk.repository;

import com.dtk.pojo.TicketDetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author GIGABYTE
 */
public interface TicketRepository {
    List<TicketDetail> getTickets(Map<String, String> params);
}
