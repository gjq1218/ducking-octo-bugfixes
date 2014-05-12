package Actions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;


import Data.Menu;
import Data.Order;
import Data.OrderDAO;
import Data.OrderMenuDAO;
import Data.User;
import Data.UserDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ContinueShopping extends ActionSupport{

	String orderid;
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	/**
	 * 
	 */

public String execute() throws Exception { 
	//the session is expired, you should login again.
	if (!ActionContext.getContext().getSession().containsKey("currentuser"))
		return INPUT;   
    
	  Resource res =new FileSystemResource("/Users/haoyuanji/Workspaces2/MyEclipse 10/ShopSystem/src/applicationContext.xml");
      BeanFactory factory = new XmlBeanFactory(res); 
      OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
      OrderMenuDAO ordermenuDAO = (OrderMenuDAO) factory.getBean("OrderMenuDAO");

      
      Order newcurrentorder = orderDAO.findById(orderid);
      ActionContext.getContext().getSession().put("currentorder", newcurrentorder);

      List<Menu> thisordermenu = ordermenuDAO.findByOrder(newcurrentorder);
      ActionContext.getContext().getSession().put("menunumber", thisordermenu.size());
      
	   return "success";

   }  
     

}

