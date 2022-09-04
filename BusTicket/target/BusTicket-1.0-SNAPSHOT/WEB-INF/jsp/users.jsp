<%-- 
    Document   : users
    Created on : Sep 3, 2022, 4:14:41 AM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center" style="margin-top: 15px">QUAN LY NHAN VIEN</h1>
<div class="d-flex align-items-center" >
    <strong id="mySpinner" >Loading...</strong>
    <div class="spinner-border ms-5" id="mySpinner2"></div>
</div>

<c:url value="/admin/users" var="action" />
<form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user">
    <div class="row g-3">
        <div class="col-md-6 mb-3">
            <label for="fullname" class="form-label fs-5">Full Name</label>
            <form:input type="text" class="form-control" id="fullname" path="fullname" placeholder="Full Name"/>
        </div>
        <div class="col-md-2 mb-3">
            <label for="gender" class="form-label fs-5">Gender</label>
            <div>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" id="genderM" path="gender" value="Nam"/>
                    <label class="form-check-label fs-5" for="inlineRadio1">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" id="genderF" path="gender" value="Nu"/>
                    <label class="form-check-label fs-5" for="inlineRadio2">Female</label>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <label for="gender" class="form-label fs-5">Role</label>
            <form:select class="form-select" aria-label=".form-select-lg example" id="userRole" path="userRole">
                <option selected value="ROLE_CUSTOMER">Choose...</option>
                <option value="ROLE_EMPLOYEE">Employee</option>
                <option value="ROLE_DRIVER">Driver</option>
                <option value="ROLE_ADMIN">Admin</option>
            </form:select>
        </div>
        <div class="col-md-6 mb-3">
            <label for="birthday" class="form-label fs-5">Birthday</label>
            <form:input type="date" class="form-control" id="birthday" path="birthday" placeholder="Birthday"/>
        </div>
        <div class="col-md-6 mb-3">
            <label class="form-label fs-5">Address</label>
            <form:input type="text" class="form-control" id="address" path="address" placeholder="Address"/>

        </div>
        <div class="col-md-6 mb-3">
            <label for="phone" class="form-label fs-5">Phone</label>
            <form:input type="text" class="form-control" id="phone" path="phone" placeholder="Phone"/>

        </div>
        <div class="col-md-6 mb-3">
            <label for="email" class="form-label fs-5">Email</label>
            <form:input type="email" class="form-control" id="email" path="email" placeholder="name@example.com"/>

        </div>
        <div class="col-md-6 mb-3">
            <label for="username" class="form-label fs-5">Username</label>
            <form:input type="text" class="form-control" id="username" path="username" placeholder="Username"/>

        </div>    
        <div class="col-md-6 mb-3">
            <label for="password" class="form-label fs-5">Password</label>
            <form:input type="password" class="form-control" id="password" path="password" placeholder="Password"/>

        </div>
        <div class="col-md-6 mb-3">
            <label for="password" class="form-label fs-5">Confirm Password</label>
            <form:input type="password" class="form-control" id="confirmPassword" path="confirmPassword" placeholder="Confirm Password"/>

        </div>
        <div class="col-md-6 mb-3">
            <label for="avatar" class="form-label fs-5">Avatar</label>
            <form:input type="file" class="form-control" id="avatar" path="file"/>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>   
    </div>
</form:form> 

<table class="table table-hover caption-top">
    <caption>Danh sach nhan vien</caption>
    <c:url value="/" var="action" />
    <form method="get" action="${action}" class="d-flex">
        <input class="form-control me-2" type="text" name="kw" placeholder="Nhap tu khoa de tim...">
        <button type="submit" class="btn btn-primary" type="button">Tim</button>
    </form>
    <thead>
        <tr>
            <th>STT</th>
            <th>Full Name</th>
            <th>Birthday</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Role</th>
            <th></th>
        </tr>
    </thead>
    <tbody id="myUser">

    </tbody>
</table>

<script src="<c:url value="/js/user.js" />"></script>
<script>
    <c:url value="/api/users" var="u"/>
    window.onload = function () {
        getUsers('${u}');
    }
</script>