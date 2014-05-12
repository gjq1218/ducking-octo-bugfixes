package Actions;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Random;


import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;


import Data.Menu;
import Data.MenuDAO;
import Data.Order;
import Data.OrderDAO;
import Data.OrderMenu;
import Data.OrderMenuDAO;
import Data.OrderMenuId;
import Data.Shop;
import Data.ShopDAO;
import Data.User;
import Data.UserOrder;
import Data.UserOrderDAO;
import Data.UserOrderId;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Buyneworder extends ActionSupport{

	private static final long serialVersionUID = -1426451444929183937L;

	
public String buysomething(String something) throws ParseException{
	 if(!ActionContext.getContext().getSession().containsKey("currentuser"))
		 return INPUT;
	 
	 ApplicationContext factory=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	 OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
	 MenuDAO menuDAO = (MenuDAO) factory.getBean("MenuDAO");
	 OrderMenuDAO ordermenuDAO = (OrderMenuDAO) factory.getBean("OrderMenuDAO");
	 UserOrderDAO userorderDAO = (UserOrderDAO) factory.getBean("UserOrderDAO");
	 ShopDAO shopDAO = (ShopDAO) factory.getBean("ShopDAO");

	 
	   List<Menu> thisitem = menuDAO.findByItemName(something);
	   Menu thisone = thisitem.get(0);
	   
		 User currentuser = (User)ActionContext.getContext().getSession().get("currentuser");
		 
	 	 
		 Order currentorder;
	 

	 //if we already have currentorder, then this currentorder has been saved in the session.
	 if(ActionContext.getContext().getSession().containsKey("currentorder"))
	 {
		 currentorder = (Order) ActionContext.getContext().getSession().get("currentorder");
		 OrderMenuId checkiterm = new OrderMenuId(currentorder,thisone);
		 // can't buy twice.
		 if( ordermenuDAO.findById(checkiterm)!= null)
		 {
			 return "fail";
		 }
	 }
	 else
	 {
	
	   currentorder = new Order();

	   Random randomgenerator = new Random();
	   boolean isPossible = false;
	   String possibleid = null;
	   while(!isPossible)
	   {
	       possibleid = String.valueOf(Math.abs(randomgenerator.nextInt()));
	       if(orderDAO.findById(possibleid) == null)
	    	   isPossible = true;
	   }
	   
	   
	   currentorder.setOrderId(possibleid);
	   currentorder.setType("current");
	   currentorder.setOverallPrice(0.0);
	   currentorder.setDeliveryAddress("not known");
	   List<Shop> defaultshopllist = shopDAO.findByShopName("undetermined");
	   currentorder.setShop(defaultshopllist.get(0));
	   
	   //set default time
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date testdate = new Date();
		Date date = dateFormat.parse(dateFormat.format(testdate));
		Timestamp currenttime = new java.sql.Timestamp(date.getTime());
	   
		currentorder.setTime(currenttime);
	   
	    orderDAO.save(currentorder);
	    ActionContext.getContext().getSession().put("menunumber", 0);
	 }
	   
	   
	   OrderMenuId thisordermenuID = new OrderMenuId(currentorder,thisone);
	   OrderMenu thisordermenu = new OrderMenu(thisordermenuID);
	   
	   UserOrderId thisuserorderid = new UserOrderId(currentuser,currentorder);
	   UserOrder thisuserorder = new UserOrder(thisuserorderid);
	   
	   Double currentorderprice = currentorder.getOverallPrice() + thisone.getPrice();
	   currentorder.setOverallPrice(currentorderprice);
			   
	   
	   ordermenuDAO.save(thisordermenu);
	   
	   if(userorderDAO.findById(thisuserorderid) == null)
	         userorderDAO.save(thisuserorder);
	   
	   
	   orderDAO.update(currentorder);
	   
	   ActionContext.getContext().getSession().put("currentuser", currentuser);
	   ActionContext.getContext().getSession().put("currentorder", currentorder);
	   int menunum = (Integer) ActionContext.getContext().getSession().get("menunumber") + 1;
	   ActionContext.getContext().getSession().put("menunumber",menunum);
	 
	 return SUCCESS;
   }

   public String buyTomatoSoupHotPot() throws Exception{
	   	      
	   return buysomething("Tomato Soup Hot Pot");
   }
   
   public String buyChickenSoupHotPot() throws Exception{
	      
	   return buysomething("Chicken Soup Hot Pot");
   }
   
   public String buyDoubleFlavorHotPot() throws Exception{
	      
	   return buysomething("Double Flavor Hot Pot");
   }
   
   
   public String buyMushroomSoupHotPot() throws Exception{
	      
	   return buysomething("Mushroom Soup Hot Pot");
   }
   
   public String buySichuanSpicyHotPot() throws Exception{
	      
	   return buysomething("Sichuan Spicy Hot Pot");
   }
   
   public String buySeafoodHotPot() throws Exception{
	      
	   return buysomething("Seafood Hot Pot");
   }

   public String buyCrispyChicken() throws Exception{
	      
	   return buysomething("Crispy Chicken");
   }

      public String buyDuckGizzards() throws Exception{
	      
	   return buysomething("Duck Gizzards");
   }

      public String buyHomemadeTofu() throws Exception{
	      
	   return buysomething("Homemade Tofu");
   }

      public String buyHomestyleBeef() throws Exception{
	      
	   return buysomething("Homestyle Beef");
   }

      public String buyMiniSausages() throws Exception{
	      
	   return buysomething("Mini Sausages");
   }

      public String buyMuttonSlices() throws Exception{
	      
	   return buysomething("Mutton Slices");
   }

      public String buySelectBeef() throws Exception{
	      
	   return buysomething("Select Beef");
   }

      public String buyUSBeefSlices() throws Exception{
	      
	   return buysomething("U.S Beef Slices");
   }

      public String buyLuncheonMeat() throws Exception{
	      
	   return buysomething("Luncheon Meat");
   }

      public String buyBlackAngusBeef() throws Exception{
	      
	   return buysomething("Black Angus Beef");
   }

      public String buyGreenBambooShoot() throws Exception{
	      
	   return buysomething("Green Bamboo Shoot");
   }

      public String buyChineseCabbage() throws Exception{
	      
	   return buysomething("Chinese Cabbage");
   }

      public String buySweetCorn() throws Exception{
	      
	   return buysomething("Sweet Corn");
   }

      public String buyLettuce() throws Exception{
	      
	   return buysomething("Lettuce");
   }

      public String buySpinach() throws Exception{
	      
	   return buysomething("Spinach");
   }

      public String buySweetPotatoes() throws Exception{
	      
	   return buysomething("Sweet Potatoes");
   }

      public String buyWhiteTurnips() throws Exception{
	      
	   return buysomething("White Turnips");
   }

      public String buyWinterMelon() throws Exception{
	      
	   return buysomething("Winter Melon");
   }

      public String buyWhiteBambooShoots() throws Exception{
	      
	   return buysomething("White Bamboo Shoots");
   }

      public String buyBeechMushrooms() throws Exception{
	      
	   return buysomething("Beech Mushrooms");
   }

      public String buyBlackFungus() throws Exception{
	      
	   return buysomething("Black Fungus");
   }

      public String buyOysterMushrooms() throws Exception{
	      
	   return buysomething("Oyster Mushrooms");
   }

      public String buyShitakeMushrooms() throws Exception{
	      
	   return buysomething("Shitake Mushrooms");
   }

         public String buyGoldenNeedles() throws Exception{
	      
	   return buysomething("Golden Needles");
   }
         public String buySlicedBeanCurd() throws Exception{
	      
	   return buysomething("Sliced Bean Curd");
   }

         public String buyFreshTofu() throws Exception{
	      
	   return buysomething("Fresh Tofu");
   }
         public String buySpecialFreshTofu() throws Exception{
	      
	   return buysomething("Special Fresh Tofu");
   }
         public String buyFrozenTofu() throws Exception{
	      
	   return buysomething("Frozen Tofu");
   }
   
     public String buySlicesTofuSkin() throws Exception{
	      
	   return buysomething("Slices Tofu Skin");
   }
         public String buyBeefBalls() throws Exception{
	      
	   return buysomething("Beef Balls");
   }
         public String buyCuttlefishCakes() throws Exception{
	      
	   return buysomething("Cuttlefish Cakes");
   }
         public String buyFreshScallops() throws Exception{
	      
	   return buysomething("Fresh Scallops");
   }
         public String buyHandmadeMashedBeef() throws Exception{
	      
	   return buysomething("Handmade Mashed Beef");
   }
         public String buyMashedShrimp() throws Exception{
	      
	   return buysomething("Mashed Shrimp");
   }
         public String buyHandmadeShrimpCakes() throws Exception{
	      
	   return buysomething("Handmade Shrimp Cakes");
   }
         public String buyFreshClams() throws Exception{
	      
	   return buysomething("Fresh Clams");
   }
         public String buyGlodPomfret() throws Exception{
	      
	   return buysomething("Glod Pomfret");
   }
         public String buyGreenMussel() throws Exception{
	      
	   return buysomething("Green Mussel");
   }
         public String buyScallops() throws Exception{
	      
	   return buysomething("Scallops");
   }
         public String buySeaPrawns() throws Exception{
	      
	   return buysomething("Sea Prawns");
   }
         public String buyFreshMeetDumplings() throws Exception{
	      
	   return buysomething("Fresh Meet Dumplings");
   }
         public String buyStreamedandFriedBread() throws Exception{
	      
	   return buysomething("Streamed and Fried Bread");
   }
         public String buyStickyRiceBalls() throws Exception{
	      
	   return buysomething("Sticky Rice Balls");
   }
         public String buyHotSpicyRiceNoodles() throws Exception{
	      
	   return buysomething("Hot-Spicy Rice Noodles");
   }
         public String buyStickyRiceWithBlack() throws Exception{
	      
	   return buysomething("Sticky Rice With Black");
   }
         public String buyXiaoLongBao() throws Exception{
	      
	   return buysomething("Xiao Long Bao");
   }

   public String buySzechuanColdNoodles() throws Exception{
	      
	   return buysomething("Szechuan Cold Noodles");
   }

   public String buyStrawbeeryLceKacang() throws Exception{
	      
	   return buysomething("Strawbeery Lce Kacang");
   }

   public String buyDurainLceKacang() throws Exception{
	      
	   return buysomething("Durain Lce Kacang");
   }

   public String buyGreenteaLceKacang() throws Exception{
	      
	   return buysomething("Greentea Lce Kacang");
   }

   public String buySweetTofuPudding() throws Exception{
	      
	   return buysomething("Sweet Tofu Pudding");
   }

   public String buyMangoPudding() throws Exception{
	      
	   return buysomething("Mango Pudding");
   }

   public String buyAussireseBlanc() throws Exception{
	      
	   return buysomething("Aussirese Blanc");
   }

   public String buyAruma2011() throws Exception{
	      
	   return buysomething("Aruma 2011");
   }

   public String buyCarlsberg() throws Exception{
	      
	   return buysomething("Carlsberg");
   }

   public String buyLosVascosChardonnay() throws Exception{
	      
	   return buysomething("Los Vascos Chardonnay");
   }

   public String buySelfSeasoning() throws Exception{
	      
	   return buysomething("Self-Seasoning");
   }

   public String execute() throws Exception { 
	   
	   return SUCCESS;
	   
   }  
     

}

