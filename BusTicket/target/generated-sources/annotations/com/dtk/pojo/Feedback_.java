package com.dtk.pojo;

import com.dtk.pojo.Trip;
import com.dtk.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2022-11-03T13:19:35")
@StaticMetamodel(Feedback.class)
public class Feedback_ { 

    public static volatile SingularAttribute<Feedback, Date> createdDate;
    public static volatile SingularAttribute<Feedback, Integer> rate;
    public static volatile SingularAttribute<Feedback, Trip> idTrip;
    public static volatile SingularAttribute<Feedback, String> comment;
    public static volatile SingularAttribute<Feedback, Integer> id;
    public static volatile SingularAttribute<Feedback, User> idCustomer;

}