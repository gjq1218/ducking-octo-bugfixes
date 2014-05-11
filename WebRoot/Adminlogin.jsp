<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    
    <title>Administration Login Page</title>
    
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
          $( ".block1" ).mouseover(function() {
            $(this).addClass( "blur" );
          });
          $( ".block1" ).mouseout(function() {
            $(this).removeClass( "blur" );
          });
          $().UItoTop({ easingType: 'easeOutQuart' });
        }); 
     </script>
 
	   <% session.removeAttribute("currentuser");
       session.removeAttribute("currentorder");
       session.removeAttribute("memunum"); 
       session.removeAttribute("currentshopadmin");%>
      <%
        session.setMaxInactiveInterval(120);    
      %>
 
     </head>
     <body class="page1">

<!--==============================header=================================-->
 <header> 
  <div class="container_12">
   <div class="grid_12"> 
   <%@ include file="Social.jsp" %>
	
    
    <div class="menu_block">


    <nav id="bt-menu" class="bt-menu">
        <a href="#" class="bt-menu-trigger"><span>Menu</span></a>
        <ul>
         <li class="bt-icon"><a href="index.jsp">Home</a></li>
         <li class="bt-icon"><a href="About.jsp">About</a></li>
         <li class="bt-icon"><a href="Menu.jsp">Menu</a></li>
         <li class="current bt-icon "><a href="Sign_in.jsp">Sign In</a>
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
	    
	    <h3>Administrator Sign In</h3>
	   
		 <div class="Adminlogin_form">
              <h4>Administrator sign in here.</h4>
                <div class="form_subtitle">login into your account</div>
                 <form name="register" action="AdminLogin" method="post">  
                    
                    <s:fielderror cssStyle="color: red">
                        <s:param>admin_login</s:param>
                    </s:fielderror> 
                    
                    <div class="form_row">
                    <label class="contact"><strong>AdminID:</strong></label>
                    <input type="text" class="contact_input" name="adminid" />
                    <s:fielderror cssStyle="color: red">
                        <s:param>adminid</s:param>
                    </s:fielderror>
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>Password:</strong></label>
                    <input type="password" class="contact_input" name="adminpassword"/>
                    <s:fielderror cssStyle="color: red">
                        <s:param>adminpassword</s:param>
                    </s:fielderror>
                    </div>                     

                    <!--<div class="form_row">
                        <div class="terms">
                        <input type="checkbox" name="terms" />
                        Remember me
                        </div>
                    </div>-->
                    
                    <div class="form_row">
                     <s:submit cssClass="register" value="Login" /> 
                    </div>    
                    
                  </form>     
                    
                </div>  
	  </div>
	
	</div>
 

  </body>


<!--==============================footer=================================-->

<footer>    
  <div class="container_12">
    <div class="grid_6 prefix_3">
      <a href="index.jsp" class="f_logo"><img src="images/f_logo.png" alt=""></a>
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