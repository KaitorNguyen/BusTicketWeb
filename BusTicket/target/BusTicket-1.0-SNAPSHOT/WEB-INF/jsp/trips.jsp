<%-- 
    Document   : trips
    Created on : Sep 3, 2022, 10:12:16 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">

    <h1 class="text-center text-info" style="margin-top: 15px">QUẢN LÝ CHUYẾN XE</h1>

    <button class="cssbuttons-io-button" type="button" onclick="location.href = '<c:url value="/admin/trips/add_trip"/>'">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"></path><path fill="currentColor" d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"></path></svg>
        <span> Add </span>
    </button>

    <div class="spinner-border text-info" id="myLoading" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>

    <table class="table table-hover caption-top">
        <caption>Danh sách chuyến xe</caption>
        <thead>
            <tr>
                <th>STT</th>
                <th>Image</th>
                <th>Tên</th>
                <th>Điểm xuất phát</th>
                <th>Điểm đến</th>
                <th>Thời gian đi</th>
                <th>Giá vé</th>
                <th>Tài xế</th>
                <th>Biển số xe</th>
                <th></th>
            </tr>
        </thead>
        <tbody id="adminTrip">

        </tbody>
    </table>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/trip.js" />"></script>
<script>
    <c:url value="/api/trips" var="endpoint"/>

        window.onload = function () {
            loadAdminTrips('${endpoint}');
        }
</script>
