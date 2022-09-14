/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtk.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author GIGABYTE
 */
@Entity
@Table(name = "ticket_detail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TicketDetail.findAll", query = "SELECT t FROM TicketDetail t"),
    @NamedQuery(name = "TicketDetail.findById", query = "SELECT t FROM TicketDetail t WHERE t.id = :id"),
    @NamedQuery(name = "TicketDetail.findByPriceSeat", query = "SELECT t FROM TicketDetail t WHERE t.priceSeat = :priceSeat")})
public class TicketDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "price_seat")
    private Long priceSeat;
    @JoinColumn(name = "id_seat", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Seat idSeat;
    @JoinColumn(name = "id_ticket", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Ticket idTicket;

    public TicketDetail() {
    }

    public TicketDetail(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getPriceSeat() {
        return priceSeat;
    }

    public void setPriceSeat(Long priceSeat) {
        this.priceSeat = priceSeat;
    }

    public Seat getIdSeat() {
        return idSeat;
    }

    public void setIdSeat(Seat idSeat) {
        this.idSeat = idSeat;
    }

    public Ticket getIdTicket() {
        return idTicket;
    }

    public void setIdTicket(Ticket idTicket) {
        this.idTicket = idTicket;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TicketDetail)) {
            return false;
        }
        TicketDetail other = (TicketDetail) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dtk.pojo.TicketDetail[ id=" + id + " ]";
    }
    
}
