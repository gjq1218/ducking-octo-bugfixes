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

	/**
	 * 
	 */

public String execute() throws Exception { 
	//the session is expired, you should login again.
	if (!ActionContext.getContext().getSession().containsKey("currentuser"))
		return INPUT;   
	
	//System.out.println(neweditaddress);
	  Resource res =new FileSystemResource("/Users/haoyuanji/Workspaces2/MyEclipse 10/ShopSystem/src/applicationContext.xml");
      BeanFactory factory = new XmlBeanFactory(res); 
      OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
     
      Order currentorder = (Order) ActionContext.getContext().getSession().get("currentorder");
      Order thisorder = orderDAO.findById(currentorder.getOrderId());
      
      thisorder.setDeliveryAddress(neweditaddress);
      thisorder.setType("active");
      
      orderDAO.update(thisorder);
   
	   return "success";

   }  
     

}

