package com.dtk.pojo;

import com.dtk.pojo.Coach;
import com.dtk.pojo.Feedback;
import com.dtk.pojo.Route;
import com.dtk.pojo.Ticket;
import com.dtk.pojo.TicketDetail;
import com.dtk.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-10-10T08:41:49")
@StaticMetamodel(Trip.class)
public class Trip_ { 

    public static volatile SingularAttribute<Trip, String> image;
    public static volatile SingularAttribute<Trip, Route> idRoute;
    public static volatile SetAttribute<Trip, Feedback> feedbackSet;
    public static volatile SingularAttribute<Trip, Coach> idCoach;
    public static volatile SetAttribute<Trip, TicketDetail> ticketDetailSet;
    public static volatile SingularAttribute<Trip, User> idDriver;
    public static volatile SetAttribute<Trip, Ticket> ticketSet;
    public static volatile SingularAttribute<Trip, Long> price;
    public static volatile SingularAttribute<Trip, String> name;
    public static volatile SingularAttribute<Trip, Date> startTime;
    public static volatile SingularAttribute<Trip, Integer> id;
    public static volatile SingularAttribute<Trip, Date> endTime;
    public static volatile SingularAttribute<Trip, String> statusTrip;

}