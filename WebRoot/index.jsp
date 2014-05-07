<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
     <head>
     <title>Welcome to Mongolias's Hot Pot!</title>
     <meta charset="utf-8" name = &quot;decription&quot; content = &quot;Hello&quot;>
     <link rel="icon" href="images/favicon.ico">
     <link rel="shortcut icon" href="images/favicon.ico" />
     <link rel="stylesheet" href="css/style.css">
     <script src="js/jquery.js"></script>
     <script src="js/jquery-migrate-1.1.1.js"></script>
     <script src="js/jquery.equalheights.js"></script>
     <script src="js/jquery.ui.totop.js"></script>
     <script src="js/jquery.easing.1.3.js"></script>
     <script src="http://platform.tumblr.com/v1/share.js"></script>
     <script>
        $(document).ready(function(){
          $( ".block1" ).mouseover(function() {
            $(this).addClass( "blur" );
          });
          $( ".block1" ).mouseout(function() {
            $(this).removeClass( "blur" );
          });
          $().UItoTop({ easingType: 'easeOutQuart' });
        }); 
     </script>
 
     </head>
     <body class="page1">

<!--==============================header=================================-->
 <header> 
  <div class="container_12">
   <div class="grid_12"> 
    <div class="socials">
    
     <%-- Twitter share --%
     <%-- <a href="http://twitter.com/home?status=<?php echo urlencode($title).' '.$current_url; ?>" title="Click to share this post on Twitter" target="_blank">
     <img src="images/pint.png" alt="Share on Twitter" title="Share on twitter"></a>   --%>
 
      
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
         <li class="current bt-icon "><a href="index.jsp">Home</a></li>
         <li class="bt-icon"><a href="About.jsp">About</a></li>
         <li class="bt-icon"><a href="Menu.jsp">Menu</a></li>
         <li class="bt-icon"><a href="Sign_in.jsp">Sign In</a></li>
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
<a href="Menu.jsp" class="block1">
  <img src="images/blur_img1.jpg" alt="">
  <span class="price"><span>1st step: Select Soup Base.</span><span><small>$</small> 15.99 </span><span><small>Spicy Hot Pot</small></span><strong></strong></span>
</a>
<a href="Menu.jsp" class="block1">
  <img src="images/blur_img2.jpg" alt="">
  <span class="price"><span>2nd step: Select Meet.</span><span><small>$</small> 23.90</span><span><small>Select beef</small></span><strong></strong></span>
</a>
<a href="Menu.jsp" class="block1">
  <img src="images/blur_img3.jpg" alt="">
  <span class="price"><span>3rd step: Select Greens.</span>
<span><small>$</small> 10.99</span><span><small>Spinach</small></span><strong></strong></span>
</a>

  <div class="container_12">
    <div class="grid_12">
      <h3>New in Menu</h3>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/box_img1.jpg" alt="">
        <div class="title">Mini Sausages</div>
        These Sausages are made with a combination of grape jelly and chili sauce, which is absolutely delicious.
        <br>
        <a href="Menu.jsp">More Info</a>
      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/box_img2.jpg" alt="">
        <div class="title">Cold Noodels</div>
        Sichuan cold noodles are so famous for its pungency resulting from liberal use of garlic and chili peppers.
      
        <br>
        <a href="Menu.jsp">More Info</a>
      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/box_img3.jpg" alt="">
        <div class="title">Green Mussel</div>
        Try these freshest Green Mussel! It's so delicious that you'll never forget. Eat healthy, life healthy!
        <br>
        <a href="Menu.jsp">More Info</a>
      </div>
    </div>
    <div class="grid_3">
      <div class="box maxheight">
        <img src="images/box_img4.jpg" alt="">
        <div class="title">Scallops</div>
        
        Do you know? Scallops contain a variety of nutrients that can promote your cardiovascular health.
        <br>
        <a href="Menu.jsp">More Info</a>
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
      &copy; Copyright &copy; 2014.Author:Jiaqi GAO Company name All rights reserved.
      </div>
      
      <!-- <div class="copy">
      &copy; Copyright &copy; 2014.Author: Jiaqi GAO Company name All rights reserved.
      </div> -->
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
</body>
</html>