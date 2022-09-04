package com.dtk.pojo;

import com.dtk.pojo.Coach;
import com.dtk.pojo.TicketDetail;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-09-04T08:45:47")
@StaticMetamodel(Seat.class)
public class Seat_ { 

    public static volatile SingularAttribute<Seat, String> name;
    public static volatile SingularAttribute<Seat, Coach> idCoach;
    public static volatile SingularAttribute<Seat, TicketDetail> ticketDetail;
    public static volatile SingularAttribute<Seat, Integer> id;
    public static volatile SingularAttribute<Seat, String> status;

}