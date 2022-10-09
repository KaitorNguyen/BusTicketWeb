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
                        <td> 
                            <img src="${data[i].image}" alt="${data[i].name}" width='120'/>
                        </td>
                        <td>${data[i].name} </td>
                        <td>${data[i].idRoute.start}</td>
                        <td>${data[i].idRoute.end}</td>
                        <td>${moment(data[i].startTime).format("DD-MM-YYYY LT")}</td>
                        <td>${data[i].price}</td>
                        <td>${data[i].idDriver.fullname} - ${data[i].idDriver.userRole}</td>
                        <td>${data[i].idCoach.licensePlates}</td>
                        <td>
                            <a href="/BusTicket/admin/trips/remove/${data[i].id}">
                                <button class="btn btn-danger"> 
                                    Delete
                                </button>
                            </a>
                        </td>
                    </tr> 
                    `
        }

        let d = document.getElementById("adminTrip");
        d.innerHTML = msg;

        let d2 = document.getElementById("myLoading");
        d2.style.display = "none";
    })
}

function loadFeedback(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let b = document.getElementById("feedbacks");
        let h = ``;
        for (let d of data) 
            h += `
             <li>
                     <div class="container boxReview-comment-item mb-4 form-control">
            <div>
                <img src="${d.user.avatar}" alt="Logo" class="rounded-circle" style="width:25px; height: 25px;">
            </div>
            <div class="boxReview-comment-item-title is-flex is-justify-content-space-between is-align-items-center">
                <div class="is-flex is-align-items-center">
                    <span class="name fw-bold">${d.user.fullname}</span>
                </div>
                <p class="date-time"><b>${moment(d.createdDate).locale("vi").fromNow()}</b> - ${moment(d.createdDate).locale("vi").format('lll')}</p>
            </div> 
            <div class="boxReview-comment-item-review p-2">
                <div class="item-review-comment my-1 is-flex is-justify-content-space-between is-flex-direction-column">
                    <div class="comment-content">
                        <p>${d.comment}</p>
                    </div>
                    <div class="comment-image is-flex">
                    </div>
                </div>
            </div>
        </div>
                </li>
            `;
        b.innerHTML = h;
      
    });
}

function addFeedback(endpoint, idChuyenDi,xacNhan,thanhCong,thatBai) {
   if(confirm(xacNhan) == true){
       fetch(endpoint,{
           method: "post",
           body: JSON.stringify({
               "comment" : document.getElementById("comment").value,
               "idTrip" : idChuyenDi
           }),
           headers:{
               "Content-Type" : "application/json"
           }
       }).then(function(res){
           return res.json();
       }).then(function(data){
           if(data){
               alert(thanhCong);
               let d = document.getElementById("feedbacks");
               
               let h = `
                     <li>
                   <div class="container boxReview-comment-item mb-4 form-control">
                        <div>
                            <img src="${data.user.avatar}" alt="Logo" class="rounded-circle" style="width:25px; height: 25px;">
                        </div>
                        <div class="boxReview-comment-item-title is-flex is-justify-content-space-between is-align-items-center">
                            <div class="is-flex is-align-items-center">
                                <span class="name fw-bold">${data.user.fullname}</span>
                            </div>
                            <p class="date-time"><b>${moment(data.createdDate).locale("vi").fromNow()}</b> - ${moment(data.createdDate).locale("vi").format('lll')}</p>
                        </div> 
                        <div class="boxReview-comment-item-review p-2">
                            <div class="item-review-comment my-1 is-flex is-justify-content-space-between is-flex-direction-column">
                                <div class="comment-content">
                                    <p>${data.comment}</p>
                                </div>
                                <div class="comment-image is-flex">
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                    `;
           d.insertAdjacentHTML("beforebegin", h)
           }else{
                alert(thatBai);
           }
           location.reload();
       });
   }
       
}