/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.service;

import com.dtk.pojo.Coach;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */

public interface CoachService {
     List<Coach> getCoachs();
}
