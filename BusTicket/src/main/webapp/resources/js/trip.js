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
                        <td>${data[i].name} </td>
                        <td> <img src="${data[i].image}" width='120'/></td>
                        <td>${data[i].time}</td>
                        <td><button class='btn btn-danger'> Xóa</button></td>
                    </tr> 
                    `
        }

        let d = document.getElementById("adminTrip");
        d.innerHTML = msg;
        
        let d2 =document.getElementById("myLoading");
        d2.style.display = "none";
    })
}

function loadFeedbacks(endpoint){
    fetch(endpoint).then(function(res){
             return res.json();
    }).then(function(data){
        let h = ``;
        for(let c of data){
            h+=`
            <li>${c.comment} - binh luan boi ${c.user.username} - ${moment(c.createdDate).locale("vi").fromNow()}</li>

`
        }
        
        let fb = document.getElementById("feedbacks");
        fb.innerHTML = h;
    })

}