package Actions;

import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;


import Data.User;
import Data.UserDAO;

import com.opensymphony.xwork2.ActionSupport;

public class UserLogin extends ActionSupport{

	private static final long serialVersionUID = -1670621381682497767L;
	private String username;  
    private String password;  
    private String email;
    
    public String getUsername() {  
       return username;  
    }  
    public void setUsername(String username) {  
       this.username = username;  
    }  
    public String getPassword() {  
       return password;  
    }  
    public void setPassword(String password) {  
        this.password = password;  
    }  
   
   public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
    public void validate()
   {
       if(null == this.getEmail() || "".equals(this.getEmail().trim()))
        {
            this.addFieldError("email", "Email is required!");
        }
       else
       {
    	    // check email format
           String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";  
           Pattern regex = Pattern.compile(check);  
           Matcher matcher = regex.matcher(this.getEmail());  
           boolean isMatched = matcher.matches(); 
           if(!isMatched)
           {
        	   this.addFieldError("email", "This is not an legal email address!");
           }
        }
        if(null == this.getPassword() || "".equals(this.getPassword().trim()))
        {
            this.addFieldError("password", "Password is required!");
        }
   }
   
   public String execute() throws Exception { 
	   
	   Resource res =new FileSystemResource("/Users/haoyuanji/Workspaces2/MyEclipse 10/ShopSystem/src/applicationContext.xml");
	   BeanFactory factory = new XmlBeanFactory(res); 
	   UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
	   String email = this.getEmail().trim();
	   
	   List<User> finding = userDAO.findByEmail(email);
	   if (finding != null)
	   {
		   for (User check:finding)
		   {
			   if (check.getEmail().equals(email))
			   {
				   if(check.getUserPasscode().equals(password))
				      return "success";
				   else 
				   {
					 this.addFieldError("login", "Wrong email or passcode!!"); 
					 return "fail";
				   }
			   }
		   }
	   }
       return "fail";
//	   return "success";
   }  
     

}

