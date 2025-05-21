<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <c:url var="assets" scope="page" value="/assets"></c:url> --%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Zurion Technologies Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${assets }/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="${assets}/jquery-3.6.1.min.js"></script>
    </head>
    <body class="sb-nav-fixed">
        
        <jsp:include page="__navbar.jsp"></jsp:include>
        
        <div id="layoutSidenav">
            
            <jsp:include page="__sidebar.jsp"></jsp:include>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-3 fw-bold text-secondary">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Manage Contacts</li>
                        </ol>
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
		                            <div class="col-xl-3 col-md-6">
		                                <div class="card h-100 bg-primary text-white mb-4">
		                                    <div class="card-body d-flex justify-content-between align-items-center">
		                                    	<span>Total Contacts</span>
		                                    	<h1>${totalContacts }</h1>
		                                    </div>
		                                    <div class="card-footer d-flex align-items-center justify-content-between">
		                                        <a class="small text-white stretched-link" href="${pageContext.request.contextPath}/sudo/listing/contact">View</a>
		                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col-xl-3 col-md-6">
		                                <div class="card h-100 bg-secondary text-white mb-4">
		                                    <div class="card-body d-flex justify-content-between align-items-center">
		                                    	<span>Campaigns</span>
		                                    	<h1>1 <small> - Draft</small> <br> <small style="font-size: 0.9rem;">50 Past</small></h1>
		                                    </div>
		                                    <div class="card-footer d-flex align-items-center justify-content-between">
		                                        <a class="small text-white stretched-link" href="#">Manage</a>
		                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col-xl-3 col-md-6">
		                                <div class="card h-100 bg-success text-white mb-4">
		                                    <div class="card-body d-flex justify-content-between align-items-center">
		                                    	<span>Messages</span>
		                                    	<h1>104</h1>
		                                    </div>
		                                    <div class="card-footer d-flex align-items-center justify-content-between">
		                                        <a class="small text-white stretched-link" href="#">View Details</a>
		                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col-xl-3 col-md-6">
		                                <div class="card h-100 bg-danger text-white mb-4">
		                                    <div class="card-body d-flex justify-content-between align-items-center">
		                                    	<span>Subscriptions</span>
		                                    	<h1>1 unsub</h1>
		                                    </div>
		                                    <div class="card-footer d-flex align-items-center justify-content-between">
		                                        <a class="small text-white stretched-link" href="#">Urgent</a>
		                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                        <div class="row">
		                        	<div class="col-lg-12">
		                                <canvas id="combinedChart" width="400" height="150"></canvas>
		                            </div>
		                            
		                            
			                        	<div class="col-lg-6">
			                                <div class="card mb-4">
			                                    <div class="card-header">
			                                        <i class="fas fa-chart-pie me-1"></i>
			                                        Stats (by Gender)
			                                    </div>
			                                    <div class="card-body"><canvas id="pieByGender" width="100%" height="50"></canvas></div>
			                                    <div class="card-footer small text-muted">Updated now</div>
			                                </div>
			                            </div>
			                            
			                            <div class="col-lg-6">
			                                <div class="card mb-4">
			                                    <div class="card-header">
			                                        <i class="fas fa-chart-pie me-1"></i>
			                                        Stats (by County)
			                                    </div>
			                                    <div class="card-body"><canvas id="pieByCounty" width="100%" height="50"></canvas></div>
			                                    <div class="card-footer small text-muted">Updated now</div>
			                                </div>
			                            </div>
			                        
		                        </div>
		                        
		                        <div class="row">
		                        	<div class="card mb-4">
			                            <div class="card-header">
			                                <i class="fas fa-table me-1"></i>
			                                Recently added
			                            </div>
			                            <div class="card-body">
			                                <table id="datatablesSimple">
			                                    <thead class="thead-light">
													<tr>
														<th scope="col">CONTACT_ID</th>
														<th scope="col">FULL_NAME</th>
														<th scope="col">PHONE</th>
														<th scope="col">EMAIL</th>
														<th scope="col">COUNTY</th>
														<th scope="col">ID_NUMBER</th>
														<th scope="col">DATE_OF_BIRTH</th>
														<th scope="col">GENDER</th>
														<th scope="col">DATE_ADDED</th>
														<th scope="col">COMMENTS</th>
														<th scope="col">STATUS</th>
														<th scope="col" class="d-flex justify-content-between"><span>ACTION</span> <a class="btn btn-sm btn-success" href="${pageContext.request.contextPath}/sudo/create/contact">Create</a></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${recentList}" var="Contact">
														<tr id="parent-${Contact.contactId }">
															<td>${Contact.contactId}</td>
															<td>${Contact.fullName}</td>
															<td>${Contact.phone}</td>
															<td>${Contact.email}</td>
															<td>${Contact.county}</td>
															<td>${Contact.idNumber}</td>
															<td>${Contact.dateOfBirth}</td>
															<td>${Contact.gender}</td>
															<td>${Contact.dateAdded}</td>
															<td>${Contact.comments}</td>
															<td>${Contact.status}</td>
															<td class="btn-group">
																<a class="btn btn-sm btn-success" href="${pageContext.request.contextPath}/sudo/show/contact/${Contact.contactId }">View</a>
																<a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/sudo/edit/Contact/${Contact.contactId }" title="Edit" data-bs-toggle="modal" data-bs-target="#modal-update-contact-form-${Contact.contactId }">Edit</a>
																<a class="btn btn-sm btn-danger btn-delete" href="${pageContext.request.contextPath}/sudo/contact/delete/${Contact.contactId }" title="Delete" data-filename="${Contact.fullName }" data-eid="${Contact.contactId }">Remove</a>
															</td>
														</tr>
											
														<div class="modal fade" id="modal-update-contact-form-${Contact.contactId }" tabindex="-1" role="dialog" aria-labelledby="modal-${Contact.contactId}" aria-hidden="true">
																					  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
																					    <div class="modal-content">
																					      <div class="modal-header">
																					        <h5 class="modal-title" id="modal-${Contact.contactId }">Edit Contact (${Contact.contactId })</h5>
																					        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
																					          <span aria-hidden="true">&times;</span>
																					        </button>
																					      </div>
																					      <div class="modal-body">
																					        <form action="${pageContext.request.contextPath }/sudo/update/contact/${Contact.contactId}" class="update-entity-form" name="update-contact-form-${Contact.contactId }" id="update-contact-form-${Contact.contactId }">
																					          	<input type="hidden" name="contactId" id="contactId" value="${Contact.contactId }" class="form-control name_list mb-2" required="" />
																									<div class=form-group>
																										<label for="fullName" class="font-weight-bold">FULL NAME</label>
																										<input type="text" name="fullName" id="fullName" class="form-control" value="${Contact.fullName}" required/>
																									</div>
																									<div class=form-group>
																										<label for="phone" class="font-weight-bold">PHONE</label>
																										<input type="text" name="phone" id="phone" class="form-control" value="${Contact.phone}" required/>
																									</div>
																									<div class=form-group>
																										<label for="email" class="font-weight-bold">EMAIL</label>
																										<input type="text" name="email" id="email" class="form-control" value="${Contact.email}" required/>
																									</div>
																									<div class=form-group>
																										<label for="county" class="font-weight-bold">COUNTY</label>
																										<input type="text" name="county" id="county" class="form-control" value="${Contact.county}" required/>
																									</div>
																									<div class=form-group>
																										<label for="idNumber" class="font-weight-bold">ID NUMBER</label>
																										<input type="number" name="idNumber" id="idNumber" class="form-control" value="${Contact.idNumber}" min="" required/>
																									</div>
																									<div class=form-group>
																										<label for="dateOfBirth" class="font-weight-bold">DATE OF BIRTH</label>
																										<input type="date" name="dateOfBirth" id="dateOfBirth" class="form-control" value="${Contact.dateOfBirth}" required/>
																									</div>
											
																									<div class=form-group>
																										<label for="gender" class="font-weight-bold">GENDER</label>
																										<input type="text" name="gender" id="gender" class="form-control" value="${Contact.gender}" required/>
																									</div>
																									<div class=form-group>
																										<label for="dateAdded" class="font-weight-bold">DATE ADDED</label>
																										<input type="date" name="dateAdded" id="dateAdded" class="form-control" value="${Contact.dateAdded}" required/>
																									</div>
											
																									<div class=form-group>
																										<label for="comments" class="font-weight-bold">COMMENTS</label>
																										<input type="text" name="comments" id="comments" class="form-control" value="${Contact.comments}" required/>
																									</div>
																									<div class=form-group>
																										<label for="status" class="font-weight-bold">STATUS</label>
																										<input type="text" name="status" id="status" class="form-control" value="${Contact.status}" required/>
																									</div>
																								<hr class="pt-2">
																								<div class="btn-group float-right">
																									<button type="button" class="btn btn-light mx-2" data-bs-dismiss="modal">Close</button>
																									<button class="btn btn-danger" id="btn-add-contact">Update</button>
																								</div>
																					        </form>
																					      </div>
																					      
																					    </div>
																					  </div>
																					</div>
													</c:forEach>
												</tbody>
			                                </table>
			                            </div>
			                        </div>
		                        </div>
                            </div>
                        </div>
                        
                    </div>
                </main>
                
                <jsp:include page="__footer.jsp"></jsp:include>
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${assets }/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${assets}/assets/demo/chart-area-demo.js"></script>
        <script src="${assets}/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${assets }/js/datatables-simple-demo.js"></script>

