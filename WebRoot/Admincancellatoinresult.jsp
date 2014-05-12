<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
     <head>
     <title>Sign_in Page</title>
     <meta charset="utf-8">
     <link rel="icon" href="images/favicon.ico">
     <link rel="shortcut icon" href="images/favicon.ico" />
     <link rel="stylesheet" href="css/style.css">
     <script src="js/jquery.js"></script>
     <script src="js/jquery-migrate-1.1.1.js"></script>
     <script src="js/jquery.equalheights.js"></script>
     <script src="js/jquery.ui.totop.js"></script>
     <script src="js/jquery.easing.1.3.js"></script>
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
     <% if(session.getAttribute("currentshopadmin") == null) {%>
      <script>
            alert("Session expired, please re-Login!");
            window.location = "Adminlogin.jsp";    
      </script>
     <%} %>
     </head>
     <body class="page1">

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
          <li class="bt-icon "><a href="Sign_in.jsp">About</a></li>
         <li class="bt-icon"><a href="Menu.jsp">Menu</a></li>
        
             <% if(session.getAttribute("currentshopadmin")==null) {%>
                  <li class="bt-icon"><a href="Adminlogin.jsp">Sign In</a></li>
             <%}else{%>
                  <li class="current bt-icon"><a href="Adminlogin.jsp">Sign Out</a></li>
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
<%@include file = "Adminleftbar.jsp" %>

<div class = "grid_14">   
  	
     	<h2></h2>
     	
     	 <div class="admin_profile_form">
            <div class="form_subtitle">View All Cancellatoin Order History Of <s:property value="allUserReservation.get(0).getId().getOrder().getShop().getShopName()"/> Shop</div>
        
		<table> 
		
		<tr>
		<td>
		   <b>Order ID</b>
		</td>
		<td>
           <b>Shop</b>
        </td>
        <td >
           <b>Order Time</b>
        </td>
        <td>
           <b>Overall Price</b>
         </td>
         <td>
           <b> User ID</b>
           
  
           
         </td>
        
		</tr>
		 <s:iterator id="p" value="allUserOrder">
		
		<tr>
		<td align = "center">
		   <s:property value="#p.getId().getOrder().getOrderId()"/>
		</td>
		<td align = "center">
           <s:property value="#p.getId().getOrder().getShop().getShopName()"/>	
        </td>
        <td align = "center">
           <s:property value="#p.getId().getOrder().getTime().toString()"/>
        </td>
        <td  align = "center">
           <s:property value="#p.getId().getOrder().getOverallPrice()"/>
         </td>
         
         <td  align = "center">
         
           <s:a href = "AdminViewUserCancellation.action?adminviewuserid=%{#p.getId().getUser().getUserId()}">
           <s:property value="#p.getId().getUser().getUserId()"/>
           </s:a>
         </td>
		 <td>	
		 <s:a href = "ApproveCancel.action?approveorderid=%{#p.getId().getOrder().getOrderId()}">
       	 	<span><img src = "./images/pint10.png" alt = "Approve"></span> 
       	 </s:a>
         </td>
         <td> 	
          <s:a href = "DenyCancel.action?denyorderid=%{#p.getId().getOrder().getOrderId()}">
        	<span><img src = "./images/pint11.png" alt = "Cancel"></span> 
        </s:a>	
         </td>
         
        
		</tr>
        
		</s:iterator>
		</table>
		
		     	
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
</body>
</html>