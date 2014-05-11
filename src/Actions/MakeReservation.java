package Actions;

import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import Data.Reservation;
import Data.ReservationDAO;
import Data.Shop;
import Data.ShopDAO;
import Data.User;
import Data.UserReservation;
import Data.UserReservationDAO;
import Data.UserReservationId;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MakeReservation extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String getNumberofpeople() {
		return numberofpeople;
	}
	public void setNumberofpeople(String numberofpeople) {
		this.numberofpeople = numberofpeople;
	}
	public String getRestaurant_name() {
		return restaurant_name;
	}
	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	private String restaurant_name;
	private String date;
	private String arrival_time;
	private String customername;
	private String numberofpeople;
	
	public String makereservation() throws NoSuchAlgorithmException, ParseException{
			
		User currentuser = (User)ActionContext.getContext().getSession().get("currentuser");
		
		//Check if the user input is correct.
		if(this.getRestaurant_name().equals("-1"))
		{
			this.addFieldError("whichrestaurant","Please Select Restaurant!");
			return "fail";
		}
		
		if(this.getDate() ==  null || "".equals(this.getDate()))
		{	
			this.addFieldError("reservedate","Please Select Date!");
			return "fail";	
		}
		
		if( this.getArrival_time().equals("-1"))
		{
			this.addFieldError("arrivetime","Please Select Arrive Time!");
			return "fail";	
		}
		
		if(this.getNumberofpeople() == null || "".equals(this.getNumberofpeople().trim()))
		{
			this.addFieldError("numberofpeople","Please fill number of people!");
			return "fail";	
			
		}
		
        if(null != this.getNumberofpeople() && !("".equals(this.getNumberofpeople().trim())))
        {
           String check = "[0-9]+";  
           Pattern regex = Pattern.compile(check);  
           Matcher matcher = regex.matcher(this.getNumberofpeople().trim());  
           boolean isMatched = matcher.matches(); 
           if(!isMatched)
           {
     	      this.addFieldError("numberofpeople", "This is not an legal number!");
     	      return "fail";
           }
        }
		
		if(this.getCustomername() == null || "".equals(this.getCustomername()))
		{
			this.addFieldError("customername","Please Select Arrive Time!");
			return "fail";	
		}	

		
	//First we need to update the reservation in database.
		
		// get rid of the space of the entry.
		String restaurant_name1 = this.getRestaurant_name().trim();
		String date1 = this.getDate().trim();
		String arrival_time1 = this.getArrival_time().trim();
		String customername1 = this.getCustomername().trim();
		
		//Spring get bean
		Resource res =new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
		BeanFactory factory = new XmlBeanFactory(res); 

		// get shop entity though shop name
		ShopDAO shopDAO = (ShopDAO) factory.getBean("ShopDAO");
		ReservationDAO reservationDAO = (ReservationDAO) factory.getBean("ReservationDAO");
		UserReservationDAO userReservationDAO = (UserReservationDAO) factory.getBean("UserReservationDAO");
				
		List<Shop> findshop = shopDAO.findByShopName(restaurant_name1);

		// generate reservation ID.
		
	   Random randomgenerator = new Random();
	   boolean isPossible = false;
	   String reservation_id = null;
	   while(!isPossible)
	   {
		   reservation_id = String.valueOf(Math.abs(randomgenerator.nextInt()));
	       if(reservationDAO.findById(reservation_id) == null)
	    	   isPossible = true;
	   }
		System.out.println(reservation_id);   
		// transfer Date to Timestamp time.
		   
		   //disolve date
		   String month = date1.substring(0,2);
		   String day = date1.substring(3,5);
		   String year = date1.substring(6,10);
		   
		   //disolve time
		   String time1 = arrival_time1.substring(0, 5);
		   String time11 = time1.trim();
		   
		   
		   StringBuffer tmp = new StringBuffer();
		   //connect them
		   tmp = tmp.append(year + "-" + month + "-" + day + " " + time11 + ":00");
		   
		   String finaltime = tmp.toString();
		   
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		   Date date = sdf.parse(finaltime);
		   Timestamp arrivetime = new java.sql.Timestamp(date.getTime());
		   if(arrivetime.before(new Date()))
		   {
			   this.addFieldError("arrivetime","Cannot make a reservation before current time!");
			   return "fail";
		    
		   }
		   // create a new reservation
		   Reservation newReservation = new Reservation(reservation_id, findshop.get(0), arrivetime, this.getNumberofpeople());
		   reservationDAO.save(newReservation);

		//Second we update the user_reservation in the database.

		   UserReservationId newUserReservationId = new UserReservationId(currentuser,newReservation);		   
		   UserReservation newUserReservation = new UserReservation(newUserReservationId);
		    //System.out.println(newUserReservation.getId().getUser().getEmail()); 
		   userReservationDAO.save(newUserReservation);

		return "success";
		
	}
	  
	public String execute() throws Exception { 

		
		String result = makereservation();
			
		return result;
	
	}  

}
