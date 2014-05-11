<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">
     <head>
     <title>Menu</title>
     <meta charset="utf-8">
     <link rel="icon" href="images/favicon.ico">
     <link rel="shortcut icon" href="images/favicon.ico" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/style.css">
     <script src="js/jquery.js"></script>
     <script src="js/jquery-migrate-1.1.1.js"></script>
     <script src="js/jquery.equalheights.js"></script>
     <script src="js/jquery.ui.totop.js"></script>
     <script src="js/jquery.tabs.min.js"></script>
     <script src="js/touchTouch.jquery.js"></script>
     <script src="js/jquery.easing.1.3.js"></script>
     <script>
        $(document).ready(function(){

          $().UItoTop({ easingType: 'easeOutQuart' });
         $('.gallery a.gal').touchTouch();
         
       }); 
     </script>
    
     </head>
     <body  class="">
     
     
     <!--==============================header=================================-->
  <header> 
  <div class="container_12">
   <div class="grid_12"> 
    <div class="socials">
      
      <%-- Twitter share --%>
      <a href="https://twitter.com/share" class = "last1">
      <script>!function(d,s,id)
      {var js,fjs=d.getElementsByTagName(s)[0];
      if(!d.getElementById(id)){
      	js=d.createElement(s);
      	js.id=id;
      	js.src="//platform.twitter.com/widgets.js";
      	fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script></a>
    
  	  <%-- Facebook share --%>
	  <a href="http://www.facebook.com/share.php?u=<?php echo $current_url; ?>" target="_blank" class = "last2"></a> 
     
      <%-- Googel+ share --%>
      <a href="https://plus.google.com/share?url=<?php echo urldecode($current_url); ?>" onclick="javascript:window.open(this.href, '_blank','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');" class = "last3">
 	</a>

	  <%--Tumblr --%>
      <a href="http://www.tumblr.com/share" class="last4"></a> 

    </div>
    <h1><a href="index.jsp"><img src="images/logo.png" alt="Boo House"></a> </h1>
    <div class="menu_block">


    <nav id="bt-menu" class="bt-menu">
        <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
        <ul>
          <li class="bt-icon"><a href="index.jsp">Home</a></li>
          <li class="current bt-icon "><a href="About.jsp">About</a></li>
         <li class="bt-icon"><a href="Menu.jsp">Menu</a></li>
        
             <% if(session.getAttribute("currentuser")==null) {%>
                  <li class="bt-icon"><a href="Sign_in.jsp">Sign In</a></li>
             <%}else{%>
                  <li class="bt-icon"><a href="Profile.jsp">My Profile</a></li>
             <%} %>
   
         <li class="bt-icon"><a href="Reservation.jsp">Reservation</a></li>
         <li class="bt-icon"><a href="Contacts.jsp">Contacts</a></li>
       
        </ul>
      </nav>
    
 <div class="clear"></div>
</div>
<div class="clear"></div>
          </div>
      </div>
</header>

<!--==============================Content=================================-->

<div class="content"><div class="ic"></div>
  <div class="container_12">
  
    <div class="grid_8">
    <h3>About Us</h3>
      <img src="images/page2_img.jpg" alt="" class="img_inner fleft">
      <div class="extra_wrapper">
        <p><font class="col1">ABOUT THE FOUNDER:</font><br>Mongolia's Hot Pot restaurant was built in 2012. It's owned by GAO's Family. The biggest shareholder is Mr. MengMin GAO and Miss. Jiaqi GAO. </p>
        <p><font class="col1">WHAT TO EXCEPT:</font><br>For those who put so much of ourselves into Mongolia's Hot Pot, it's more than our work - it's our home. </p>
      </div>
		And that's how we try to welcome you - as a guest in a home we love, that we're proud of and eager for you to love, too. We want you to feel special when you're here,
		we want you to expect that everthing, every last detail is taken care of for you so that your are welcomed, relaxed and at east. And most of all happy.
    </div>
    
    <div class="grid_4">
      <h3>Features</h3>
      <p class="col1 pad1">We offer the most traditional Chinese Hot Pot and our homemade special menus.</p>
      <p class="col1 pad1"> We developed 6 best flavors of the Hot Pot base soups which are the spirit of our Hot Pot taste.</p>
      <ul class="list">
        <li><a href="#">6 Best Flavor Soup Base</a></li>
        <li><a href="#">Homemade Specialty MeatBalls</a></li>
        <li><a href="#">Handmade Mashed Beef </a></li>
        <li><a href="#">Fruit Lce Kacang</a></li>
        <li><a href="#">Homemade Specialty Seasoning</a></li>
        <li><a href="#">Hand-Pulled Noodles</a></li>
        <li><a href="#">Most Fresh Seafood</a></li>
        <li><a href="#">Specialty Tofu </a></li>
      </ul>
    </div>
    
    <div class="grid_12">
      <h3 class="head1">The Best of Professionals</h3>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/page2_img1.jpg" alt="">
        <div class="title"><a href="#">Barack Obama</a></div>
		Our best Chef who investigated the 6 favors of the Hot Pot Soups.His achievement to our restaurant is unbelieveable! 
			

      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/page2_img2.jpg" alt="">
        <div class="title"><a href="#">Thomas Nelson</a></div>
		He invested our famous Hand-Pulled Noodles and created the amazing performace to show the process of making noodles!
      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/page2_img3.jpg" alt="">
        <div class="title"><a href="#">Linda Grey</a></div>
	Grey is our Baker and dessert designer who invested the friut Ice Kacang which is really popular to our customers!Definitely Try it!
      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/page2_img4.jpg" alt="">
        <div class="title"><a href="#">Richard Cox</a></div>
	Cox is our most senior chef and he invested 15 different flavors of Mongolias's homemade specialty and homemade seasoning! 

      </div>
    </div>
  </div>
</div>

<!--==============================footer=================================-->

<footer>    
  <div class="container_12">
    <div class="grid_6 prefix_3">
      <a href="index.html" class="f_logo"><img src="images/f_logo.png" alt=""></a>
      <div class="copy">
      &copy; Copyright &copy; 2014.Author: Jiaqi GAO Company name All rights reserved.
      </div>
    </div>
  </div>
</footer>
      <script>
      $(document).ready(function(){ 
         $(".bt-menu-trigger").toggle( 
          function(){
            $('.bt-menu').addClass('bt-menu-open'); 
          }, 
          function(){
            $('.bt-menu').removeClass('bt-menu-open'); 
          } 
        ); 
      }); 
    </script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'  charset='gb2312'></script></div>
</body>
</html>
