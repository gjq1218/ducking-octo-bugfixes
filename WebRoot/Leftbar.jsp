<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
   <div class ="grid_13">
   	<div class = "welcome">
      <h2>Welcome, <s:property value="#session.currentuser.getUserName()"/></h2>
      <!--  <p class="col1 pad1">Magna non nunc tristique</p> -->
       
       <ul class="list2">
        <li><a href="Profile.jsp">View your Profile</a></li>
        <li><a href="Makereservation.jsp">Make Reservation</a></li>
        <li><a href="NewOrderBuffer.jsp">Make New Order</a></li>
        <li><a href="Viewreservation.jsp">View your Reservation</a></li>
        <li><a href="Viewcurrentcart.jsp">View your Cart</a></li>
        <li><a href="Vieworder.jsp">View your Order </a></li>
        <li><a href="Changepassword.jsp">Change Password </a></li>
        <li><a href="Sign_in.jsp"><u>Sign out</u></a></li>
      
      </ul>
      </div>
      </div>
