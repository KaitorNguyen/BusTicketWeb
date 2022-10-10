/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.repository.impl;

import com.dtk.pojo.TicketDetail;
import com.dtk.repository.TicketRepository;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author GIGABYTE
 */
@Repository
@Transactional
public class TicketRepositoryImpl implements TicketRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<TicketDetail> getTickets(Map<String, String> params) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<TicketDetail> q = b.createQuery(TicketDetail.class);
        Root root = q.from(TicketDetail.class);
        q.select(root);

        Query query = session.createQuery(q);
        return query.getResultList();
    }

}
