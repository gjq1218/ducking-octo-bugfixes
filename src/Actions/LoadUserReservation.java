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
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import Data.ReservationDAO;
import Data.Shop;
import Data.ShopAdmin;
import Data.ShopAdminDAO;
import Data.Reservation;
import Data.ShopDAO;
import Data.User;
import Data.UserDAO;
import Data.UserReservationDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;




public class LoadUserReservation extends ActionSupport{
		
    List<Reservation> currentUserReservation = new ArrayList<Reservation>();

   public List<Reservation> getCurrentUserReservation() {
		return currentUserReservation;
	}

	public void setCurrentUserReservation(List<Reservation> currentUserReservation) {
		this.currentUserReservation = currentUserReservation;
	}

public List<Reservation> sortbytime(List<Reservation> originlist)
{
	if (originlist == null) return null;
	List<Reservation> finallist = new ArrayList<Reservation>();
	
	int size = originlist.size();
	
	for (int i = 0; i<size; i++)
	{
		Reservation thisone = originlist.get(0);
		Timestamp thistime = thisone.getTime();
		for(Reservation item:originlist)
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
	
	Resource tmp = new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
	BeanFactory factory = new XmlBeanFactory(tmp);
	UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
	ReservationDAO reservationDAO = (ReservationDAO) factory.getBean("ReservationDAO");
	UserReservationDAO userreservationDAO = (UserReservationDAO) factory.getBean("UserReservationDAO");
	ShopDAO shopDAO = (ShopDAO) factory.getBean("ShopDAO");
	
	List<Reservation> originalUserReservation = userreservationDAO.findByUser(currentuser);
	
   for(Reservation notitem:originalUserReservation)
   {
	   Reservation realitem = reservationDAO.findById(notitem.getReservationId());
	   Shop realshop = shopDAO.findById(realitem.getShop().getShopId());
	   realitem.setShop(realshop);
	   currentUserReservation.add(realitem);
	   
   }
	
	

	 currentUserReservation = sortbytime(currentUserReservation);

      return SUCCESS;
	}

}


