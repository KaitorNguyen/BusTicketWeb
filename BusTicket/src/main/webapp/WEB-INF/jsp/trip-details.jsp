<%-- 
    Document   : trip-details
    Created on : Sep 4, 2022, 3:58:57 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<h1 class="text-center text-info"> CHI TIET CHUYEN DI</h1>

<div class="row container">
    <div class="col-md-4 " >
        <img src="${trip.image}" class="rounded" style="width: 70%"/>
    </div>
    <div class="col-md-4">
        <h5>Ten chuyen xe: ${trip.name}</h5>
        <h5>Diem di: ${trip.idRoute.start}</h5>
        <h5>Diem den: ${trip.idRoute.end}</h5>
        <h5>Thoi gian di: ${trip.startTime}</h5>
        <h5>Gia ve: ${trip.price}</h5>
        <h5>Tai xe: ${trip.idDriver.fullname}</h5>
        <h5>Bien so xe: ${trip.idCoach.licensePlates}</h5>
    </div>
</div>
        
<c:url value="/api/feedbacks" var="url"/>
<div class="form-group" style="margin: 15px 0px 15px 0px">
    <textarea class="form-control"  id="commentId" placeholder="Noi dung feedback"></textarea>       
</div>
<input type="button" onclick="addFeedback('${url}', ${trip.id})" value="Binh luan" class="btn btn-danger" style="margin-bottom: 15px"/>
<ul id="feedbacks" style="list-style-type: none">

</ul>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/trip.js" />"></script>
<script>
    <c:url value="/api/feedbacks" var="url"/>
    window.onload = function () {
        loadFeedbacks('${url}')
    }
</script>
