<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <c:url var="assets" scope="page" value="/assets"></c:url> --%>

<!DOCTYPE html>
<html>
<head>
	<title>::: Context Manager :::</title>
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
	<h1 class="font-weight-boldest text-center mt-5 mb-5 pt-5 pb-5 bubbles"> <hr class="bg-white">
		<a class="" href="${pageContext.request.contextPath }/home"><x-sign>Project</x-sign></a>
		<x-sign>
		  <small>Deployment Context Manager</small>
		</x-sign>
	</h1>
	<div class="d-flex text-center justify-content-center">
		
		<div class="card shadow shadow-lg">
			<div class="card-header bg-success">
				<h3>Deployment Context Manager</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body shadow w-100">
               <form action="${pageContext.request.contextPath}/deployment/context" method="POST" class="form mb-4 col-md-6 mx-auto card-body">
                      <div class="row">                                
                        <div data-form-alert-danger="" class="alert col-12 text-center h1 text-secondary font-weight-bolder" style="font-size: 20px;">
                          <span style="background-color: white; color: green;">${msg}</span>
                        </div>
                    </div>
                    <div class="dragArea row">
                        <div data-for="phone" class="col-md-12 form-group ">
                            <div class="row bg-white rounded mt-4">
                          <div class="col-md-12"><h1>Specify the URL to use for serving Static Resources</h1></div>
                          <div class="col-md-12">
                            <div class="input-group" id="form-group-baptised">                                
                                <div class="input-group btn-group">
                                <c:choose>
	                                <c:when test="${assets == 'http://your-dns.com'}">
	                                	<c:set var="contextCloud" value="checked='checked'"/>
	                                	<c:set var="activeBColor" value="text-success"/>
	                                </c:when>
	                                <c:when test="${assets == '/assets'}">
	                                	<c:set var="contextWeb" value="checked='checked'"/>
	                                	<c:set var="activeBNColor" value="text-success"/>
	                                </c:when>
	                                <c:otherwise>
	                                	<c:set var="contextWeb" value="checked='checked'"/>
	                                	<c:set var="activeBColor" value="text-success"/>
	                                </c:otherwise>
	                            </c:choose>
                                <div class="form-check form-check-inline btn">
                                   <input class="form-check-input" type="radio" name="contextURL" id="contextURL_id_1" value="contextWeb" ${contextWeb}>
                                   <label class="form-check-label activeBColor" for="contextURL_id_1">Web servers internal resources (Not optimal for Production!)</label>
                                </div>
                                <div class="form-check form-check-inline btn btn-lght">
                                   <input class="form-check-input" type="radio" name="contextURL" id="contextURL_id_2" value="contextCloud" ${contextCloud }>
                                   <label class="form-check-label activeBNColor" for="contextURL_id_2">Use your Custom CDN (Recommended)</label>
                                </div>
                                </div>
                            </div>
                          </div>
                      </div>
                        </div>
                        
                        <div class="col-md-12 input-group-btn">
                          <button type="submit" class="btn btn-block btn-danger btn-lg">UPDATE	</button>
                        </div>
                    </div>
               </form>  
            </div>
			
		</div>
	</div>
	<div class="card-footer bubbles text-center">
		<a href="${pageContext.request.contextPath }/endpoints" class="p-4 mx-auto text-center">Endpoints</a>
		<a href="${pageContext.request.contextPath }/deployment/context" class="p-4 mx-auto text-center">Context</a>
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
</body>
</html>

