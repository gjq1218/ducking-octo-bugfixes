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
import Data.OrderMenuId;
import Data.User;
import Data.UserDAO;
import Data.UserOrder;
import Data.UserOrderDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Deletemenu extends ActionSupport{

   String menuid;


	public String getMenuid() {
	return menuid;
   }

   public void setMenuid(String menuid) {
	this.menuid = menuid;
   }

	/**
	 * 
	 */

public String execute() throws Exception { 
	//the session is expired, you should login again.
	if (!ActionContext.getContext().getSession().containsKey("currentuser"))
		return INPUT;   
	

	  Resource res =new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
      BeanFactory factory = new XmlBeanFactory(res); 
      OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
      MenuDAO menuDAO = (MenuDAO) factory.getBean("MenuDAO");
      OrderMenuDAO ordermenuDAO = (OrderMenuDAO) factory.getBean("OrderMenuDAO");
     
      Order currentorder = (Order) ActionContext.getContext().getSession().get("currentorder");
      Order thisorder = orderDAO.findById(currentorder.getOrderId());
     
      
      Menu thismenu = menuDAO.findById(menuid);
      
      Double newoverallprice = thisorder.getOverallPrice() - thismenu.getPrice();
      thisorder.setOverallPrice(newoverallprice);
      orderDAO.update(thisorder);
      
      OrderMenuId newordermenuid = new OrderMenuId(thisorder,thismenu);
      
      OrderMenu needtodelete = ordermenuDAO.findById(newordermenuid);
      ordermenuDAO.delete(needtodelete);
   
	   return "success";

   }  
     

}

