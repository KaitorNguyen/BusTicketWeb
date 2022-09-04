<%-- 
    Document   : coaches
    Created on : Sep 4, 2022, 7:40:53 AM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center" style="margin-top: 15px">QUAN LY XE</h1>
<div class="d-flex align-items-center" >
    <strong id="mySpinner" >Loading...</strong>
    <div class="spinner-border ms-5" id="mySpinner2"></div>
</div>


<c:url value="/admin/coaches" var="action" />
<form:form method="post" action="${action}" modelAttribute="coach">
    <form:errors path="*" element="div" cssClass="alert alert-danger"/>
    <div class="row g-3">
        <div class="form-floating col-md-4 mb-3">
            <form:input type="text" class="form-control" id="name" path="name" placeholder="Ten xe"/>
            <label for="floatingInput">Ten xe</label>
        </div>
        <div class="form-floating col-md-4 mb-3">
            <form:input type="number" class="form-control" id="totalseat" path="totalseat" placeholder="Tong so ghe"/>
            <label for="floatingTotalSeat">Tong so ghe</label>
        </div>
        <div class="form-floating col-md-4 mb-3">
            <form:input type="text" class="form-control" id="licensePlates" path="licensePlates" placeholder="Bien so xe"/>
            <label for="floatingLicensePlates">Bien so xe</label>
        </div>
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>  
</form:form> 

<table class="table table-hover caption-top">
    <caption>Danh sach xe</caption>
    <thead>
        <tr>
            <th>STT</th>
            <th>Ten xe</th>
            <th>So ghe</th>
            <th>Bien so xe</th>
            <th></th>
        </tr>
    </thead>
    <tbody id="myCoaches">

    </tbody>
</table>

<script src="<c:url value="/js/coach.js" />"></script>
<script>
    <c:url value="/api/coaches" var="c"/>
    window.onload = function () {
        getCoaches('${c}');
    }
</script>