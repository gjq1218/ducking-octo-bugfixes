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
     <% if(session.getAttribute("currentuser") == null) {%>
      <script>
            alert("Session expired, please re-Login!");
            window.location = "Sign_in.jsp";    
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
<%@include file = "Leftbar.jsp" %>

<div class = "grid_14">   
  	
     	<h2>Your Order Details</h2>
     	
     	 <div class="profile_form">
            <div class="form_subtitle">Order:<s:property value = "thisorder.getOrderId()"/></div>
        
 	
 	    
		<table> 
		<tr>
		    <td align = "center">		   
		      Order Status:<br>
		      <s:property value = "thisorder.getType()"/>
		    </td>
		</tr>
		<tr>
		<td align = "center">
		   <b>Menu ID</b>
		</td>
		<td align = "center">
           <b>Name</b>
        </td>
        <td align = "center">
           <b>Category</b>
        </td>
        <td  align = "center">
           <b>Price</b>
         </td>
         <td  align = "center">
         </td>
		</tr>
	  <s:iterator id="h" value="thisordermenu" status = "rowstatus">
		<tr>
		<td align = "center" >
		<s:a>
		   <s:property value="#h.getMenuId()"/>
 		</s:a>
		</td>
		<td align = "center">
           <s:property value="#h.getItemName()"/>	
        </td>
        <td align = "center">
           <s:property value="#h.getCategory()"/>
        </td>
        <td  align = "center">
           <s:property value="#h.getPrice().toString()"/>
         </td>
		</tr>
        
		</s:iterator>
		<tr>
		   <td>
		   </td>
		   <td>
		   </td>
		   <td>
		   </td>
		   <td>		   
		      Overall Price:  <s:property value = "thisorder.getOverallPrice()"/>
		    </td>
		</tr>
	    <tr>
		   <td>
		   
		   </td>
		   <td>
		   </td>
		   <td>
		   </td>
		   <td align = "right">
		   
		   </td>
		</tr>
	    <tr>
		<td colspan="5" align="right" >
		  <s:a href="CancelOldOrder.action?orderid=%{thisorder.getOrderId()}">
		     <input type="button" value="Cancel Order" class = "profile"></s:a>
		</td>
		</tr>
	   <tr>
	    
		<td colspan="5" align="right" >
		  <a href="Vieworder.jsp"><input type="button" value="Return" class = "profile"></a>
		</td>
		</tr>
	    <tr>
	    
	
	    </tr>
		</table>
		
		 <div style = "color:red" align = "right">
	       <b>(Notice: Order cannot be canceled if it is "closed" or "submit cancellation")</b>
	     </div>    	
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