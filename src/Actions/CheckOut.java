package Actions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;


import Data.Menu;
import Data.MenuDAO;
import Data.Order;
import Data.OrderDAO;
import Data.OrderMenu;
import Data.OrderMenuDAO;
import Data.Shop;
import Data.ShopDAO;
import Data.User;
import Data.UserDAO;
import Data.UserOrder;
import Data.UserOrderDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CheckOut extends ActionSupport{

	public String getNeweditaddress() {
		return neweditaddress;
	}

	public void setNeweditaddress(String neweditaddress) {
		this.neweditaddress = neweditaddress;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 7285875848675926187L;
    String neweditaddress;
    String restaurant_name;
	public String getRestaurant_name() {
		return restaurant_name;
	}

	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}

	/**
	 * 
	 */

public String execute() throws Exception { 
	//the session is expired, you should login again.
	if (!ActionContext.getContext().getSession().containsKey("currentuser"))
		return INPUT;   
	
	if(this.neweditaddress == null || "".equals(neweditaddress.trim()) || "not known".equals(neweditaddress.trim()))
	{
		this.addFieldError("neweditaddress", "Delivery Address Cannot be Empty!");
		return "fail";
	}
	
	if(this.restaurant_name == null || "-1".equals(restaurant_name.trim()))
	{
		this.addFieldError("restaurant_name", "Restaurant name Cannot be Empty!");
		return "fail";
	}
	
	//System.out.println(neweditaddress);
	  Resource res =new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
      BeanFactory factory = new XmlBeanFactory(res); 
      OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
      ShopDAO shopDAO = (ShopDAO) factory.getBean("ShopDAO");
     
      Order currentorder = (Order) ActionContext.getContext().getSession().get("currentorder");
      Order thisorder = orderDAO.findById(currentorder.getOrderId());
      
      thisorder.setDeliveryAddress(neweditaddress);
      thisorder.setType("active");
      List<Shop> newshop = shopDAO.findByShopName(restaurant_name);
      thisorder.setShop(newshop.get(0));
      
      orderDAO.update(thisorder);
   
	   return "success";

   }  
     

}

