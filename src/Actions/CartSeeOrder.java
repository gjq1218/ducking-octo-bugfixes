package Actions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import Data.OrderMenuDAO;
import Data.User;
import Data.UserDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CartSeeOrder extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7285875848675926187L;
	String orderid;
	List<Menu> thisordermenu;

	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public List<Menu> getThisordermenu() {
		return thisordermenu;
	}
	public void setThisordermenu(List<Menu> thisordermenu) {
		this.thisordermenu = thisordermenu;
	}
	/**
	 * 
	 */

public String execute() throws Exception { 
	//the session is expired, you should login again.
	if (!ActionContext.getContext().getSession().containsKey("currentuser"))
		return INPUT;   
    //System.out.println(orderid);
	  ApplicationContext factory=new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
      OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
      OrderMenuDAO ordermenuDAO = (OrderMenuDAO) factory.getBean("OrderMenuDAO");
      MenuDAO menuDAO = (MenuDAO) factory.getBean("MenuDAO");
      
      Order newcurrentorder = orderDAO.findById(orderid);
      ActionContext.getContext().getSession().put("currentorder", newcurrentorder);
      

      thisordermenu = ordermenuDAO.findByOrder(newcurrentorder);
      List<Menu> finallist = new ArrayList<Menu>();
      
      for (Menu notitem:thisordermenu)
      {
    	  Menu realitem = menuDAO.findById(notitem.getMenuId());
    	  finallist.add(realitem);
    	  
      }
      
      thisordermenu = finallist;
      ActionContext.getContext().getSession().put("menunumber", thisordermenu.size());
      
	   return "success";

   }  
     

}

