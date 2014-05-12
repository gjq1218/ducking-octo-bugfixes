<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
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
      <% if(session.getAttribute("currentuser") == null) {%>
      <script>
            alert("Session expired, please re-Login!");
            window.location = "Sign_in.jsp";    
      </script>
     <%} %>
     <style type="text/css">

/* h3{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; color:SlateBlue;
text-align: center; text-decoration: underline }
table{font-family: Calibri; color:white; font-size: 11pt; font-style: normal;
text-align:; background-color: SlateBlue; border-collapse: collapse; border: 2px solid navy}
table.inner{border: 0px} */
</style>
    
         
    
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
          <li class="bt-icon "><a href="Sign_in.jsp">About</a></li>
         <li class="bt-icon"><a href="Menu.jsp">Menu</a></li>
        
             <% if(session.getAttribute("currentuser")==null) {%>
                  <li class="bt-icon"><a href="Sign_in.jsp">Sign In</a></li>
             <%}else{%>
                  <li class="current bt-icon"><a href="Profile.jsp">My Profile</a></li>
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
<!-- ======== Profile ================== -->
	<%@ include file="Leftbar.jsp" %>
     <div class = "grid_14">   
  	
    <!--  	<h3>View your Profile here.</h3> -->
     	<h2></h2>
     	 <div class="profile_form">
              <h4>You can edit your profile here.</h4>
                <div class="form_subtitle">Check Out Your Order</div>
        
     	
         <form name="profile" action = "CheckOut">
 	
 	
		<table> 
		
		
	  
		<tr>
		<td>OrderID</td>
		<td>
        <s:property value="#session.currentorder.getOrderId()"/>			
		</td>
		</tr>

		 
		<tr>
		<td>Shop Name</td>
		<td>
		<s:fielderror cssStyle = "color:red">
		  <s:param>restaurant_name</s:param>
		</s:fielderror>
		<select name="restaurant_name" id="restaurant_name">
		<option value="-1">Locations:</option>
		<option value="Baltimore">Baltimore</option>
		<option value="Beijing">Beijing</option>
		<option value="New York">New York</option>
		<option value="San Francisco">San Francisco</option>	
		</select>
				

		</td>
		</tr>
 
        
		<tr>
		<td>Order Time</td>
        <td><s:property value="#session.currentorder.getTime().toString()"/>		
		</tr>
 
 
		<!----- Address ---------------------------------------------------------->
		<tr>
		<td>Delivery Address <br /><br /><br /></td>
		<td>
	    <s:fielderror cssStyle = "color:red">
		  <s:param>neweditaddress</s:param>
		</s:fielderror>
		<textarea name="neweditaddress" rows="4" cols="30">${session.currentuser.userAddress}</textarea></td>
		</tr>
 
		
		<!----- Credit ---------------------------------------------------------->
		<tr>
		<td>Overall Price</td>
		<td>$<s:property value="#session.currentorder.getOverallPrice().toString()"/>
		</td>
		</tr>	 
		
		<!----- Submit and Reset ------------------------------------------------->
		<tr>
		<td colspan="5" align="right" >
		<input type="Submit" value="Submit" class = "profile">
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
