<%-- 
    Document   : header
    Created on : Aug 31, 2022, 7:30:24 PM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/BusTicket/">Bus Ticket Online</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/BusTicket/">Trang Chu</a>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Quan Ly Chuyen Xe</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Quan Ly Tuyen Xe</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Quan Ly Nhan Vien</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Thong Ke & Bao Cao</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item active">
                        <a class="nav-link text-info" href="<c:url value="/login"/>">
                            <i class="far fa-user"></i> Login
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link text-info" href="<c:url value="/register"/>">Register</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item active">
                        <a class="nav-link text-danger" href="<c:url value="/"/>">
                            <c:if test="${currentUser.avatar != null}">
                                <img style="width: 25px" src="${pageContext.session.getAttribute("currentUser").avatar}" class="rounded" />
                            </c:if>
                            <c:if test="${currentUser.avatar == null}">
                                <i class="far fa-user"></i>
                            </c:if>

                            ${pageContext.session.getAttribute("currentUser").fullname} (<sec:authentication property="principal.username"/>)
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link text-danger" href="<c:url value="/logout"/>">Logout</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>

