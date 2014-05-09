<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

   <div class ="grid_13">
   	<div class = "welcome">
      <h2>Welcome, <s:property value="#session.currentuser.getUserName()"/></h2>
      <!--  <p class="col1 pad1">Magna non nunc tristique</p> -->
       
       <ul class="list2">
        <li><a href="Profile.jsp">View your profile</a></li>
        <li><a href="#">View your cart</a></li>
        <li><a href="#">View your order </a></li>
        <li><a href="Makereservation.jsp">Make Reservation</a></li>
        <li><a href="Changepassword.jsp">Change password </a></li>
        <li><a href="Sign out"><u>Sign out</u></a></li>
      
      </ul>
      </div>
      </div>
