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
        if (data === true)
            alert('Thành công');
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