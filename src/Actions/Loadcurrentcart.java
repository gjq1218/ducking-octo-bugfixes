package Actions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import Data.Menu;
import Data.Order;
import Data.OrderDAO;
import Data.ReservationDAO;
import Data.Shop;
import Data.ShopAdmin;
import Data.ShopAdminDAO;
import Data.Reservation;
import Data.ShopDAO;
import Data.User;
import Data.UserDAO;
import Data.UserOrder;
import Data.UserOrderDAO;
import Data.UserReservationDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;




public class Loadcurrentcart extends ActionSupport{
		
    List<Order> currentcart = new ArrayList<Order>();


   public List<Order> getCurrentcart() {
		return currentcart;
	}

	public void setCurrentcart(List<Order> currentcart) {
		this.currentcart = currentcart;
	}

public List<Order> sortbytime(List<Order> originlist)
{
	if (originlist == null) return null;
	List<Order> finallist = new ArrayList<Order>();
	
	int size = originlist.size();
	
	for (int i = 0; i<size; i++)
	{
		Order thisone = originlist.get(0);
		Timestamp thistime = thisone.getTime();
		for(Order item:originlist)
		{
			Timestamp itemtime = item.getTime();
			if(finallist.size() != 0)
			{
				int lastindex = finallist.size() -1;				
				Timestamp lastlist = finallist.get(lastindex).getTime();
				if(itemtime.before(lastlist) || itemtime.equals(lastlist))
				{
					if(itemtime.after(thistime) || itemtime.equals(thistime))
					{
					   thisone = item;
					   thistime = thisone.getTime();
					}
				}
			}
			else
			{
				if(itemtime.after(thistime) || itemtime.equals(thistime))
				{
				   thisone = item;
				   thistime = thisone.getTime();
				}
			}
		}
		finallist.add(thisone);
		originlist.remove(thisone);
	}
	
	return finallist;
}

public String execute() throws Exception{
	
	if (!ActionContext.getContext().getSession().containsKey("currentuser"))
		return INPUT;
	
	User currentuser = (User) ActionContext.getContext().getSession().get("currentuser");
	
	ApplicationContext factory=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
	OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
	UserOrderDAO userorderDAO = (UserOrderDAO) factory.getBean("UserOrderDAO");
	ShopDAO shopDAO = (ShopDAO) factory.getBean("ShopDAO");
	
	List<Order> userallorder = userorderDAO.findByUser(currentuser);
	List<Order> thisusercurrentorder = new ArrayList<Order>();
	
	for(Order item:userallorder)
	{
		Order realitem = orderDAO.findById(item.getOrderId());
		Shop realshop = shopDAO.findById(realitem.getShop().getShopId());
		realitem.setShop(realshop);
		if(realitem.getType().equals("current"))
			thisusercurrentorder.add(realitem);		
	}
   
	thisusercurrentorder = sortbytime(thisusercurrentorder);
	this.setCurrentcart(thisusercurrentorder);

      return SUCCESS;
	}

}


