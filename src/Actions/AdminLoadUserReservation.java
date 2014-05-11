package Actions;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;



import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Data.Reservation;
import Data.ReservationDAO;
import Data.Shop;
import Data.ShopAdmin;
import Data.ShopDAO;
import Data.User;
import Data.UserDAO;
import Data.UserReservation;
import Data.UserReservationDAO;
import Data.UserReservationId;

public class AdminLoadUserReservation extends ActionSupport {
	public List<UserReservation> getAllUserReservation() {
		return allUserReservation;
	}


	public void setAllUserReservation(List<UserReservation> allUserReservation) {
		this.allUserReservation = allUserReservation;
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



	List<UserReservation> allUserReservation = new ArrayList<UserReservation>();
	ShopAdmin currentadmin = (ShopAdmin)ActionContext.getContext().getSession().get("currentshopadmin");
	
	public List<UserReservation> sortbytime(List<UserReservation> originlist)
	{
		if (originlist == null) return null;
		List<UserReservation> finallist = new ArrayList<UserReservation>();
		
		int size = originlist.size();
		
		for (int i = 0; i<size; i++)
		{
			
			UserReservation tempkey = originlist.get(0);
			Timestamp compare =  tempkey.getId().getReservation().getTime();
			
			for(UserReservation item:originlist)
			{
				Timestamp itemtime = item.getId().getReservation().getTime();

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
		
		Resource tmp = new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
		BeanFactory factory = new XmlBeanFactory(tmp);
		ReservationDAO reservationDAO = (ReservationDAO) factory.getBean("ReservationDAO");
		UserReservationDAO userreservationDAO = (UserReservationDAO) factory.getBean("UserReservationDAO");
		ShopDAO shopDAO = (ShopDAO) factory.getBean("ShopDAO");
		UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
		
		
		
		List<UserReservation> originalUserReservation = userreservationDAO.findAll();
//		
//		for (UserReservation item:originalUserReservation)
//		{
//			System.out.println(item.getId().getReservation().getReservationId());
//		}
//		
		
		for(UserReservation notitem: originalUserReservation)
		{
			Reservation notreservation = notitem.getId().getReservation();
			Reservation realreservation = reservationDAO.findById(notreservation.getReservationId());
			
			
			//test
			
			
			//add shop information from shopDAO to obtain the realreservation		
			Shop realshop = shopDAO.findById(realreservation.getShop().getShopId());
			
			realreservation.setShop(realshop);
			
			//add user information from UserDAO.
			User notuser = notitem.getId().getUser();
			User realuser = userDAO.findById(notuser.getUserId());
			
			UserReservationId  userReservationId = new UserReservationId();
			userReservationId.setReservation(realreservation);
			userReservationId.setUser(realuser);
			
			notitem.setId(userReservationId);
			
			if(notitem.getId().getReservation().getShop().getShopId().equals(currentadmin.getShop().getShopId())){
				//System.out.println(notitem.getId().getReservation().getReservationId());
				allUserReservation.add(notitem);		
			}
		}
		
		
//		for (UserReservation item:allUserReservation)
//		{
//			System.out.println(item.getId().getReservation().getReservationId());
//		}
//		
		//allUserReservation = sortbytime(allUserReservation);
		
		
		
		
		return SUCCESS;
	}

}