<script>
//Created for an Articles on:
//https://www.html5andbeyond.com/bubbling-text-effect-no-canvas-required/

jQuery(document).ready(function($){

 // Define a blank array for the effect positions. This will be populated based on width of the title.
 var bArray = [];
 // Define a size array, this will be used to vary bubble sizes
 var sArray = [4,6,8,10];

 // Push the header width values to bArray
 for (var i = 0; i < $('.bubbles').width(); i++) {
     bArray.push(i);
 }
  
 // Function to select random array element
 // Used within the setInterval a few times
 function randomValue(arr) {
     return arr[Math.floor(Math.random() * arr.length)];
 }

 // setInterval function used to create new bubble every 350 milliseconds
 setInterval(function(){
      
     // Get a random size, defined as variable so it can be used for both width and height
     var size = randomValue(sArray);
     // New bubble appeneded to div with it's size and left position being set inline
     // Left value is set through getting a random value from bArray
     $('.bubbles').append('<div class="individual-bubble" style="left: ' + randomValue(bArray) + 'px; width: ' + size + 'px; height:' + size + 'px;"></div>');
      
     // Animate each bubble to the top (bottom 100%) and reduce opacity as it moves
     // Callback function used to remove finsihed animations from the page
     $('.individual-bubble').animate({
         'bottom': '100%',
         'opacity' : '-=0.7'
     }, 3000, function(){
         $(this).remove()
     }
     );


 }, 350);

});

