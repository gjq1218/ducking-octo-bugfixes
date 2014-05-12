<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
     <head>
     <title>Contacts</title>
     <meta charset="utf-8">
     <link rel="icon" href="images/favicon.ico">
     <link rel="shortcut icon" href="images/favicon.ico" />
     <link rel="stylesheet" href="css/form.css">
     <link rel="stylesheet" href="css/style.css">
     <script src="js/jquery.js"></script>
     <script src="js/jquery-migrate-1.1.1.js"></script>
     <script src="js/jquery.equalheights.js"></script>
     <script src="js/jquery.ui.totop.js"></script>
     <script src="js/TMForm.js"></script>
     <script src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&amp;sensor=false"></script>
     <script>
        $(document).ready(function(){

          $().UItoTop({ easingType: 'easeOutQuart' });
        });
     </script>
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
          <li class="bt-icon "><a href="About.jsp">About</a></li>
         <li class="bt-icon"><a href="Menu.jsp">Menu</a></li>
        
             <% if(session.getAttribute("currentuser")==null) {%>
                  <li class="bt-icon"><a href="Sign_in.jsp">Sign In</a></li>
             <%}else{%>
                  <li class="bt-icon"><a href="Profile.jsp">My Profile</a></li>
             <%} %>
   
         <li class="bt-icon"><a href="Reservation.jsp">Reservation</a></li>
         <li class="current bt-icon"><a href="Contacts.jsp">Contacts</a></li>
       
        </ul>
      </nav>
    
 <div class="clear"></div>
</div>
<div class="clear"></div>
          </div>
      </div>
</header>


<!--==============================Content=================================-->

<div class="content contact">
  <div class="container_12">
      <div class="grid_12">
        <div id="map"></div>
      </div>
      <div class="clear"></div>
      <div class="grid_15">
        <h3 class="head3">Baltimore</h3>
              <div class="map">


                <address>
                              <dl>
                                  <dt>The Mongolia's Hot Pot.<br>
                                      500 W. University Pkwy,<br>
                                      Baltimore, MD 21210.
                                  </dt>
                                  <dd><span>Freephone:</span>+1 023 101-1111</dd>
                                  <dd><span>Telephone:</span>+1 023 101-1111</dd>
                                  <dd><span>FAX:</span>+1 800 889 9898</dd>
                                  <dd>E-mail: <a href="#" class="col2">Welcome@MongoliaHotPot.org</a></dd>
                                  <dd>Skype: <a href="#" class="col2">@MongoliaHotPot</a></dd>
							</dl>
                           </address>
                         

            </div>
      </div>
      
      
      <div class="grid_15">
        <h3 class="head3">Beijing</h3>
              <div class="map">


                <address>
                              <dl>	
                              	  <dt>The Mongolia's Hot Pot. <br>
                                      Number 22 Dongsishitiao,<br>
                                      Beijing, 100028
                                  </dt>
                                 
                                  <dd><span>Freephone:</span>+1 023 101-1112</dd>
                                  <dd><span>Telephone:</span>+1 023 101-1112</dd>
                                  <dd><span>FAX:</span>+1 800 889 9898</dd>
                                  <dd>E-mail: <a href="#" class="col2">Welcome@MongoliaHotPot.org</a></dd>
                                  <dd>Skype: <a href="#" class="col2">@MongoliaHotPot</a></dd>
							</dl>
                           </address>
                           
            </div>
      </div>
      
      
      <div class="grid_15">
        <h3 class="head3">New York</h3>
              <div class="map">


                <address>
                              <dl>
                                  <dt>The Mongolia's Hot Pot.<br>
                                      56 Beaver St,<br>
                                      New York, NY 10004
                                  </dt>
                                 <dd><span>Freephone:</span>+1 023 101-1113</dd>
                                  <dd><span>Telephone:</span>+1 023 101-1113</dd>
                                  <dd><span>FAX:</span>+1 800 889 9898</dd>
                                  <dd>E-mail: <a href="#" class="col2">Welcome@MongoliaHotPot.org</a></dd>
                                  <dd>Skype: <a href="#" class="col2">@MongoliaHotPot</a></dd>
							</dl>
                           </address>
                        

            </div>
      </div>
      
      <div class="grid_15">
        <h3 class="head3">San Jose</h3>
              <div class="map">


                <address>
                              <dl>
                                  <dt>The Mongolia's Hot Pot.<br>
                                      2800 California St,<br>
                                      San Francisco, CA 94115
                                  </dt>
                                <dd><span>Freephone:</span>+1 023 101-1114</dd>
                                  <dd><span>Telephone:</span>+1 023 101-1114</dd>
                                  <dd><span>FAX:</span>+1 800 889 9898</dd>
                                  <dd>E-mail: <a href="#" class="col2">Welcome@MongoliaHotPot.org</a></dd>
                                  <dd>Skype: <a href="#" class="col2">@MongoliaHotPot</a></dd>
							</dl>
                           </address>
                        

            </div>
      </div>
      
      
      <!-- <div class="grid_8">
        <h3 class="head3">Contact Form</h3>
              <form id="form">
                              
                        <div class="success_wrapper">
                        <div class="success-message">Contact form submitted</div>
                        </div>
                        <label class="name">
                        <input type="text" placeholder="Name:" data-constraints="@Required @JustLetters" />
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                        </label>
                      
                        <label class="email">
                        <input type="text" placeholder="E-mail:" data-constraints="@Required @Email" />
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid email.</span>
                        </label>
                         <label class="phone">
                            <input type="text" placeholder="Phone:" data-constraints="@Required @JustNumbers"/>
                            <span class="empty-message">*This field is required.</span>
                            <span class="error-message">*This is not a valid phone.</span>
                            </label>
                        <label class="message">
                        <textarea placeholder="Message:" data-constraints='@Required @Length(min=20,max=999999)'></textarea>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*The message is too short.</span>
                        </label>
                        <div>
                        <div class="clear"></div>
                        <div class="btns">
                        <a href="#" data-type="reset" class="btn">Clear</a>
                        <a href="#" data-type="submit" class="btn">Send</a></div>
                        </div>
                        </form>   
      </div>
  
   -->
  
  
  
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
     <script src="js/map.js"></script>

</body>
</html>