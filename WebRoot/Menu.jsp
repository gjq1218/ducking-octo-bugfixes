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
          <li class="bt-icon "><a href="About.jsp">About</a></li>
         <li class="current bt-icon"><a href="Menu.jsp">Menu</a></li>
        
             <% if(session.getAttribute("currentuser")==null) {%>
                  <li class="bt-icon"><a href="Sign_in.jsp">Sign In</a></li>
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
    <div class="grid_12">
      <h3 class="head2">Our Menu</h3>
    </div> 
    <div class = "buy"> 
    <%if(session.getAttribute("currentorder") != null) {%>
      <h2 align = "center" class = "buy"><font color = "red"><a href = "Viewcurrentcart.jsp"><u>My Cart (<s:property value = "#session.menunumber"/>)</u></a></font></h2>
    <%} %>
    </div>
    
    <div class="tabs tb gallery">
             <div class="div-nav  ">
             <div class="grid_12">
                 <ul class="nav" style="height: 40px;">
                 
                    <li class="selected" style= "height:30px"><a href="#tab-1" class="">Soup Base</a></li>
                    <li><a href="#tab-2">Specialty Dishes</a></li>
                    <li><a href="#tab-3">Meat</a></li>
                    <li><a href="#tab-4">Vegetables</a></li>
                    <li><a href="#tab-5">Mushrooms</a></li>
                    <li><a href="#tab-6">Specialty Tofu</a></li>   
               <!--   </ul> 
                 
               <ul class = "nav">  -->
               	
               		<li><a href="#tab-7">Specialty MeatBalls</a></li>
                    <li><a href="#tab-8">Seafood and Shell Food</a></li>
                    <li><a href="#tab-9">Snack</a></li>
                    <li><a href="#tab-10">Dessert</a></li>
                    <li><a href="#tab-11">Beverage and Wine</a></li>
                    <li><a href="#tab-12">Self-Seasoning</a></li>
               </ul> 
                 
                  
             </div>    
             </div>
             
             <div class = "div-tabs">
             
              <div  id="tab-1" class="tab-content gallery1">
                 
                  <div>
                  
                   <s:form cssClass="grid_3" action = "Buyneworder" method = "post">
                    <a href="images/big1.jpg" class="gal"><img src="images/page3_tomatosoup.jpg" alt=""><span></span></a>
                    
                    <div class="col2">
                         <span class="col3"><a href="#">Tomato Soup Hot Pot</a></span> $ 19.99</div>
                    <div>
                     
                         <s:submit align = "center" cssClass="buy" value="Buy" name="method:buyTomatoSoupHotPot"></s:submit>
                    
                    </div>  
                     </s:form>                          
                  </div>
                  
                  <div>
                    <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/big2.jpg" class="gal"><img src="images/page3_chickensoup.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Chicken Soup Hot Pot</a></span> $ 21.99</div>
                    <div class="col2"><span class="col3">
                    <s:submit align = "center" cssClass="buy" value="Buy" name="method:buyChickenSoupHotPot"></s:submit></span></div>
                    </s:form>
                  </div>
                  
                  <div >
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/big3.jpg" class="gal"><img src="images/page3_doublesoup.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Double Flavor Hot Pot </a></span> $ 23.90</div>
                    <div>
                    <s:submit align = "center" cssClass="buy" value="Buy" name="method:buyDoubleFlavorHotPot"></s:submit></div>   
                    </s:form>            
                  </div>
                  
                  <div class="grid_3">
                    <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/big4.jpg" class="gal"><img src="images/page3_mushroomsoup.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Mushroom Soup Hot Pot</a></span> $ 25.30</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyMushroomSoupHotPot"/></div>
                    </s:form>
                  </div>
                  
                  <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/big5.jpg" class="gal"><img src="images/page3_spicysoup.jpg" alt=""><span></span></a>
                    <div class="col2" ><span class="col3"><a href="#">Sichuan Spicy Hot Pot </a></span> $ 15.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySichuanSpicyHotPot"/></div>
                    </s:form>
                  </div>
                  
                  <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/big6.jpg" class="gal"><img src="images/page3_seafoodsoup.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Seafood Hot Pot</a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySeafoodHotPot"/></div>
                   </s:form>
                  </div>
              </div>
              <div  id="tab-2" class="tab-content gallery2">
                 
                  <div class="clear"></div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bCrispy_meat.jpg" class="gal"><img src="images/page3_sCrispy_meat.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Crispy Chicken </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyCrispyChicken"/></div>
                    </s:form>
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bDuck_gizzards.jpg" class="gal"><img src="images/page3_sDuck_gizzards.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Duck Gizzards </a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyDuckGizzards"/></div>
                    </s:form>
                  </div>
                  
                   <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bHomemade_tofu.jpg" class="gal"><img src="images/page3_sHomemade_tofu.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Homemade Tofu </a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyHomemadeTofu"/></div> 
                    </s:form>  
                  </div>
                  
                   <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bHomestyle_beef.jpg" class="gal"><img src="images/page3_sHomestyle_beef.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Homestyle Beef </a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyHomestyleBeef"/></div> 
                    </s:form>  
                  </div>
              </div>
              <div  id="tab-3" class="tab-content gallery3">
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bMini_sausages.jpg" class="gal"><img src="images/page3_sMini_sausages1.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Mini Sausages</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyMiniSausages"/></div>
                    </s:form>   
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bMuttonslices.jpg" class="gal"><img src="images/page3_sMuttonslices2.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Mutton Slices </a></span> $ 21.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyMuttonSlices"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bSelect_beef.jpg" class="gal"><img src="images/page3_sSelect_beef3.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Select Beef </a></span> $ 23.90</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySelectBeef"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bUSbeef.jpg" class="gal"><img src="images/page3_sUSbeef4.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">U.S Beef Slices</a></span> $ 25.30</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyUSBeefSlices"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bLuncheon_meat.jpg" class="gal"><img src="images/page3_sLuncheon_meat5.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Luncheon Meat</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyLuncheonMeat"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/bBlack_angus_beef.jpg" class="gal"><img src="images/page3_sBlack_angus_beef6.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Black Angus Beef</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyBlackAngusBeef"/></div>  
                    </s:form> 
                  </div>
                 
              </div>
              <div  id="tab-4" class="tab-content gallery4">

                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_ve1_bambooshoots.jpg" class="gal"><img src="images/s_ve1_bambooshoots.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Green Bamboo Shoot </a></span> $ 21.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyGreenBambooShoot"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_ve2_cabbage.jpg" class="gal"><img src="images/s_ve2_cabbage.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Chinese Cabbage </a></span> $ 23.90</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyChineseCabbage"/></div>  
                    </s:form> 
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_ve3_corn.jpg" class="gal"><img src="images/s_ve3_corn.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Sweet Corn</a></span> $ 25.30</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySweetCorn"/></div>
                    </s:form>   
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_ve4_lettuce.jpg" class="gal"><img src="images/s_ve4_lettuce.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Lettuce </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyLettuce"/></div>   
                    </s:form>
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_ve5_spinach.jpg" class="gal"><img src="images/s_ve5_spinach.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Spinach</a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySpinach"/></div>  
                    </s:form> 
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_ve6_sweetpotato.jpg" class="gal"><img src="images/s_ve6_sweetpotato.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Sweet Potatoes </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySweetPotatoes"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_ve7_turnip.jpg" class="gal"><img src="images/s_ve7_turnip.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">White Turnips </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyWhiteTurnips"/></div>
                    </s:form>   
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_ve8_wintermelon.jpg" class="gal"><img src="images/s_ve8_wintermelon.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Winter Melon </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyWinterMelon"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_ve9_whitebamboo.jpg" class="gal"><img src="images/s_ve9_whitebamboo.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">White Bamboo Shoots </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyWhiteBambooShoots"/></div> 
                    </s:form>  
                  </div>

              </div>
              <div  id="tab-5" class="tab-content gallery5">
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_mush_beech.jpg" class="gal"><img src="images/s_mush_beech.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Beech Mushrooms</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyBeechMushrooms"/></div>
                    </s:form>   
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_mush_fungus.jpg" class="gal"><img src="images/s_mush_fungus.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Black Fungus </a></span> $ 21.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyBlackFungus"/></div>  
                    </s:form> 
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_mush_oyster.jpg" class="gal"><img src="images/s_mush_oyster.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Oyster Mushrooms </a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyOysterMushrooms"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_mush_shitake.jpg" class="gal"><img src="images/s_mush_shitake.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Shitake Mushrooms </a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyShitakeMushrooms"/></div>
                    </s:form>   
                  </div>
                   <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_mush_needle.jpg" class="gal"><img src="images/s_mush_needle.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Golden Needles </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyGoldenNeedles"/></div>  
                    </s:form> 
                  </div>
              </div>
              <div  id="tab-6" class="tab-content gallery6">
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_t_beantofu.jpg" class="gal"><img src="images/s_t_beantofu.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Sliced Bean Curd</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySlicedBeanCurd"/></div>                   
                    </s:form>   
                  </div>      
                   <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_t_freshtofu.jpg" class="gal"><img src="images/s_t_freshtofu.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Fresh Tofu</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyFreshTofu"/></div> 
                    </s:form>  
                  </div> 
                   <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_t_friedtofu.jpg" class="gal"><img src="images/s_t_friedtofu.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Special Fresh Tofu</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySpecialFreshTofu"/></div> 
                    </s:form>  
                  </div> 
                   <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_t_frozentofu.jpg" class="gal"><img src="images/s_t_frozentofu.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Frozen Tofu</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyFrozenTofu"/></div> 
                    </s:form>  
                  </div>      
                  <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_t_tofuslices.jpg" class="gal"><img src="images/s_t_tofuslices.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Slices Tofu Skin</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySlicesTofuSkin"/></div>  
                    </s:form> 
                  </div>         
              </div>
			  <div  id="tab-7" class="tab-content gallery1">
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_balls_beefballs.jpg" class="gal"><img src="images/s_balls_beefballs.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Beef Balls</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyBeefBalls"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_balls_cuttlefishcake.jpg" class="gal"><img src="images/s_balls_cuttlefishcake.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Cuttlefish Cakes </a></span> $ 21.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyCuttlefishCakes"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_balls_freshscallops.jpg" class="gal"><img src="images/s_balls_freshscallops.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Fresh Scallops </a></span> $ 23.90</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyFreshScallops"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_balls_meshedbeef.jpg" class="gal"><img src="images/s_balls_meshedbeef.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Handmade Mashed Beef</a></span> $ 25.30</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyHandmadeMashedBeef"/></div>  
                    </s:form> 
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_balls_meshedshrimp.jpg" class="gal"><img src="images/s_balls_meshedshrimp.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Mashed Shrimp</a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyMashedShrimp"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_balls_shrimpcake.jpg" class="gal"><img src="images/s_balls_shrimpcake.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Handmade Shrimp Cakes </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyHandmadeShrimpCakes"/></div>
                    </s:form>   
                  </div>
            
              </div>

  			  <div  id="tab-8" class="tab-content gallery1">
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_sea_freshclams.jpg" class="gal"><img src="images/s_sea_freshclams.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Fresh Clams</a></span> $ 19.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:uyFreshClams"/></div>
                    </s:form>   
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_sea_goldpomfret.jpg" class="gal"><img src="images/s_sea_goldpomfret.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Glod Pomfret </a></span> $ 21.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyGlodPomfret"/></div>  
                    </s:form> 
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_sea_mussels.jpg" class="gal"><img src="images/s_sea_mussels.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Green Mussel </a></span> $ 23.90</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyGreenMussel"/></div>  
                    </s:form> 
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_sea_scallops.jpg" class="gal"><img src="images/s_sea_scallops.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Scallops</a></span> $ 25.30</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyScallops"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_sea_seaprawns.jpg" class="gal"><img src="images/s_sea_seaprawns.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Sea Prawns</a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySeaPrawns"/></div>
                    </s:form>   
                  </div>
                  
              </div>
              
              <div  id="tab-9" class="tab-content gallery2">
                 
                  <div class="clear"></div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_snack_dumplings.jpg" class="gal"><img src="images/s_snack_dumplings.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Fresh Meet Dumplings </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyFreshMeetDumplings"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_snack_mantou.jpg" class="gal"><img src="images/s_snack_mantou.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Streamed and Fried Bread</a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyStreamedandFriedBread"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_snack_riceball.jpg" class="gal"><img src="images/s_snack_riceball.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Sticky Rice Balls </a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyStickyRiceBalls"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_snack_spicynoodles.jpg" class="gal"><img src="images/s_snack_spicynoodles.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Hot-Spicy Rice Noodles </a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyHotSpicyRiceNoodles"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_snack_stickyrice.jpg" class="gal"><img src="images/s_snack_stickyrice.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Sticky Rice With Black </a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyStickyRiceWithBlack"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_snack_xiaolongbao.jpg" class="gal"><img src="images/s_snack_xiaolongbao.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Xiao Long Bao</a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyXiaoLongBao"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_snake_spicynoodles.jpg" class="gal"><img src="images/s_snake_spicynoodles.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Szechuan Cold Noodles </a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySzechuanColdNoodles"></s:submit></div>  
                    </s:form> 
                  </div>
              </div>
              <div  id="tab-10" class="tab-content gallery2">
                 
                  <div class="clear"></div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_dessert_strawberry.jpg" class="gal"><img src="images/s_dessert_strawberry.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Strawbeery Lce Kacang </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyStrawbeeryLceKacang"/></div>
                    </s:form>   
                  </div>                  
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_dessert_durian.jpg" class="gal"><img src="images/s_dessert_durian.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Durain Lce Kacang </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyDurainLceKacang"/></div>                   
                    </s:form>   
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_dessert_greentea.jpg" class="gal"><img src="images/s_dessert_greentea.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Greentea Lce Kacang </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyGreenteaLceKacang"/></div>
                    </s:form>   
                  </div>
                  <div class="grid_3">
                   <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_dessert_dofupadding.jpg" class="gal"><img src="images/s_dessert_dofupadding.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Sweet Tofu Pudding </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySweetTofuPudding"/></div>
                    </s:form>   
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_dessert_mangopadding.jpg" class="gal"><img src="images/s_dessert_mangopadding.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Mango Pudding</a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyMangoPudding"/></div> 
                    </s:form>  
                  </div>
              </div>
              
                
              <div  id="tab-11" class="tab-content gallery2">
                 
                  <div class="clear"></div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_wine_aussirese.jpg" class="gal"><img src="images/s_wine_aussirese.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Aussirese Blanc</a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyAussireseBlanc"/></div> 
                    </s:form>  
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_wine_aruma.jpg" class="gal"><img src="images/s_wine_aruma.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Aruma 2011</a></span> $ 20.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyAruma2011"/></div>
                    </s:form>   
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_wine_carlsbreg.jpg" class="gal"><img src="images/s_wine_carlsbreg.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Carlsberg</a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyCarlsberg"/></div>
                    </s:form>    
                  </div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_wine_losvascos.jpg" class="gal"><img src="images/s_wine_losvascos.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Los Vascos Chardonnay</a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buyLosVascosChardonnay"/></div> 
                    </s:form>  
                  </div>
              </div>
                 
              <div  id="tab-12" class="tab-content gallery2">
                 
                  <div class="clear"></div>
                  <div class="grid_3">
                  <s:form cssClass="grid_3" action = "Buyneworder">
                    <a href="images/b_seasoning.jpg" class="gal"><img src="images/s_seasoning.jpg" alt=""><span></span></a>
                    <div class="col2"><span class="col3"><a href="#">Self-Seasoning </a></span> $ 10.99</div>
                    <div><s:submit align = "center" cssClass="buy" value="Buy" name="method:buySelfSeasoning"/></div>
                    </s:form>   
                  </div>
                  
              </div>
             
             </div>
   
        </div>
  </div>
</div>

<!--==============================footer=================================-->

<footer>    
  <div class="container_12">
    <div class="grid_6 prefix_3">
      <a href="index.html" class="f_logo"><img src="images/f_logo.png" alt=""><span></span></a>
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