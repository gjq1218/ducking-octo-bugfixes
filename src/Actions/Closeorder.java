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

import Util.LevelCalculation;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Closeorder extends ActionSupport{

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
	if (!ActionContext.getContext().getSession().containsKey("currentshopadmin"))
		return INPUT;   
	

	  Resource res =new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
      BeanFactory factory = new XmlBeanFactory(res); 
      OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
      UserOrderDAO userorderDAO = (UserOrderDAO) factory.getBean("UserOrderDAO");
      UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");

      Order thisorder = orderDAO.findById(orderid);
      thisorder.setType("closed");

      List<UserOrder> alluserorder = userorderDAO.findAll();
      UserOrder thisuserorder = new UserOrder();
      for (UserOrder item:alluserorder)
      {
    	  if(item.getId().getOrder().getOrderId().equals(orderid))
         {
    		  thisuserorder = item;
    		  break;
    	 }
      }
      
      User thisuser = thisuserorder.getId().getUser();
      User realuser = userDAO.findById(thisuser.getUserId());
      
      Double currentcredit = Double.parseDouble(realuser.getCredit());
      
      Double newcredit = currentcredit + thisorder.getOverallPrice();
      
      realuser.setCredit(String.valueOf(newcredit));
      
      realuser.setLevel(LevelCalculation.calclevel(String.valueOf(newcredit)));
      
      userDAO.update(realuser);
      orderDAO.update(thisorder);
      
      ActionContext.getContext().getSession().put("currentuser", realuser);

	   return "success";

   }  
     

}

