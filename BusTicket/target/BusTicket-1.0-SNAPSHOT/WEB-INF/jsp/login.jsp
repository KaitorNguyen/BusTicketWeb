<%-- 
    Document   : login
    Created on : Aug 28, 2022, 7:33:46 PM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-info">DANG NHAP</h1>

<c:if test="${param.error != null}">
    <div class="alert alert-danger">
        Da co loi xay ra! Vui long dang nhap lai!
    </div>
</c:if>

<c:if test="${param.accessDenied != null}">
    <div class="alert alert-danger">
        Ban khong co quyen truy cap!
    </div>
</c:if>

<c:url value="/login" var="action" />

<div class="card container" style="background-color: lightblue; width: 70%; border-radius: 15px">
    <div class="row" style="margin-bottom: 25px">
        <div class="col">
            <div class="text-center">
                <img style="width: 80%" src="https://res.cloudinary.com/doe6rzwse/image/upload/v1661986046/busApp/logo_bus_bdf1gw.png"/>
            </div>
        </div>
        <div class="col">
            <div class="container">
                <form method="post" action="${action}">
                    <div class="mb-3 mt-3">
                        <label for="username" class="form-label">Username:</label>
                        <input type="text" class="form-control" id="username" placeholder="Enter username" name="username">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password:</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
                    </div>
                    <div class="form-check mb-3">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" name="remember"> Remember me
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form> 
            </div>
        </div>
    </div>
</div>

