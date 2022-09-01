<%-- 
    Document   : register
    Created on : Aug 29, 2022, 8:34:56 AM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center">DANG KY</h1>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>

<c:url value="/register" var="action" />

<form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user">
    <div>
        <div class="form-floating mb-3">
            <form:input type="text" class="form-control" id="fullname" path="fullname" placeholder="Full name"/>
            <label for="fullname">Full name</label>
        </div>
        <div class="form-floating mb-3">
            <div class="form-check form-check-inline">
                <form:radiobutton class="form-check-input" id="gender" path="gender" value="Nam"/>
                <label class="form-check-label" for="inlineRadio1">Nam</label>
            </div>
            <div class="form-check form-check-inline">
                <form:radiobutton class="form-check-input" id="gender" path="gender" value="Nu"/>
                <label class="form-check-label" for="inlineRadio2">Nu</label>
            </div>

        </div>
        <div class="form-floating mb-3">
            <form:input type="date" class="form-control" id="birthday" path="birthday" placeholder="Birthday"/>
            <label>Birthday</label>
        </div>
        <div class="form-floating mb-3">
            <form:input type="text" class="form-control" id="address" path="address" placeholder="Address"/>
            <label>Address</label>
        </div>
        <div class="form-floating mb-3">
            <form:input type="text" class="form-control" id="phone" path="phone" placeholder="Phone"/>
            <label for="phone">Phone</label>
        </div>
        <div class="form-floating mb-3">
            <form:input type="email" class="form-control" id="email" path="email" placeholder="name@example.com"/>
            <label for="email">Email</label>
        </div>
        <div class="form-floating mb-3">
            <form:input type="text" class="form-control" id="username" path="username" placeholder="User name"/>
            <label for="username">Username</label>
        </div>    
        <div class="form-floating mb-3">
            <form:input type="password" class="form-control" id="password" path="password" placeholder="Password"/>
            <label for="password">Password</label>
        </div>
        <div class="form-floating mb-3">
            <form:input type="password" class="form-control" id="confirmPassword" path="confirmPassword" placeholder="Confirm Password"/>
            <label for="password">Confirm Password</label>
        </div>
        <div class="mb-3">
            <label for="avatar">Avatar</label>
            <form:input type="file" class="form-control" id="avatar" path="file"/>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>

</form:form> 