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
        <title>Search Results - Zurion Technologies Admin</title>
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
                        <h1 class="mt-3 fw-bold text-secondary">Contacts API Client</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">
                            	<c:choose>
                                	<c:when test="${SearchResultType == 'individual' }">
                                		<strong>Search Result for Individual Contact</strong>
                                	</c:when>
                                	
                                	<c:when test="${SearchResultType.startsWith('company') }">
                                		<strong>Search results for ${SearchResultType.toString()}</strong>
                                	</c:when>
                                </c:choose>
                            </li>
                        </ol>
                        <hr>
                        <div class="row">
                            <div class="col-12">
                            	<c:choose>
                                	<c:when test="${SearchResultType == 'individual' }">
                                		<c:choose>
                                			<c:when test="${AdvancedContact != null }">
                                				<div class="card shadow shadow-lg border-success" id="profile-overview">
													<div class="card-header bg-light">
														<h5 class="card-title">AdvancedContact: ${AdvancedContact.phone}</h5>
													</div>
													<div class="card-body">
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">CONTACT ID</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.contactId}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">FULL NAME</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.fullName}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">MASKED NAME</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.maskedName}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">PHONE</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.phone}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">PHONE MASK</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.phoneMask}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">PHONE HASH</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.phoneHash}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">EMAIL</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.email}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">ID NUMBER</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.idNumber}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">DATE OF BIRTH</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.dateOfBirth}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">GENDER</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.gender}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">ORGANIZATION</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.organization}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">DATE CREATED</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.dateCreated}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">COMMENTS</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.comments}</div>
														</div>
														<div class="row">
															<div class="col-lg-3 col-md-4 text-dark label ">STATUS</div>
															<div class="col-lg-9 col-md-8 font-weight-bold fw-bold">${AdvancedContact.status}</div>
														</div>
													</div>
													<div class="card-footer d-none">
																<a class="btn btn-sm btn-success" href="${pageContext.request.contextPath}/sudo/listing/advancedcontact">All</a>
																<a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/sudo/update/advancedcontact/${AdvancedContact.contactId }">Edit</a>
																<a class="btn btn-sm btn-danger btn-delete" href="${pageContext.request.contextPath}/sudo/advancedcontact/delete/${AdvancedContact.contactId }" title="Delete" data-filename="${AdvancedContact.contactId }" data-eid="${AdvancedContact.contactId }">Remove</a>
													</div>
												</div>
                                			</c:when>
                                			
                                			<c:when test="${AdvancedContact == null }">
                                				The contact cannot be displayed right now
                                			</c:when>
                                			
                                			<c:otherwise>
                                				<p>There were no results found</p>
                                			</c:otherwise>
                                		</c:choose>
                                	</c:when>
                                	
                                	<c:when test="${SearchResultType.startsWith('company') }">
		                                		<div class="table-responsive">
													<table class="table table-striped table-hover datatable">
														<thead class="thead-light">
															<tr>
																<th scope="col">CONTACT_ID</th>
																<th scope="col">FULL_NAME</th>
																<th scope="col">MASKED_NAME</th>
																<th scope="col">PHONE</th>
																<th scope="col">PHONE_MASK</th>
																<th scope="col">PHONE_HASH</th>
																<th scope="col">EMAIL</th>
																<th scope="col">ID_NUMBER</th>
																<th scope="col">DATE_OF_BIRTH</th>
																<th scope="col">GENDER</th>
																<th scope="col">ORGANIZATION</th>
																<th scope="col">DATE_CREATED</th>
																<th scope="col">COMMENTS</th>
																<th scope="col">STATUS</th>
													</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${aList}" var="AdvancedContact">
																<tr id="parent-${AdvancedContact.contactId }">
																	<td>${AdvancedContact.contactId}</td>
																	<td>${AdvancedContact.fullName}</td>
																	<td>${AdvancedContact.maskedName}</td>
																	<td>${AdvancedContact.phone}</td>
																	<td>${AdvancedContact.phoneMask}</td>
																	<td>${AdvancedContact.phoneHash}</td>
																	<td>${AdvancedContact.email}</td>
																	<td>${AdvancedContact.idNumber}</td>
																	<td>${AdvancedContact.dateOfBirth}</td>
																	<td>${AdvancedContact.gender}</td>
																	<td>${AdvancedContact.organization}</td>
																	<td>${AdvancedContact.dateCreated}</td>
																	<td>${AdvancedContact.comments}</td>
																	<td>${AdvancedContact.status}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
													</div>
		                                	</c:when>
                                </c:choose>    
                            </div>
                            
                            <div class="col-12">
                            	<c:choose>
	                            	<c:when test="${SearchResultType == null || SearchResultType == '' }">
	                            		<p>No results found</p>
	                            	</c:when>
	                            </c:choose>
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
</body>
</html>

