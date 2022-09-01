<%-- 
    Document   : index
    Created on : Aug 28, 2022, 6:32:33 PM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <div class="row" style="margin-top: 10px">
        <c:forEach items="${trips}" var="t">
            <c:url value="/" var="cURL">
                <c:param name="tripId" value="${t.id}"/>
            </c:url>
            <div class="card col-md-3" style="padding: 3px; margin-right: 10px;" >
                <img class="card-img-top" class="img-fluid" src="<c:url value="${t.image}"/>" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">${t.name}</h4>
                    <p class="card-text"> Khởi hành vào lúc ${t.time}</p>
                    <a href="${cURL}" class="btn btn-primary">Đặt Vé Ngay</a>
                </div>
            </div>                                 
        </c:forEach>
    </div>
</div>  

