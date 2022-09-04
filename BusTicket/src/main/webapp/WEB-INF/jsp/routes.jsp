<%-- 
    Document   : routes
    Created on : Sep 4, 2022, 8:26:52 AM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center" style="margin-top: 15px">QUAN LY TUYEN XE</h1>
<div class="d-flex align-items-center" >
    <strong id="mySpinner" >Loading...</strong>
    <div class="spinner-border ms-5" id="mySpinner2"></div>
</div>

<c:url value="/admin/routes" var="action" />
<form:form method="post" action="${action}" modelAttribute="route">
    <form:errors path="*" element="div" cssClass="alert alert-danger"/>
    <div class="row g-3">
        <div class="form-floating col-md-6 mb-3">
            <form:input type="text" class="form-control" id="start" path="start" placeholder="Diem xuat phat"/>
            <label for="floatingInput">Diem xuat phat</label>
        </div>
        <div class="form-floating col-md-6 mb-3">
            <form:input type="text" class="form-control" id="end" path="end" placeholder="Diem ket thuc"/>
            <label for="floatingPassword">Diem den</label>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>  
    </div>
</form:form> 

<table class="table table-hover caption-top">
    <caption>Danh sach tuyen xe</caption>
    <thead>
        <tr>
            <th>STT</th>
            <th>Diem xuat phat</th>
            <th>Diem den</th>
            <th></th>
        </tr>
    </thead>
    <tbody id="myRoutes">

    </tbody>
</table>

<script src="<c:url value="/js/route.js" />"></script>
<script>
    <c:url value="/api/routes" var="r"/>
    window.onload = function () {
        getRoutes('${r}');
    }
</script>