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
    <h1><a href="index.html"><img src="images/logo.png" alt="Boo House"></a> </h1>
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
        <p class="col1">Following the <span><a href="http://blog.templatemonster.com/free-website-templates/" rel="dofollow">link</a></span>, you’ll learn more about this goodie produced by <br> TemplateMonster.com. </p>
        <p class="col1">Want to get more designs of this kind? Check out the category of premium <span><a href="http://www.templatemonster.com/category/cafe-and-restaurant-website-templates/" rel="nofollow">Cafe &amp; Restaurant templates</a></span>.</p>
        <p>Aliquam nibh ante, egestas id dictum modo luctus libero. Praesent faucibus malesorem ipsum dolor sit amet, consecteturer. </p>
      </div>
       at magna non nunc tristique rhoncus. Aliquam nibh ante, egestas id dictum ammodo luctus libero. Praesent faucibus malesuada faucibus. Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nullam consectetur orci sed nulla facilisis consequat. 
    </div>
    
    <div class="grid_4">
      <h3>Features</h3>
      <p class="col1 pad1">Magna non nunc tristiquencus. Aliquam nibh ante, egestas id dictum modo luctus libero. </p>
      <p class="pad1">Dolor sit amet, consectetureripiscingelit. Nullam consectetur orci se nullafaci.</p>
      <ul class="list">
        <li><a href="#">Curabitur Vellore Sit</a></li>
        <li><a href="#">Eu Consectetur Ligula</a></li>
        <li><a href="#">Dui eros Laoreet Sit amet </a></li>
        <li><a href="#">Estvel Dertolino</a></li>
        <li><a href="#">Commodo Venenatis Erossce</a></li>
        <li><a href="#">Adipiscing Quam id Risus </a></li>
        <li><a href="#">Sagittis  Consequat Lacus </a></li>
        <li><a href="#">Onterdumoin ut </a></li>
      </ul>
    </div>
    
    <div class="grid_12">
      <h3 class="head1">The Best of Professionals</h3>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/page2_img1.jpg" alt="">
        <div class="title"><a href="#">Emma Smith</a></div>
Deneger convallis orci vel mi delaoreet, at ornare lorem consequat. Phasellus era nisl auctor vel velitero. 

      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/page2_img2.jpg" alt="">
        <div class="title"><a href="#">Thomas Nelson</a></div>
Reenteger convallis orci veli saelaoreet, at ornare lorem konsequat. Khasellus era  jauctor vel veliteru.  
      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/page2_img3.jpg" alt="">
        <div class="title"><a href="#">Linda Grey</a></div>
Ortolieger convallis omi tem more, at ornare loren coatr. Lasellus era nisl auctor vel veliterolsed pharetr. 

      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/page2_img4.jpg" alt="">
        <div class="title"><a href="#">Richard Cox</a></div>
Gonvallis orci vel mi oreilat otornare lorem consequat. Kllus era nisl auctor veli detelolvenenatis nullo. 

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
