/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function loadMyModalEditUser(endpoint, id) {
    fetch(endpoint, {
    method: 'get'
    }).then(function (res) {
    return res.json();
    }).then(function (data) {
        let fullname = document.getElementById('fullname');
        let gender = document.getElementById('gender');
        let userRole = document.getElementById('userRole');
        let birthday = document.getElementById('birthday');
        let address = document.getElementById('address');
        let phone = document.getElementById('phone');
        let email = document.getElementById('email');
        let username = document.getElementById('username');
        let avatar = document.getElementById('avatar');
        let editU = document.getElementById('editU');
        
        fullname.value = data[0]["fullname"];
        gender.value = data[0]["gender"];
        userRole.value = data[0]["userRole"];
        birthday.value = moment(data[0]["birthday"]).format("YYYY-MM-DD");
        address.value = data[0]["address"];
        phone.value = data[0]["phone"];
        email.value = data[0]["email"];
        username.value = data[0]["username"];
        avatar.value = data[0]["avatar"];
//        editU.setAttribute('onclick', `editUser(${id})`);
    });
}

function deleteUser(endpoint, id) {
    fetch(endpoint, {
        method: 'delete'
    }).then(function (res) {
        if (res.status === 204)
            location.reload();
    }).catch(function (err) {
        console.error(err);
    })
}

function getUsers(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("myUser");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                if (data[i].active === true) {
                    h += `
                            <tr>
                                <td>${i + 1}</td>
                                <td> 
                                    <img src="${data[i].avatar}" alt="${data[i].username}" class="rounded-circle" width='40'/> 
                                </td>
                                <td>${data[i].username}</td>
                                <td>${data[i].fullname}</td>
                                <td>${moment(data[i].birthday).format("DD-MM-YYYY")}</td>
                                <td>${data[i].phone}</td>
                                <td>${data[i].email}</td>
                                <td>${data[i].userRole}</td>
                                <td>
                                    <button class="btn btn-primary" onclick="loadMyModalEditUser('${endpoint + "/getUser/" + data[i].id}', ${data[i].id})" data-bs-toggle="modal" data-bs-target="#myModalEditUser">
                                        Edit
                                    </button>
                                    <button class="btn btn-danger" onclick="deleteUser('${endpoint + "/deleteUser/" + data[i].id}', ${data[i].id})">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        `
                }

            d.innerHTML = h;
        }

        let d2 = document.getElementById("mySpinner");
        d2.style.display = "none";
        let d3 = document.getElementById("mySpinner2");
        d3.style.display = "none";
    }).catch(function (err) {
        console.error(err);
    })
}