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
//	public String getAdminid() {
//		return adminid;
//	}
//
//	public void setAdminid(String adminid) {
//		this.adminid = adminid;
//	}
//
//	public String getAdminpassword() {
//		return adminpassword;
//	}
//
//	public void setAdminpassword(String adminpassword) {
//		this.adminpassword = adminpassword;
//	}
//
//	private static final long serialVersionUID = 4807407173937196873L;
//	
//	private String adminid;
//	private String adminpassword;

	
	
//	public byte[] eccrypt(String info) throws NoSuchAlgorithmException{
//		MessageDigest md5 = MessageDigest.getInstance("MD5");
//		byte[] srcBytes = info.getBytes();
//		md5.update(srcBytes);
//		byte[] resultBytes = md5.digest();
//		return resultBytes;
//	}
//	
//	public String checkadminlogin(ShopAdminDAO shopAdminDAO) throws NoSuchAlgorithmException{
//		String adminid1 = this.getAdminid().trim();
//		String adminpassword1 = this.getAdminpassword().trim();
//		
//		// check if AdminID is Empty
//		if(null == this.getAdminid() || "".equals(this.getAdminid().trim())){
//			this.addFieldError("adminid", "Your ID is required!");
//			return INPUT;
//		}
//		
//		if( null == this.getAdminpassword() || "".equals(this.getAdminpassword().trim())){
//			this.addFieldError("adminpassword", "Password is requird!");
//			return INPUT;
//		}
//		
//		ShopAdmin finding = shopAdminDAO.findById(adminid1);
//		if(finding!=null)
//		{
//			
//			byte[] resultBytes = this.eccrypt(adminpassword1);
//			   StringBuffer show = new StringBuffer();
//			   
//			   for(int i= 0; i< resultBytes.length;i++)
//	           {
//	        	   int v = resultBytes[i] & 0xff;
//	        	   if (v<16)
//	        	   {
//	        		   show.append(0);
//	        	   }
//	        	   else
//	        	   {
//	        		   show.append(Integer.toHexString(v));
//	        	   }
//	           }
//			   
//			   String checkpassword = show.toString();
//			   System.out.println(checkpassword);
//			   
//			if(!finding.getShopadminPwd().equals(checkpassword))
//			{
//				return "fail";
//			}
//			else
//			{
//				ActionContext.getContext().getSession().put("currentuser",finding);
//				return "success";
//			}			
//		}
//		return "fail";	
//	}

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


