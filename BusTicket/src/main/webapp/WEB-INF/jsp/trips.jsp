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
        <label for="sel1" class="form-label">Tuyen xe:</label>
    </div>
    <div class="form-floating mt-3 mb-3">
        <form:select path="idDriver" class="form-select" id="driver" name="driverlist">
            <c:forEach items="${userDriver}" var="d">
                <option value="${d.id}">${d.fullname}</option>
            </c:forEach>
        </form:select>
        <label for="driver" class="form-label">Tai xe:</label>
    </div>
    <div class="form-floating mt-3 mb-3">
        <form:select path="idCoach" class="form-select" id="coach" name="coachlist">
            <c:forEach items="${coaches}" var="c">
                <option value="${c.id}">${c.name} - ${c.totalseat} cho - ${c.licensePlates}</option>
            </c:forEach>
        </form:select>
        <label for="coach" class="form-label">Xe:</label>
    </div>

    <input type="submit"  value="Them Chuyen Di" class="btn btn-danger"/>
</form:form>



<div class="spinner-border text-info" id="myLoading" role="status">
    <span class="visually-hidden">Loading...</span>
</div>

<table class="table table-hover caption-top">
    <caption>Danh sach chuyen xe</caption>
    <thead>
        <tr>
            <th>STT</th>
            <th>Image</th>
            <th>Ten</th>
            <th>Diem xuat phat</th>
            <th>Diem den</th>
            <th>Thoi gian di</th>
            <th>Gia ve</th>
            <th>Tai xe</th>
            <th>Bien so xe</th>
            <th></th>
        </tr>
    </thead>
    <tbody id="adminTrip">

    </tbody>
</table>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/trip.js" />"></script>
<script>
    <c:url value="/api/trips" var="endpoint"/>

    window.onload = function () {
        loadAdminTrips('${endpoint}');
    }
</script>
