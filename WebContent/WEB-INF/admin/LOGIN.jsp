<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <c:url var="assets" scope="page" value="/assets"></c:url> --%>

<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
		
	<script src="${assets}/vendor/jquery/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="${assets}/vendor/bootstrap/css/bootstrap.min.css">
    <!-- bootstap bundle js -->
    <script src="${assets}/vendor/bootstrap/js/bootstrap.bundle.js"></script>

	<!--Custom styles-->
	<style>
		/* Made with love by Mutiullah Samim*/

		@import url('https://fonts.googleapis.com/css?family=Numans');
		
		html,body{
		/* background-color: blue; */
		background-image: url('${assets}/images/ws_Summer_Road_2560x1600.jpg');		/* Bg photo from Wallpaper Stock https://wallpaperstock.net/summer-road-wallpapers_w33884.html  |   https://static3.bigstockphoto.com/0/6/3/large1500/360405742.jpg');*/
		background-size: cover;
		background-position: center center;
		background-repeat: no-repeat;
		background-attachment: fixed;
		height: 100%;
		font-family: 'Numans', sans-serif;
		}
		
		.container{
		height: 100%;
		align-content: center;
		}
				
		@media only screen and (min-width: 512px) {
			.card{
				height: 370px;
				margin-top: auto;
				margin-bottom: auto;
				width: 400px;
				background-color: rgba(0,0,0,0.5) !important;
			}	
		}
		
		.social_icon span{
		font-size: 60px;
		margin-left: 10px;
		color: #D3FD12;
		}
		
		.social_icon span:hover{
		color: white;
		cursor: pointer;
		}
		
		.card-header h3{
		color: white;
		}
		
		.social_icon{
		position: absolute;
		right: 20px;
		top: -45px;
		}
		
		.input-group-prepend span{
		width: 50px;
		background-color: green;
		color: white;
		border:0 !important;
		}
		
		input:focus{
		outline: 0 0 0 0  !important;
		box-shadow: 0 0 0 0 !important;
		
		}
		
		.remember{
		color: white;
		}
		
		.remember input
		{
		width: 20px;
		height: 20px;
		margin-left: 15px;
		margin-right: 5px;
		}
		
		.login_btn{
		color: black;
		background-color: #FFC312;
		width: 100px;
		}
		
		.login_btn:hover{
		color: black;
		background-color: white;
		}
		
		.links{
		color: white;
		}
		
		.links a{
		margin-left: 4px;
		}
		
		.font-weight-boldest {
			font-weight: bolder;
			font-size: 5rem;
			color: #FFF;
		}
		
		.bubbles {
			
			}
			
			.bubbles h1 {
			position: relative;
			margin: 1em 0 0;
			font-family: 'Luckiest Guy', cursive;
			color: #fff;
			z-index: 2;
			}
			
			.individual-bubble {
			position: absolute;
			border-radius: 100%;
			bottom: 10px;
			background-color: #fff;
			z-index: 1;
			}
			
			x-sign {
			  --interval: 2s;
			  display: block;
			  text-shadow: 
			    0 0 10px var(--color1),
			    0 0 20px var(--color2),
			    0 0 40px var(--color3),
			    0 0 80px var(--color4);
			  will-change: filter, color;
			  filter: saturate(60%);
			  animation: flicker steps(100) var(--interval) 1s infinite;
			}
			
			x-sign:nth-of-type(1) {
			  color: azure;
			  --color1: azure;
			  --color2: aqua;
			  --color3: dodgerblue;
			  --color4: blue;
			  font-family: Sriracha;
			}
			
			x-sign:nth-of-type(5) {
			  color: yellow;
			  --color1: goldenrod;
			  --color2: orangered;
			  --color3: mediumblue;
			  --color4: purple;
			  font-family: Gruppo;
			}
			
			x-sign:nth-of-type(2) {
			  color: lightpink;
			  --color1: pink;
			  --color2: orangered;
			  --color3: red;
			  --color4: magenta;
			  font-family: Bad Script;
			}
			
			x-sign:nth-of-type(3) {
			  color: lightyellow;
			  --color1: yellow;
			  --color2: lime;
			  --color3: green;
			  --color4: mediumblue;
			  font-family: Kumar One Outline;
			}
			
			x-sign:nth-of-type(4) {
			  color: lightyellow;
			  --color1: gold;
			  --color2: firebrick;
			  --color3: pink;
			  --color4: red;
			  font-family: Londrina Outline;
			}
			
			
			x-sign:nth-of-type(5) {
			  color: azure;
			  --color1: azure;
			  --color2: aqua;
			  --color3: dodgerblue;
			  --color4: blue;
			  font-family: Sriracha;
			}
			
			x-sign:nth-of-type(6) {
			  color: tomato;
			  --color1: orangered;
			  --color2: firebrick;
			  --color3: maroon;
			  --color4: darkred;
			  font-family: Yellowtail;
			}
			
			x-sign:nth-of-type(7) {
			  color: lightyellow;
			  --color1: yellow;
			  --color2: orange;
			  --color3: brown;
			  --color4: purple;
			  font-family: Bad Script;
			}
			
			x-sign:nth-of-type(2) {
			  color: yellow;
			  --color1: yellow;
			  --color2: lime;
			  --color3: green;
			  --color4: darkgreen;
			  font-family: Monoton;
			}
			
			x-sign:nth-of-type(9) {
			  color: lightyellow;
			  --color1: yellow;
			  --color2: gold;
			  --color3: orange;
			  --color4: darkred;
			  font-family: Sriracha;
			}
			
			@keyframes flicker {
			  50% {
			    color: white;
			    filter: saturate(200%) hue-rotate(20deg);
			  }
			}
		
	</style>
</head>
<body>
<div class="container h-100">
	<h1 class="font-weight-boldest text-center mb-5 pt-5 pb-5 bubbles"> <hr class="bg-white">
		<%-- <a class="" href="${pageContext.request.contextPath }/home"><x-sign>*****</x-sign></a> --%>
		<x-sign>
		  <small>Login</small><br> <em>****</em>
		</x-sign>
	</h1>
	<div class="d-flex text-center justify-content-center">
		
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
				<hr>
				
			</div>
			<div class="card-body">
				<div class="form-group bg-white " style="max-height: 100px;">
					<div class="d-none border-primary p-2 font-weight-bold feedback-card text-danger rounded" id="feedback-card"></div>
				</div>
				<form class=" p-0 p-md-2" id="login-form" method="POST" action="${pageContext.request.contextPath}/signin">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="userID" id="userID" placeholder="username / email">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" name="userPad" id="userPass" placeholder="password">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me (for 12 hours)
						<input type="hidden" name="smode" value="formSubmit" />
					</div>
					<div class="form-group">
						<input type="submit" value="Login" class="btn btn-lg float-right btn-block btn-success mt-2">
					</div>
					
				</form>
			</div>
			<div class="card-footer mt-5 pt-5">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="${pageContext.request.contextPath }/sign-up" class="text-white">Sign Up</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#" class="text-white">Forgot your password?</a>
				</div>
				
				<a href="${pageContext.request.contextPath }/signin/staff" class="p-4 mx-auto text-center">/_\</a>
			</div>
		</div>
	</div>
	<div class="card-footer bubbles text-center">
		
	</div>
</div>

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

