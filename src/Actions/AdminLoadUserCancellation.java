package Actions;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;



import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Data.Order;
import Data.OrderDAO;
import Data.Reservation;
import Data.ReservationDAO;
import Data.Shop;
import Data.ShopAdmin;
import Data.ShopDAO;
import Data.User;
import Data.UserDAO;
import Data.UserOrder;
import Data.UserOrderDAO;
import Data.UserOrderId;
import Data.UserReservation;
import Data.UserReservationDAO;
import Data.UserReservationId;

public class AdminLoadUserCancellation extends ActionSupport {
	public List<UserOrder> getAllUserOrder() {
		return allUserOrder;
	}


	public void setAllUserOrder(List<UserOrder> allUserOrder) {
		this.allUserOrder = allUserOrder;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public ShopAdmin getCurrentadmin() {
		return currentadmin;
	}


	public void setCurrentadmin(ShopAdmin currentadmin) {
		this.currentadmin = currentadmin;
	}



	List<UserOrder> allUserOrder = new ArrayList<UserOrder>();
	ShopAdmin currentadmin = (ShopAdmin)ActionContext.getContext().getSession().get("currentshopadmin");
	
	public List<UserOrder> sortbytime(List<UserOrder> originlist)
	{
				
		if (originlist == null) return null;
		List<UserOrder> finallist = new ArrayList<UserOrder>();
		
		int size = originlist.size();
		
		for (int i = 0; i<size; i++)
		{
			
			UserOrder tempkey = originlist.get(0);
	
			Timestamp compare =  tempkey.getId().getOrder().getTime();
			
			for(UserOrder item:originlist)
			{
				Timestamp itemtime = item.getId().getOrder().getTime();

				if(compare.after(itemtime)){
					
					tempkey = item;
				
				}
			}
			
			finallist.add(tempkey);
			originlist.remove(tempkey);
			
			
		}
		return finallist;
	}
	
	
	public String execute() throws Exception{
		
		if (!ActionContext.getContext().getSession().containsKey("currentshopadmin"))
			return INPUT;
		
//		Resource tmp = new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
//		BeanFactory factory = new XmlBeanFactory(tmp);
		
		ApplicationContext factory=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		
		OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
		UserOrderDAO userOrderDAO = (UserOrderDAO) factory.getBean("UserOrderDAO");
		ShopDAO shopDAO = (ShopDAO) factory.getBean("ShopDAO");
		UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
		
		
		
		List<UserOrder> originalUserOrder = userOrderDAO.findAll();
//	    
//		for(UserOrder item :originalUserOrder){
//			System.out.println(item.getId().getOrder().getOrderId());
//		}
		
		for(UserOrder notitem: originalUserOrder)
		{
			Order notorder = notitem.getId().getOrder();
			Order realorder = orderDAO.findById(notorder.getOrderId());
			
			
			//test
			
			
			//add shop information from shopDAO to obtain the realreservation		
			Shop realshop = shopDAO.findById(realorder.getShop().getShopId());
			
			realorder.setShop(realshop);
			
			//add user information from UserDAO.
			User notuser = notitem.getId().getUser();
			User realuser = userDAO.findById(notuser.getUserId());
			
			UserOrderId  userOrderId = new UserOrderId();
			userOrderId.setOrder(realorder);
			userOrderId.setUser(realuser);
		
			
			notitem.setId(userOrderId);

			
			if(notitem.getId().getOrder().getShop().getShopId().equals(currentadmin.getShop().getShopId())){
				if(notitem.getId().getOrder().getType().equals("submit cancellation"))
				//System.out.println(notitem.getId().getReservation().getReservationId());
					allUserOrder.add(notitem);		
			}
		}		
		
//		for(UserOrder item: allUserOrder ){
//			System.out.println(item.getId().getOrder().getOrderId());
//		}
		return SUCCESS;
	}

}
