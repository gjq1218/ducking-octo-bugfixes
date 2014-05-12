package Actions;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import sun.tools.tree.ThisExpression;

import Data.Order;
import Data.OrderDAO;
import Data.OrderMenu;
import Data.OrderMenuDAO;
import Data.UserOrder;
import Data.UserOrderDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ApproveCancel extends ActionSupport{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String getApproveorderid() {
		return approveorderid;
	}

	public void setApproveorderid(String approveorderid) {
		this.approveorderid = approveorderid;
	}

	private String approveorderid;
	
	public String execute() throws Exception { 
		
		if (!ActionContext.getContext().getSession().containsKey("currentshopadmin"))
			return INPUT;
		
		ApplicationContext factory=new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	    
	    OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
	    OrderMenuDAO ordermenuDAO = (OrderMenuDAO) factory.getBean("OrderMenuDAO");
	    UserOrderDAO userorderDAO = (UserOrderDAO) factory.getBean("UserOrderDAO");
		
	    Order newcurrentorder = orderDAO.findById(approveorderid);
	    System.out.println(this.approveorderid);
	    
	    // Delete OrderMenu 
	    List<OrderMenu> allordermenu = ordermenuDAO.findAll();
	    List<OrderMenu> currentordermenu = new ArrayList<OrderMenu>();
	    
	    for (OrderMenu checkitem:allordermenu)
	      {
	    	  if(checkitem.getId().getOrder().getOrderId().equals(approveorderid))
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
	    	  if(checkitem.getId().getOrder().getOrderId().equals(approveorderid))
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
	   
	    
	    //this.addFieldError("success", "Approve Successfully");
	    return "success";
	}
	
}
