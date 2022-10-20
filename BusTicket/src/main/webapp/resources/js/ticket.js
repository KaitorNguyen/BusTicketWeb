/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var idTicket = 0;
var totalMoney = 0;

function loadUserEmployee(idUser) {
    fetch(`/BusTicket/api/users/getUser/${idUser}`, {
        method: 'get'
    }).then(function (res) {
        return res.json();
    }).then(function (data) {

        let fullname = document.getElementById('fullnameE');
        let gender = document.getElementById('genderE');
        let address = document.getElementById('addressE');
        let phone = document.getElementById('phoneE');
        let email = document.getElementById('emailE');

        fullname.value = data[0]["fullname"];
        gender.value = data[0]["gender"];
        address.value = data[0]["address"];
        phone.value = data[0]["phone"];
        email.value = data[0]["email"];
    });
}

function loadUser(idUser) {
    fetch(`/BusTicket/api/users/getUser/${idUser}`, {
        method: 'get'
    }).then(function (res) {
        return res.json();
    }).then(function (data) {

        let fullname = document.getElementById('fullnameCustomer');
        let gender = document.getElementById('genderCustomer');
        let address = document.getElementById('addressCustomer');
        let phone = document.getElementById('phoneCustomer');
        let email = document.getElementById('emailCustomer');

        fullname.value = data[0]["fullname"];
        gender.value = data[0]["gender"];
        address.value = data[0]["address"];
        phone.value = data[0]["phone"];
        email.value = data[0]["email"];
    });
}

function addTicket(idTrip, idCustomerLogin) {
    let fullname = document.getElementById('fullnameCustomer');
    let gender = document.getElementById('genderCustomer');
    let address = document.getElementById('addressCustomer');
    let phone = document.getElementById('phoneCustomer');
    let email = document.getElementById('emailCustomer');
    let totalMoney = document.getElementById('totalMoney');
    let paymentMethod = document.getElementById('paymentMethod');

    fetch('/BusTicket/api/bookticket', {
        method: 'post',
        body: JSON.stringify({
            "fullname": fullname.value,
            "gender": gender.value,
            "address": address.value,
            "phone": phone.value,
            "email": email.value,
            "idTrip": idTrip,
            "totalMoney": totalMoney.value,
            "paymentMethod": paymentMethod.value,
            "idCustomerLogin": idCustomerLogin
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        idTicket = `${data.id}`;
        addSeatTicketDetail();
        console.info(data);
        location.reload();
    }).catch(function (err) {
        console.error(err);
        alert(err);
    });
}

function getSeats(idCoach) {
    fetch(`/BusTicket/api/seats/${idCoach}`).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("loadSeats");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                        <input type="checkbox" value="${data[i].id}" id="seat${data[i].id}}" name="optionSeat"/> ${data[i].name}
                    `;
            d.innerHTML = h;
        }
    }).catch(function (err) {
        console.error(err);
    });
}

function addSeatTicketDetail() {
    var seatChecked = document.getElementsByName('optionSeat');
    for (var i = 0; i < seatChecked.length; i++) {
        if (seatChecked[i].checked === true) {
            fetch('/BusTicket/api/tickets', {
                method: "post",
                body: JSON.stringify({
                    "idTicket": idTicket,
                    "idSeat": seatChecked[i].value
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(function (res) {
                return res.json();
            }).then(function (data) {
                totalMoney += data.idTicket.idTrip.price;
                console.info(data);
            }).catch(function (err) {
                console.error(err);
                alert(err);
            });
        }
    }
}

function getTotalMoney() {
    
}

function xacNhanTicket(idTicket) {
    fetch(`/BusTicket/api/xacNhanTicket/${idTicket}`, {
        method: 'put'
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        location.reload();
        if (data === true)
            alert("Thành công");
        else
            alert("Thất bại");
    });
}

function getTicketUserLogin(idUser) {
    fetch(`/BusTicket/api/ticketdetail/myTicket/${idUser}`).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("getMyTicket");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                        <tr>
                            <td>${data[i].idTicketDetail}</td>
                            <td>${data[i].idTicket.id}</td>
                            <td>${data[i].idTicket.idUserLogin.fullname}</td>
                            <td>${data[i].idTicket.idCustomerNew.fullname}</td>
                            <td>${data[i].idTicket.idTrip.idRoute.start}</td>
                            <td>${data[i].idTicket.idTrip.idRoute.end}</td>
                            <td>${moment(data[i].idTicket.idTrip.startTime).format("DD-MM-YYYY LT")}</td>
                            <td>${data[i].idTicket.idTrip.idCoach.licensePlates}</td>
                            <td>${data[i].idSeat.name}</td>
                            <td>${data[i].priceSeat}</td>
                            <td>${moment(data[i].idTicket.bookDate).format("DD-MM-YYYY LT")}</td>
                            <td>${data[i].idTicket.paymentMethod}</td>
                            <td>${data[i].idTicket.statusTicket}</td>
                        </tr>
                    `;
            d.innerHTML = h;
        }
    });
}

