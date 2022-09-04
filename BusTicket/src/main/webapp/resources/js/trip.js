/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function loadAdminTrips(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        console.info(data);
        let msg = "";
        for (let i = 0; i < data.length; i++) {
            msg += `
                    <tr>
                        <td>${i + 1}</td>
                        <td> <img src="${data[i].image}" width='120'/></td>
                        <td>${data[i].name} </td>
                        <td>${data[i].idRoute.start}</td>
                        <td>${data[i].idRoute.end}</td>
                        <td>${moment(data[i].time).format("DD-MM-YYYY LT")}</td>
                        <td>${data[i].price}</td>
                        <td>${data[i].idDriver.fullname} - ${data[i].idDriver.userRole}</td>
                        <td>${data[i].idCoach.licensePlates}</td>
                        <td><button class='btn btn-danger'> Xóa</button></td>
                    </tr> 
                    `
        }

        let d = document.getElementById("adminTrip");
        d.innerHTML = msg;

        let d2 = document.getElementById("myLoading");
        d2.style.display = "none";
    })
}

function loadFeedbacks(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let h = ``;
        for (let c of data) {
            h += `
                <li>
                    <img style="width: 50px; margin: 5px 0px 5px 0px" src="${c.user.avatar}" class="rounded" /> 
                    ${c.comment} - binh luan boi ${c.user.username} - ${moment(c.createdDate).locale("vi").fromNow()}
                </li>
            `
        }

        let fb = document.getElementById("feedbacks");
        fb.innerHTML = h;
    })

}

function addFeedback(endpoint, id) {
    fetch(endpoint, {
        method: 'post',
        body: JSON.stringify({
            "comment": document.getElementById("commentId").value,
            "tripId": id,

        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        console.info(data);
    })
}