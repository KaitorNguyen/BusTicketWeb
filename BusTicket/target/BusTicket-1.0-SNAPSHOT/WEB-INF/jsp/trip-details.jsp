<%-- 
    Document   : trip-details
    Created on : Sep 4, 2022, 3:58:57 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<h1 class="text-center text-info"> CHI TIET CHUYEN DI</h1>

<div class="row">
    <div class="col-md-5 " >
        <img src="${trip.image}"/>
    </div>
    <div class="col-md-7">
        <h1>${trip.name}</h1>
    </div>
</div>

    <ul id="feedbacks">
        
    </ul>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/trip.js" />"></script>
<script>
    <c:url value="/api/feedbacks" var="url"/>
    window.onload = function(){
        loadFeedbacks('${url}')
    }
</script>
