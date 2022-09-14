/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

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
                                <td>${data[i].fullname}</td>
                                <td>${data[i].birthday}</td>
                                <td>${data[i].phone}</td>
                                <td>${data[i].email}</td>
                                <td>${data[i].userRole}</td>
                                <td>
                                    <button class="btn btn-danger" onclick="deleteUser('${endpoint + "/" + data[i].id}', ${data[i].id})">
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