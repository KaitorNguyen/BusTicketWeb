<%-- 
    Document   : book-ticket
    Created on : Oct 12, 2022, 5:45:22 AM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <h1 class="text-center text-info" style="margin-top: 15px">ĐẶT VÉ ${tripT.idRoute.start} - ${tripT.idRoute.end}</h1>
    <div>
        <form method="post" action="">
            <div class="row g-3">
                <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                    <h4>Thông Tin Nhân Viên</h4>
                    <div class="form-floating col-md-4 mb-3">
                        <input type="text" class="form-control" id="fullnameE" path="fullname" placeholder="Full name" disabled/>
                        <label for="fullname">Full name</label>
                    </div>
                    <div class="form-floating col-md-4 mb-3">
                        <select class="form-select" aria-label=".form-select-lg example" id="genderE" name="gender" path="gender" disabled>
                            <option selected value="Nam">Nam</option>
                            <option value="Nu">Nu</option>
                        </select>
                        <label for="roll" class="form-label">Gender:</label>
                    </div>
                    <div class="form-floating col-md-4 mb-3">
                        <input type="text" class="form-control" id="addressE" path="address" placeholder="Address" disabled/>
                        <label for="address">Address</label>
                    </div>
                    <div class="form-floating col-md-6 mb-3">
                        <input type="text" class="form-control" id="phoneE" path="phone" placeholder="Phone" disabled/>
                        <label for="phone">Phone</label>
                    </div>
                    <div class="form-floating col-md-6 mb-3">
                        <input type="email" class="form-control" id="emailE" path="email" placeholder="name@example.com" disabled/>
                        <label for="email">Email</label>
                    </div>
                </sec:authorize>
                <h4>Thông Tin Khách Hàng </h4>    
                <div class="form-floating col-md-4 mb-3">
                    <input type="text" class="form-control" id="fullnameCustomer" path="fullname" placeholder="Full name"/>
                    <label for="fullname">Full name</label>
                </div>
                <div class="form-floating col-md-4 mb-3">
                    <select class="form-select" aria-label=".form-select-lg example" id="genderCustomer" name="genderCustomer" path="gender">
                        <option selected value="Nam">Nam</option>
                        <option value="Nu">Nu</option>
                    </select>
                    <label for="roll" class="form-label">Gender:</label>
                </div>
                <div class="form-floating col-md-4 mb-3">
                    <input type="text" class="form-control" id="addressCustomer" path="address" placeholder="Address"/>
                    <label for="address">Address</label>
                </div>
                <div class="form-floating col-md-6 mb-3">
                    <input type="text" class="form-control" id="phoneCustomer" path="phone" placeholder="Phone"/>
                    <label for="phone">Phone</label>
                </div>
                <div class="form-floating col-md-6 mb-3">
                    <input type="email" class="form-control" id="emailCustomer" path="email" placeholder="name@example.com"/>
                    <label for="email">Email</label>
                </div>


                <div class="col-md-8 mb-3">
                    <h4>Chọn lựa ghế ngồi (<fmt:formatNumber type="number" value="${tripT.price}" maxFractionDigits="3"/> VNÐ/ghế)</h4>
                    <div id="loadSeats">

                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <h4>Các ghế đã được đặt trước</h4>
                    <c:forEach items="${ticketDetail}" var="r">
                        <c:choose>
                            <c:when test="${r.statusSeat}">
                                <input type="checkbox" name="seats" checked disabled> ${r.idSeat.name} by ${r.idTicket.idCustomerNew.fullname}
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="form-floating col-md-6 mb-3">
                    <input type="text" class="form-control" id="totalMoney" name="totalMoney" path="totalMoney" placeholder="Tổng tiền" value="${data}"/>
                    <label>Tổng tiền</label>
                </div>
                <div class="form-floating col-md-12 mb-3">
                    <select class="form-select" aria-label=".form-select-lg example" id="paymentMethod" name="paymentMethod" path="paymentMethod">
                        <option selected value="Trực tiếp">Trực tiếp</option>
                        <option value="MoMo" disabled>MoMo - Hiện tại chưa thể thanh toán bằng MoMo</option>
                        <option value="Zalo Pay" disabled>Zalo Pay - Hiện tại chưa thể thanh toán bằng Zalo Pay</option>
                    </select>
                    <label for="roll" class="form-label">Phương thức thanh toán</label>
                </div>
                <sec:authorize access="!isAuthenticated()">
                    <div class="col-auto">
                        <button type="button" class="btn btn-primary" onclick="addTicket(${tripT.id})">Submit</button>
                    </div> 
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="col-auto">
                        <button type="button" class="btn btn-primary" onclick="addTicket(${tripT.id}, ${currentUser.id})">Submit</button>
                    </div> 
                </sec:authorize>
            </div>
        </form>
    </div>
</div>
<script src="<c:url value="/js/ticket.js" />"></script>
<script>
                            window.onload = function () {
                                getSeats('${idCoach.id}');
                                loadUserEmployee('${currentUser.id}');
                                loadUser('${currentUser.id}');
                            };
</script>