function getTicketBookByEmployee(idUser) {
    fetch(`/BusTicket/api/ticketdetail/myTicketBook/${idUser}`).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("getMyTicketBookByEmployee");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                        <tr>
                            <td>${data[i].id}</td>
                            <td>${data[i].idUserLogin.fullname}</td>
                            <td>${data[i].idCustomerNew.fullname}</td>
                            <td>${data[i].idTrip.idRoute.start}</td>
                            <td>${data[i].idTrip.idRoute.end}</td>
                            <td>${moment(data[i].idTrip.startTime).format("DD-MM-YYYY LT")}</td>
                            <td>${data[i].idTrip.idCoach.licensePlates}</td>
                            <td>${data[i].totalMoney}</td>
                            <td>${moment(data[i].bookDate).format("DD-MM-YYYY LT")}</td>
                            <td>${moment(data[i].paymentDate).format("DD-MM-YYYY LT")}</td>
                            <td>${data[i].statusTicket}</td>
                            <td>
                                <button class="btn btn-primary" onclick="getTicketBookDetail(${data[i].id})" data-bs-toggle="modal" data-bs-target="#myModalXacNhanTicket">
                                   Xác nhận
                                </button>
                            </td>
                        </tr>
                    `;
            d.innerHTML = h;
        }
    });
}

function getTicketBookDetail(idTicket) {
    fetch(`/BusTicket/api/ticketdetail/getTicketDetail/${idTicket}`).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("getTicketBookDetail");
        let xacNhanButton = document.getElementById("xacNhanButton");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                if (data[i].idUserLogin === null) {
                    h += `
                                <tr>
                                    <th>ID</th>
                                    <td>${data[i].id}</td>
                                </tr>
                                <tr>
                                    <th>Chuyến xe</th>
                                    <td>${data[i].idTrip.idRoute.start} - ${data[i].idTrip.idRoute.end}</td>
                                </tr>                                
                                <tr>
                                    <th>Thời gian đi</th>
                                    <td>${moment(data[i].idTrip.startTime).format("DD-MM-YYYY LT")}</td>
                                </tr>
                                <tr>
                                    <th>Biển số xe</th>
                                    <td>${data[i].idTrip.idCoach.licensePlates}</td>
                                </tr>
                                <tr>
                                    <th>Tên khách hàng</th>
                                    <td>${data[i].idCustomerNew.fullname}</td>
                                </tr>
                                <tr>
                                    <th>Địa chỉ</th>
                                    <td>${data[i].idCustomerNew.address}</td>
                                </tr>
                                <tr>
                                    <th>Số điện thoại</th>
                                    <td>${data[i].idCustomerNew.phone}</td>
                                </tr>
                                <tr>
                                    <th>Email</th>
                                    <td>${data[i].idCustomerNew.email}</td>
                                </tr>
                                <tr>
                                    <th>Số ghế</th>
                                    <td> 
                                        <div id="myTicketSeat">

                                        </div>
                                    </td>
                                </tr>  
                                <tr>
                                    <th>Ngày đặt</th>
                                    <td>${moment(data[i].bookDate).format("DD-MM-YYYY LT")}</td>
                                </tr>
                                <tr>
                                    <th>Tổng số tiền</th>
                                    <td>${data[i].totalMoney}</td>
                                </tr>
                                <tr>
                                    <th>Ngày thanh toán</th>
                                    <td>${moment(data[i].paymentDate).format("DD-MM-YYYY LT")}</td>
                                </tr>
                                <tr>
                                    <th>Phương thức thanh toán</th>
                                    <td>${data[i].paymentMethod}</td>
                                </tr>
                                <tr>
                                    <th>Trạng thái</th>
                                    <td>${data[i].statusTicket}</td>
                                </tr> 
                        `;
                } else {
                    h += `
                                <tr>
                                    <th>ID</th>
                                    <td>${data[i].id}</td>
                                </tr>
                                <tr>
                                    <th>Tên nhân viên</th>
                                    <td>${data[i].idUserLogin.fullname}</td>
                                </tr>
                                <tr>
                                    <th>Chuyến xe</th>
                                    <td>${data[i].idTrip.idRoute.start} - ${data[i].idTrip.idRoute.end}</td>
                                </tr>                                
                                <tr>
                                    <th>Thời gian đi</th>
                                    <td>${moment(data[i].idTrip.startTime).format("DD-MM-YYYY LT")}</td>
                                </tr>
                                <tr>
                                    <th>Biển số xe</th>
                                    <td>${data[i].idTrip.idCoach.licensePlates}</td>
                                </tr>
                                <tr>
                                    <th>Tên khách hàng</th>
                                    <td>${data[i].idCustomerNew.fullname}</td>
                                </tr>
                                <tr>
                                    <th>Địa chỉ</th>
                                    <td>${data[i].idCustomerNew.address}</td>
                                </tr>
                                <tr>
                                    <th>Số điện thoại</th>
                                    <td>${data[i].idCustomerNew.phone}</td>
                                </tr>
                                <tr>
                                    <th>Email</th>
                                    <td>${data[i].idCustomerNew.email}</td>
                                </tr>
                                <tr>
                                    <th>Số ghế</th>
                                    <td> 
                                        <div id="myTicketSeat">

                                        </div>
                                    </td>
                                </tr>  
                                <tr>
                                    <th>Ngày đặt</th>
                                    <td>${moment(data[i].bookDate).format("DD-MM-YYYY LT")}</td>
                                </tr>
                                <tr>
                                    <th>Tổng số tiền</th>
                                    <td>${data[i].totalMoney}</td>
                                </tr>
                                <tr>
                                    <th>Ngày thanh toán</th>
                                    <td>${moment(data[i].paymentDate).format("DD-MM-YYYY LT")}</td>
                                </tr>
                                <tr>
                                    <th>Phương thức thanh toán</th>
                                    <td>${data[i].paymentMethod}</td>
                                </tr>
                                <tr>
                                    <th>Trạng thái</th>
                                    <td>${data[i].statusTicket}</td>
                                </tr>          
                        `;
                }

            d.innerHTML = h;

        }
        xacNhanButton.setAttribute('onclick', `xacNhanTicket(${idTicket})`);
    });
    window.onload(getTicketSeat(idTicket));
}

function getTicketSeat(idTicket) {
    fetch(`/BusTicket/api/ticketdetail/${idTicket}`).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("myTicketSeat");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                    h += `
                            <h6>${data[i].idSeat.name} - ${data[i].priceSeat} VNÐ</h6>
                        `;

            d.innerHTML = h;
        }
    });
}