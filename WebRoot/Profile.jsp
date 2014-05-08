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
          <li class="current bt-icon "><a href="About.jsp">About</a></li>
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

  <div class="container_12">
<!-- ======== left side bar ================== -->
	<%@ include file="Leftbar.jsp" %>
     <div class = "grid_14">   
  	
     	<h3>My Profile</h3>
     	
     	 <div class="profile_form">
              <h4>If you haven't fill your profile, please edit here.</h4>
                <div class="form_subtitle">View your profile.</div>
        
     	
         <form name="profile">
 	
 	
		<table> 
		
		<!----- Username ---------------------------------------------------------->
		
	  
		<tr>
		<td>Username</td>
		<td><input type="text" name="user_name" maxlength="30"/>
		(max 30 characters a-z and A-Z)
		</td>
		</tr>

		 
		
		<!----- Date Of Birth -------------------------------------------------------->
		<!-- <tr>
		<td>Date of Birth</td>
		 
		<td>
		<select name="birthday_day" id="birthday_Day">
		<option value="-1">Day:</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		 
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
		 
		<option value="13">13</option>
		<option value="14">14</option>
		<option value="15">15</option>
		<option value="16">16</option>
		<option value="17">17</option>
		<option value="18">18</option>
		<option value="19">19</option>
		<option value="20">20</option>
		<option value="21">21</option>
		 
		<option value="22">22</option>
		<option value="23">23</option>
		<option value="24">24</option>
		<option value="25">25</option>
		<option value="26">26</option>
		<option value="27">27</option>
		<option value="28">28</option>
		<option value="29">29</option>
		<option value="30">30</option>
		 
		<option value="31">31</option>
		</select>
 
		<select id="birthday_Month" name="birthday_Month">
		<option value="-1">Month:</option>
		<option value="January">Jan</option>
		<option value="February">Feb</option>
		<option value="March">Mar</option>
		<option value="April">Apr</option>
		<option value="May">May</option>
		<option value="June">Jun</option>
		<option value="July">Jul</option>
		<option value="August">Aug</option>
		<option value="September">Sep</option>
		<option value="October">Oct</option>
		<option value="November">Nov</option>
		<option value="December">Dec</option>
		</select>
		 
		<select name="Birthday_Year" id="Birthday_Year">
		 
		<option value="-1">Year:</option>
		<option value="2012">2012</option>
		<option value="2011">2011</option>
		<option value="2010">2010</option>
		<option value="2009">2009</option>
		<option value="2008">2008</option>
		<option value="2007">2007</option>
		<option value="2006">2006</option>
		<option value="2005">2005</option>
		<option value="2004">2004</option>
		<option value="2003">2003</option>
		<option value="2002">2002</option>
		<option value="2001">2001</option>
		<option value="2000">2000</option>
		 
		<option value="1999">1999</option>
		<option value="1998">1998</option>
		<option value="1997">1997</option>
		<option value="1996">1996</option>
		<option value="1995">1995</option>
		<option value="1994">1994</option>
		<option value="1993">1993</option>
		<option value="1992">1992</option>
		<option value="1991">1991</option>
		<option value="1990">1990</option>
		 
		<option value="1989">1989</option>
		<option value="1988">1988</option>
		<option value="1987">1987</option>
		<option value="1986">1986</option>
		<option value="1985">1985</option>
		<option value="1984">1984</option>
		<option value="1983">1983</option>
		<option value="1982">1982</option>
		<option value="1981">1981</option>
		<option value="1980">1980</option>
		</select>
		</td>
		</tr> -->
		 
		<!----- Email Address ---------------------------------------------------------->
		<tr>
		<td>Email Address</td>
		<td><input type="text" name="email_id" maxlength="100" readonly="readonly" /></td>
		</tr>
 
		<!----- Phone Number ---------------------------------------------------------->
		<tr>
		<td>Phone Number</td>
		<td>
		<input type="text" name="phone_number" maxlength="10" />
		(10 digit number)
		</td>
		</tr>
 
		<!----- Gender ----------------------------------------------------------->
	<!-- 	<tr>
		<td>Gender</td>
		<td>
		Male <input type="radio" name="Gender" value="Male" />
		Female <input type="radio" name="Gender" value="Female" />
		</td>
		</tr> -->
 
		<!----- Address ---------------------------------------------------------->
		<tr>
		<td>Address <br /><br /><br /></td>
		<td><textarea name="address" rows="4" cols="30"></textarea></td>
		</tr>
 
		<!----- City ---------------------------------------------------------->
		<tr>
		<td>City</td>
		<td><input type="text" name="city" maxlength="30" />
		(max 30 characters a-z and A-Z)
		</td>
		</tr>
 
		<!----- Zip Code ---------------------------------------------------------->
		<tr>
		<td>Zip Code</td>
		<td><input type="text" name="zip_Code" maxlength="6" />
		(6 digit number)
		</td>
		</tr>
 
		<!----- State ---------------------------------------------------------->
		<tr>
		<td>State</td>
		<td><input type="text" name="state" maxlength="30" />
		(max 30 characters a-z and A-Z)
		</td>
		</tr>
 
		<!----- Country ---------------------------------------------------------->
		<tr>
		<td>Country</td>
		<td><input type="text" name="country" value="USA" readonly="readonly" /></td>
		</tr>
 
		
		<!----- Credit ---------------------------------------------------------->
		<tr>
		<td>Credit</td>
		<td><input type="text" name="credit" maxlength="30"/>
		(Your calmulated credits)
		</td>
		</tr>
		 
		<!----- Level ---------------------------------------------------------->
		<tr>
		<td>Level</td>
		<td><input type="text" name="levle" maxlength="30"/>
		(Your current level)
		</td>
		</tr>
		 
		    <!--     <div class="form_row">
                    <input type="submit" class="register" value="Login" />
                    </div>     -->
		 
		
		<!----- Submit and Reset ------------------------------------------------->
		<tr>
		<td colspan="2" align="center" >
		<input type="reset" value="Edit" class = "profile">
		 &nbsp;
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
