/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.service.impl;

import com.dtk.pojo.TicketDetail;
import com.dtk.repository.TicketRepository;
import com.dtk.service.TicketService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author GIGABYTE
 */
@Service
public class TicketServiceImpl implements TicketService{
    @Autowired
    private TicketRepository ticketRepository;

    @Override
    public List<TicketDetail> getTickets(Map<String, String> params) {
        return this.ticketRepository.getTickets(params);
    }
    
    
}
