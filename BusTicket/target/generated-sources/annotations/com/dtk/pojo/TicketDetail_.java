package com.dtk.pojo;

import com.dtk.pojo.Seat;
import com.dtk.pojo.Ticket;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-09-04T16:43:28")
@StaticMetamodel(TicketDetail.class)
public class TicketDetail_ { 

    public static volatile SingularAttribute<TicketDetail, Ticket> idTicket;
    public static volatile SingularAttribute<TicketDetail, Seat> idSeat;
    public static volatile SingularAttribute<TicketDetail, Integer> id;

}