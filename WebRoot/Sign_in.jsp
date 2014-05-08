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
    <div class="grid_6">
    <h3>My Account</h3>
   
    
             <div class="contact_form">
              <h4>If you have registered in our system, please sign in here.</h4>
                <div class="form_subtitle">login into your account</div>
                 <form name="register" action="UserLogin" method="post">  
                    <s:fielderror cssStyle="color: red">
                        <s:param>login</s:param>
                    </s:fielderror>        
                    <div class="form_row">
                    <label class="contact"><strong>Email:</strong></label>
                    <input type="text" class="contact_input" name="email" />
                    <s:fielderror cssStyle="color: red">
                        <s:param>email</s:param>
                    </s:fielderror>
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>Password:</strong></label>
                    <input type="password" class="contact_input" name="password"/>
                     <s:fielderror cssStyle="color: red">
                        <s:param>password</s:param>
                    </s:fielderror>
                    </div>                     

                    <!--<div class="form_row">
                        <div class="terms">
                        <input type="checkbox" name="terms" />
                        Remember me
                        </div>
                    </div>-->
                    
                    <div class="form_row">
                    <s:submit name="action:UserLogin" cssClass="register" value="Login" />
                    </div>    
                    
                  </form>     
                    
                </div>  
    
    
  </div>

    <div class="grid_6">
      <h3>Register</h3>
      
      
             <div class="contact_form">
              <h4>If you are new to our system, please register here.</h4>
                <div class="form_subtitle">Register your account</div>
                 <form name="register" action="UserRegistration" method="post">          
                    <div class="form_row">
                    <label class="contact"><strong>Username:</strong></label>
                    <input name="regisusername" type="text" class="contact_input" />
                    <s:fielderror cssStyle="color: red">
                        <s:param>regisusername</s:param>
                    </s:fielderror>
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>Password:</strong></label>
                    <input name="regispassword" type="password" class="contact_input" />
                    <s:fielderror cssStyle="color: red">
                        <s:param>regispassword</s:param>
                    </s:fielderror>
                    </div>                     
	
					<div class="form_row">
                    <label class="contact"><strong>E-mail:</strong></label>
                    <input name="regisemail" type="text" class="contact_input" />
                     <s:fielderror cssStyle="color: red">
                        <s:param>regisemail</s:param>
                    </s:fielderror>
                    </div>  
                    
                    <div class="form_row">
                    <s:submit name="action:UserRegistration" cssClass="register" value="Register" />
                    </div>    
                    
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
</body>
</html>