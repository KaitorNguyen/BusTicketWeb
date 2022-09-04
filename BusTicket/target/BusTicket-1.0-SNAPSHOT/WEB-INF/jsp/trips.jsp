<%-- 
    Document   : trips
    Created on : Sep 3, 2022, 10:12:16 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1 class='text-center text-info'>Quan Ly Chuyen Di</h1>

<form:form method="post" action="" modelAttribute="trip">
    <div class="form-floating mb-3 mt-3">
        <form:input class="form-control" path="name" id="name"/>
        <label for="name">Tên chuyến đi</label>
    </div>

    <div class="form-floating mt-3 mb-3">
        <form:input class="form-control" path="price" id="price"/>
        <label for="price">Giá</label>
    </div>
    <div class="form-floating mt-3 mb-3">
        <form:select path="idRoute" class="form-select" id="sel1" name="sellist">
            <c:forEach items="${routes}" var="r">
                <option value="${r.id}">${r.start} - ${r.end}</option>
            </c:forEach>
        </form:select>
        <label for="sel1" class="form-label">Select list (select one):</label>
     </div     
        <input type="submit"  value="Them Chuyen Di" class="btn btn-danger"/>
</form:form>



        <div class="spinner-border text-info" id="myLoading" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>

        <table class="table">
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tbody id="adminTrip">

            </tbody>

        </table>
        <script src="<c:url value="/js/trip.js" />"></script>
        <script>
            <c:url value="/api/trips" var="endpoint"/>

    window.onload = function () {
        loadAdminTrips('${endpoint}');
    }
        </script>
