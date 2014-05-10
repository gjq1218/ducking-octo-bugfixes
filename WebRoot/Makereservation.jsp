<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>

<html lang="en">
     <head>
    
     <title>Make a reservation</title>
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
     
     <!-- For the calendar -->
     <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  	<!--  <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
  	 <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

  	 <link href="css/datepicker.css" rel="stylesheet" type="text/css"/>  
  	 
	
	  <script>
  		$(function() {
   		 $( "#datepicker" ).datepicker({
   		 	inline: true,  
            showOtherMonths: true,  
            dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],  
   		 
   		 });
  		});
 	  </script>
		
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
                  <li class="current bt-icon"><a href="Sign_in.jsp">Sign In</a></li>
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
<!-- ======== left side bar ================== -->
	<%@ include file="Leftbar.jsp" %>
     <div class = "grid_14">   
  	
     	<h3>Make Reservation</h3>
     	
     	 <div class="profile_form">
              <h4>Come here to make a reservation.</h4>
                <div class="form_subtitle">Make a reservation.</div>
        
     	
         <form name="make_reservation" class = "datepicker" action = "MakeReservation" method = "post">
 	
 	
		<table> 
		
		<!----- Which Restaurant ---------------------------------------------------------->
		
	  	<tr>
	  	<td>Which Restaurant</td>
		 
		<td>
		<select name="restaurant_name" id="restaurant_name">
		<option value="-1">Locations:</option>
		<option value="Baltimore">Baltimore</option>
		<option value="Beijing">Beijing</option>
		<option value="New York">New York</option>
		<option value="San Francisco">San Francisco</option>	
		</select>
				

		</td>
		
		<td>
			 <s:fielderror cssStyle="color: red">
	           <s:param>whichrestaurant</s:param>
	        </s:fielderror>
		
		</td>
		<tr>
 
	  	<!----- Date ---------------------------------------------------------->
		<tr>
		<td>Date:</td>

		<td><input type="text" name="date" id = "datepicker" maxlength="30"/>
		</td>
		
		<td>
			 <s:fielderror cssStyle="color: red">
	           <s:param>reservedate</s:param>
	        </s:fielderror>
		</td>
		</tr>

		<!----- Time ---------------------------------------------------------->
	
		<tr>
		<td>Time</td>
		<td>
		<select name="arrival_time" id="arrival_time" >
		<option value="-1">Arrival Time:</option>
		<option value="10:00 am">10:00 am</option>
		<option value="11:00 am">11:00 am</option>
		<option value="12:00 am">12:00 am</option>
		<option value="01:00 pm">1:00 pm</option>
		<option value="02:00 pm">2:00 pm</option>
		<option value="03:00 pm">3:00 pm</option>
		<option value="04:00 pm">4:00 pm</option>
		<option value="05:00 pm">5:00 pm</option>
		<option value="06:00 pm">6:00 pm</option>
		<option value="07:00 pm">7:00 pm</option>
		<option value="08:00 pm">8:00 pm</option>
		<option value="09:00 pm">9:00 pm</option>
		<option value="11:00 pm">10:00 pm</option>
		</select>
		</td>
		<td> 
			<s:fielderror cssStyle="color: red">
	           <s:param>arrivetime</s:param>
	        </s:fielderror>
		</td>
 
		</tr>
		
		<tr>
		<td>Number of people </td>
		<td><input type="text" name="numberofpeople" maxlength="30"/>
		</td>
		
		<td> 
			<s:fielderror cssStyle="color: red">
	           <s:param>numberofpeople</s:param>
	        </s:fielderror>
		</td>
		</tr>
		
		
		<tr>
		<td>Customer Name </td>
		<td><input type="text" name="customername" maxlength="30"/>
		</td>
		
		<td> 
			<s:fielderror cssStyle="color: red">
	           <s:param>customername</s:param>
	        </s:fielderror>
		</td>
		</tr>
		 
		 
<!-- 	<tr>
		<td colspan="5" align="right" >
		<a href="editprofile.jsp"><input type="button" value="Edit" class = "profile">
		</td>
		</tr>
		  -->
		
		<!----- Submit and Reset ------------------------------------------------->
		<tr>
		<td colspan="2" align="center" >
		
		<input type="submit" value="Submit" class = "profile">
		</td>
		</tr>
		</table>
		 
		</form>
		     	
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
