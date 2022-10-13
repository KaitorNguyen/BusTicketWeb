package com.dtk.pojo;

import com.dtk.pojo.Seat;
import com.dtk.pojo.Ticket;
import com.dtk.pojo.Trip;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-14T01:39:34")
@StaticMetamodel(TicketDetail.class)
public class TicketDetail_ { 

    public static volatile SingularAttribute<TicketDetail, Boolean> statusSeat;
    public static volatile SingularAttribute<TicketDetail, Ticket> idTicket;
    public static volatile SingularAttribute<TicketDetail, Long> priceSeat;
    public static volatile SingularAttribute<TicketDetail, Seat> idSeat;
    public static volatile SingularAttribute<TicketDetail, Trip> idTripSeat;
    public static volatile SingularAttribute<TicketDetail, Integer> idTicketDetail;

}