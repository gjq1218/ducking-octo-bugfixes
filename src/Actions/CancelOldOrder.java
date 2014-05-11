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

public class CancelOldOrder extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7285875848675926187L;
	String orderid;
//	List<Menu> thisordermenu;
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
//	public List<Menu> getThisordermenu() {
//		return thisordermenu;
//	}
//	public void setThisordermenu(List<Menu> thisordermenu) {
//		this.thisordermenu = thisordermenu;
//	}
	/**
	 * 
	 */

public String execute() throws Exception { 
	//the session is expired, you should login again.
	if (!ActionContext.getContext().getSession().containsKey("currentuser"))
		return INPUT;  
	
	//System.out.println(orderid);
	  Resource res =new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
      BeanFactory factory = new XmlBeanFactory(res); 
      OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
      OrderMenuDAO ordermenuDAO = (OrderMenuDAO) factory.getBean("OrderMenuDAO");
      UserOrderDAO userorderDAO = (UserOrderDAO) factory.getBean("UserOrderDAO");
//      MenuDAO menuDAO = (MenuDAO) factory.getBean("MenuDAO");
//      
      Order newcurrentorder = orderDAO.findById(orderid);
      
      // Check if it is OK to delete
      if(newcurrentorder.getType().equals("closed"))
      {
    	  this.addFieldError("cancelstatus", "This order is already closed!");
    	  return "fail";
      }
      
      if(newcurrentorder.getType().equals("submit cancellation"))
      {
    	  this.addFieldError("cancelstatus", "Already submitted!!");
    	  return "fail";
      }
      
      // Delete OrderMenu 
      List<OrderMenu> allordermenu = ordermenuDAO.findAll();
      
      List<OrderMenu> currentordermenu = new ArrayList<OrderMenu>();
      
      for (OrderMenu checkitem:allordermenu)
      {
    	  if(checkitem.getId().getOrder().getOrderId().equals(orderid))
    	  {
    		  currentordermenu.add(checkitem);
    	  }
      }
      for(OrderMenu item:currentordermenu)
      {
    	  ordermenuDAO.delete(item);
      }
      // Delete UserOrder
      List<UserOrder> alluserorder = userorderDAO.findAll();
      
      List<UserOrder> currentuserorder = new ArrayList<UserOrder>();
      
      for (UserOrder checkitem:alluserorder)
      {
    	  if(checkitem.getId().getOrder().getOrderId().equals(orderid))
    	  {
    		  currentuserorder.add(checkitem);
    	  }
      }
      for(UserOrder item:currentuserorder)
      {
    	  userorderDAO.delete(item);
      }
      // Delete Order
      orderDAO.delete(newcurrentorder);
      
      
      ActionContext.getContext().getSession().remove("currentorder");
      ActionContext.getContext().getSession().remove("menunumber");
     
	   return "success";

   }  
     

}

