/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.repository.impl;

import com.dtk.pojo.Feedback;
import com.dtk.pojo.User;
import com.dtk.repository.FeedbackRepository;
import com.dtk.repository.TripRepository;
import com.dtk.repository.UserRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
@Transactional
public class FeedbackRepositoryImpl implements FeedbackRepository {

    @Autowired
    private TripRepository tripRepository;

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Feedback> getFeedbacks() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("FROM Feedback");

        return q.getResultList();
    }

    @Override
    public Feedback addFeedback(String comment, int tripId) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        Feedback f = new Feedback();
        f.setComment(comment);
        f.setIdTrip(this.tripRepository.getTripById(tripId));
        f.setIdCustomer(session.get(User.class, 6));
        session.save(f); 
        return f;
    }

}