/** Signs **/
const signs = document.querySelectorAll('x-sign')
const randomIn = (min, max) => (
  Math.floor(Math.random() * (max - min + 1) + min)
)

const mixupInterval = el => {
  const ms = randomIn(2000, 4000)
  el.style.setProperty('--interval', `${ms}ms`)
}

signs.forEach(el => {
  mixupInterval(el)
  el.addEventListener('webkitAnimationIteration', () => {
    mixupInterval(el)
  })
})

</script>

<script type="text/javascript">
		// Author: David Matu, 2021
        $(document).ready(function(){
            $(document).on('click', '.toggle-password', function(){
                $(this).toggleClass("fa-eye-slash").toggleClass('fa-eye');
                var input = $(".password");
                input.attr('type') === 'password' ? input.attr('type', 'text') : input.attr('type', 'password');
            });
            
            $('#login-form').on('submit', function(e){
                e.preventDefault();
                $('.feedback-card').removeClass('d-none').empty().html('<strong class="text-primary font-weight-bold">Sending Sigin-in Request. Tafadhali subiri</strong>');
                //alert("Your are about to submit...!")
                var clientURL = $(this).attr('action');
                //alert('Posting to ' + clientURL);
                //alert("Account selected: " + accountSelected);
		        $.post('${pageContext.request.contextPath}/signin', 
		        	{
		        		smode: "ajax",
		        		userID : $('#userID').val(),
		        		userPad : $('#userPass').val()
		        	}, function(data){
	        			//alert('Response by server ' + data);
	        			$('.feedback-card').removeClass('d-none').empty().html('<strong>Attempting login. Please wait...</strong> <br><hr>' + data);
		        		//$('.feedback-card').fadeOut(800).delay(3000).fadeIn(500);
		        		/*
		        		if(data == "FILL_DETAILS") {
		        			scrollTopFunc();
		        			$('.feedback-card').removeClass('d-none').empty().html("<strong class='font-weight-bold'>Please enter your Email/Phone and Password.</strong>");
		        			$('#phone-select').attr('autofocus', 'true').addClass('border-danger');
		        		}
		        		
		        		if(data == "INVALID_ACCOUNT") {
		        			scrollTopFunc();
		        			$('.feedback-card').removeClass('d-none').empty().html("<strong class='font-weight-bold'>Sorry. Account information is invalid. Please enter correct details to continue. </strong>");
		        			$('#phone-select').attr('autofocus', 'true').addClass('border-danger');
		        		}
		        		*/

		        		if(data == "FAIL"){
		        			//scrollTopFunc();
		        			$('.feedback-card').removeClass('d-none').empty().html("<strong>Hey, sorry. I got a problem trying to log you in please try again.<hr>"
									+ "<strong class='text-dark'>(I will contact the administrator to address such issue. <br>Thank you for staying with me ~Destine)</strong></strong>");
		        		} else if(data == "FILL_DETAILS"){
		        			//scrollTopFunc();
		        			$('.feedback-card').removeClass('d-none').empty().html("<strong class='font-weight-bold'>Please enter your Email/Phone and Password.</strong>");
		        			
		        		} else if(data == "INVALID_ACCOUNT") {
		        			//scrollTopFunc();
		        			$('.feedback-card').removeClass('d-none').empty().html("<strong class='font-weight-bold text-danger'>Sorry. Invalid account information. Please enter correct details to continue." 
		        					+ "<hr><span class='text-dark'>Click <a href='${pageContext.request.contextPath}/signup' class='btn-white text-primary font-weight-bold'>here</a> to create your account</span></strong>");
		        		}         		
		        		else if(data == "SUCCESS") {
		        			setTimeout(blinkCard, 4000);
		        			$('.feedback-card').removeClass('d-none').html("<strong class='text-success font-weight-bold'>Logged in successfully. Taking you there");
		        			var nextURL = $('#nextURL').val();
		        			
		        			if(nextURL !== "" && nextURL != undefined) {
		        				$(location).attr('href', '${pageContext.request.contextPath}' + nextURL);	
		        			} else if(nextURL === '') {
		        				$(location).attr('href', "${pageContext.request.contextPath}/user/");
		        			} else {
		        				$(location).attr('href', "${pageContext.request.contextPath}/user/");
		        			}
		        			//alert("Account created successfully. \nThank you for choosing Destine.");
		        		} else {
		        			$('.feedback-card').removeClass('d-none').empty().html('<strong class="text-danger"><i class="fa fa-info-circle"></i>Could not contact server. Please check your Data or Wi-Fi connection</strong> <br><hr>');
		        		}
		        	});
		        $('.feedback-card').removeClass('d-none').empty().html('<strong class="text-danger"><i class="fa fa-info-circle"></i>Could not contact server. Please check your Data or Wi-Fi connection</strong> <br><hr>');
            });
            
            function blinkCard() {
            	$('.feedback-card').fadeOut(1000).delay(3000).fadeIn(200);
            }
            
            function scrollTopFunc() {
           	  document.body.scrollTop = 0; // For Safari
           	  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
           	} 
        });
        
    </script>
    
    
    <!-- 
    <script src="${assets}/demo/chart-bar-demo.js"></script>
    <script src="${assets}/demo/chart-pie-demo.js"></script>
    -->
    <script type="text/javascript">
 	// Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Pie Chart Example
    var ctxGender = document.getElementById("pieByGender");
    var ctxCounty = document.getElementById("pieByCounty");

    var genderPie = new Chart(ctxGender, {
      type: 'pie',
      data: {
        labels: ["Male", "Female", "Other"],
        datasets: [{ 
        	data: [${genderMale}, ${genderFemale}, ${genderOther}],
          	backgroundColor: ['#007bff', '#FF007F', '#ffc107'],
        }],
      },
    });

	// Color base
    // const baseColors = ['#007bff', '#dc3545', '#ffc107', '#17a2b8', '#28a745', '#6f42c1', '#fd7e14'];
    
    var countyPie = new Chart(ctxCounty, {
      type: 'pie',
      data: {
    	  labels: ${countyLabelsJson},
    	    datasets: [{
    	      data: ${countyDataJson},
    	      backgroundColor: ['#00B140', '#FF7E00', '#8F00FF', '#8000FF', '#FF4500', '#008080', '#00FFFF', '#A6FF00', '#FFD300', '#FF0033'], // possible to loop colors
    	    }],
      },
    });
    
    // var genderCountyData = ${genderCountyData}; // combined graph JSON data

    // Bar Chart Example
    // var ctxCombined = document.getElementById("combinedGraph");
    
    var genderCountyData = {
            "Male": { "Nairobi": 10, "Mombasa": 5, "Nakuru": 8 },
            "Female": { "Nairobi": 8, "Mombasa": 6, "Nakuru": 4 },
            "Other": { "Nairobi": 2, "Mombasa": 1, "Nakuru": 0 }
        };

        const counties = Object.keys(genderCountyData['Male']);  // Get counties from the first gender's data
        const colors = ['#007bff', '#dc3545', '#ffc107'];  // Color for each gender (you can customize this)

        // Prepare datasets for each gender
        const datasets = Object.keys(genderCountyData).map((gender, idx) => {
            return {
                label: gender,
                data: counties.map(county => genderCountyData[gender][county] || 0), // Handle missing data
                fill: false,
                borderColor: colors[idx],
                tension: 1
            };
        });
    
 	// Create the chart
 	/*
    const ctxCombo = document.getElementById("combinedChart").getContext("2d");

    const combinedChart = new Chart(ctxCombo, {
        type: 'line',
        data: {
            labels: counties,  // X-axis: Counties
            datasets: datasets  // Y-axis: Number of users per gender
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'User Distribution by Gender and County'
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    precision: 0
                }
            }
        }
    });
	*/
	
	// Create combine graph
	const rawData = ${chartDataJson};
	
	console.log("Raw data: ", JSON.stringify(rawData));
	
	const countiesData = Object.keys(rawData);
	  const genders = new Set();
	  countiesData.forEach(county => {
	    Object.keys(rawData[county]).forEach(g => genders.add(g));
	  });

	  const genderArray = Array.from(genders);
	  const datasetsCombined = genderArray.map((gender, index) => {
	    const color = ['#00B140', '#FF7E00', '#8F00FF', '#8000FF', '#FF4500', '#008080', '#00FFFF', '#A6FF00', '#FFD300', '#FF0033'][index % 4]; // add more colors if needed
	    return {
	      label: gender,
	      backgroundColor: color,
	      data: countiesData.map(county => rawData[county][gender] || 0)
	    };
	  });

	  const ctxCombinedBar = document.getElementById("combinedChart");
	  new Chart(ctxCombinedBar, {
	    type: 'bar',
	    data: {
	      labels: countiesData,
	      datasets: datasetsCombined
	    },
	    options: {
	      title: {
	        display: true,
	        text: 'Contacts Distribution by Gender and County'
	      },
	      scales: {
	        xAxes: [{ stacked: true }],
	        yAxes: [{ stacked: true }]
	      }
	    }
	  });
	
    </script>
</body>
</html>

