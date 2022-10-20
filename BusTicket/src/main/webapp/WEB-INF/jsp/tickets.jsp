<%-- 
    Document   : tickets
    Created on : Oct 20, 2022, 6:14:57 AM
    Author     : GIGABYTE
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div style="margin: 0px auto">
    <h1 class="text-center text-info" style="margin-top: 15px">QUẢN LÝ VÉ XE</h1>
    <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
        <table class="table table-hover caption-top">
            <caption>Danh sách vé nhân viên đã đặt</caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên nhân viên</th>
                    <th>Tên khách hàng</th>
                    <th>Điểm xuất phát</th>
                    <th>Điểm đến</th>
                    <th>Thời gian đi</th>
                    <th>Biển số xe</th>
                    <th>Tổng số tiền</th>
                    <th>Ngày đặt</th>
                    <th>Ngày thanh toán</th>
                    <th>Trạng thái</th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="getMyTicketBookByEmployee">

            </tbody>
        </table>
        <table class="table table-hover caption-top">
            <caption>Danh sách vé khách hàng đã đặt</caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên khách hàng</th>
                    <th>Điểm xuất phát</th>
                    <th>Điểm đến</th>
                    <th>Thời gian đi</th>
                    <th>Biển số xe</th>
                    <th>Tổng số tiền</th>
                    <th>Ngày đặt vé</th>
                    <th>Ngày thanh toán</th>
                    <th>Trạng thái vé</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${tickets}" var="allTicket">
                    <c:if test="${allTicket.idUserLogin.userRole == 'ROLE_CUSTOMER'}">
                        <tr>
                            <td>${allTicket.id}</td>
                            <td>${allTicket.idCustomerNew.fullname}</td>
                            <td>${allTicket.idTrip.idRoute.start}</td>
                            <td>${allTicket.idTrip.idRoute.end}</td>
                            <td><fmt:formatDate value="${allTicket.idTrip.startTime}" pattern="dd-MM-yyyy HH:mm aa"/></td>
                            <td>${allTicket.idTrip.idCoach.licensePlates}</td>
                            <td><fmt:formatNumber type="number" value="${allTicket.totalMoney}" maxFractionDigits="3"/> VNÐ</td>
                            <td><fmt:formatDate value="${allTicket.bookDate}" pattern="dd-MM-yyyy HH:mm aa"/></td>
                            <td><fmt:formatDate value="${allTicket.paymentDate}" pattern="dd-MM-yyyy HH:mm aa"/></td>
                            <td>${allTicket.statusTicket}</td>
                            <td>
                                <button class="btn btn-primary" onclick="getTicketBookDetail(${allTicket.id})" data-bs-toggle="modal" data-bs-target="#myModalXacNhanTicket">
                                    Xác nhận
                                </button>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${allTicket.idUserLogin == null}">
                        <tr>
                            <td>${allTicket.id}</td>
                            <td>${allTicket.idCustomerNew.fullname}</td>
                            <td>${allTicket.idTrip.idRoute.start}</td>
                            <td>${allTicket.idTrip.idRoute.end}</td>
                            <td><fmt:formatDate value="${allTicket.idTrip.startTime}" pattern="dd-MM-yyyy HH:mm aa"/></td>
                            <td>${allTicket.idTrip.idCoach.licensePlates}</td>
                            <td><fmt:formatNumber type="number" value="${allTicket.totalMoney}" maxFractionDigits="3"/> VNÐ</td>
                            <td><fmt:formatDate value="${allTicket.bookDate}" pattern="dd-MM-yyyy HH:mm aa"/></td>
                            <td><fmt:formatDate value="${allTicket.paymentDate}" pattern="dd-MM-yyyy HH:mm aa"/></td>
                            <td>${allTicket.statusTicket}</td>
                            <td>
                                <button class="btn btn-primary" data-bs-toggle="modal" onclick="getTicketBookDetail(${allTicket.id})" data-bs-target="#myModalXacNhanTicket">
                                    Xác nhận
                                </button>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>    
        </table>
        <!-- The Modal -->
        <div class="modal" id="myModalXacNhanTicket">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Xác nhận thông tin vé</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <table class="table table-bordered">
                            <tbody id="getTicketBookDetail">

                            </tbody>
                        </table>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button class="btn btn-primary" id="xacNhanButton">
                            Xác nhận
                        </button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </sec:authorize>

    <sec:authorize access="hasRole('ROLE_CUSTOMER')">
        <table class="table table-hover caption-top">
            <caption>Danh sách vé khách hàng đã đặt</caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã vé đặt</th>
                    <th>User</th>
                    <th>Tên khách hàng</th>
                    <th>Điểm xuất phát</th>
                    <th>Điểm đến</th>
                    <th>Thời gian đi</th>
                    <th>Biển số xe</th>
                    <th>Ghế</th>
                    <th>Giá ghế</th>
                    <th>Ngày đặt vé</th>
                    <th>Phương thức thanh toán</th>
                    <th>Trạng thái vé</th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="getMyTicket">

            </tbody>    
        </table>
    </sec:authorize>


</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/ticket.js" />"></script>
<script>
                                    window.onload = function () {
                                        getTicketUserLogin('${currentUser.id}');
                                        getTicketBookByEmployee('${currentUser.id}');
                                    };
</script>