<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 

   <div class ="grid_13">
   	<div class = "welcome">
      <h2>Welcome, <s:property value="#session.currentshopadmin.getAdminName()"/></h2>
 
       
       <ul class="list2">
        <li><a href="Adminviewreservation.jsp">View the reservation</a></li>
        <li><a href="#">View the order</a></li>
        <li><a href="#">View the cancellation</a></li>
        <li><a href="#">Change password </a></li>
        <li><a href="Adminlogin.jsp"><u>Sign out</u></a></li>
      
      </ul>
      </div>
      </div>
