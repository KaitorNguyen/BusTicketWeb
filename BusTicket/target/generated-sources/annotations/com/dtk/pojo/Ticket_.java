package com.dtk.pojo;

import com.dtk.pojo.TicketDetail;
import com.dtk.pojo.Trip;
import com.dtk.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-14T01:39:34")
@StaticMetamodel(Ticket.class)
public class Ticket_ { 

    public static volatile SingularAttribute<Ticket, User> idEmployee;
    public static volatile SingularAttribute<Ticket, Date> bookDate;
    public static volatile SingularAttribute<Ticket, Trip> idTrip;
    public static volatile SingularAttribute<Ticket, Long> totalMoney;
    public static volatile SingularAttribute<Ticket, String> name;
    public static volatile SingularAttribute<Ticket, String> paymentMethod;
    public static volatile SingularAttribute<Ticket, String> statusTicket;
    public static volatile SingularAttribute<Ticket, Integer> id;
    public static volatile SingularAttribute<Ticket, Date> paymentDate;
    public static volatile SingularAttribute<Ticket, String> paymentContent;
    public static volatile SetAttribute<Ticket, TicketDetail> ticketDetailSet;
    public static volatile SingularAttribute<Ticket, User> idCustomer;

}