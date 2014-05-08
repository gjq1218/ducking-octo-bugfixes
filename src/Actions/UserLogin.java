package Actions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
    private String password;  
    private String email;
    
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
 
   }
   
   public byte[] eccrypt(String info) throws NoSuchAlgorithmException{   
        MessageDigest md5 = MessageDigest.getInstance("MD5");  
        byte[] srcBytes = info.getBytes();   
        md5.update(srcBytes);    
        byte[] resultBytes = md5.digest();  
        return resultBytes;  
    }  
    
   public String checklogin(UserDAO userDAO) throws NoSuchAlgorithmException
   {
	      String email1 = this.getEmail().trim();
	      String password1 = this.getPassword().trim();
	      
	     if(null == this.getEmail() || "".equals(this.getEmail().trim()))
	        {
	            this.addFieldError("email", "Email is required!");
	            return INPUT;
	        }
	       else
	       {
	    	    // check email format
	           String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";  
	           Pattern regex = Pattern.compile(check);  
	           Matcher matcher = regex.matcher(email1);  
	           boolean isMatched = matcher.matches(); 
	           if(!isMatched)
	           {
	        	   this.addFieldError("email", "This is not an legal email address!");
	        	   return INPUT;
	           }
	        }
	        if(null == this.getPassword() || "".equals(this.getPassword().trim()))
	        {
	            this.addFieldError("password", "Password is required!");
	            return INPUT;
	        }
	   
	   List<User> finding = userDAO.findByEmail(email);
	   if (finding != null)
	   {
		   byte[] resultBytes = this.eccrypt(password1);
		   StringBuffer show = new StringBuffer();
		   
		   for(int i= 0; i< resultBytes.length;i++)
           {
        	   int v = resultBytes[i] & 0xff;
        	   if (v<16)
        	   {
        		   show.append(0);
        	   }
        	   else
        	   {
        		   show.append(Integer.toHexString(v));
        	   }
           }
		   
		   String checkpassword = show.toString();
				   
		   for (User check:finding)
		   {
			   if (check.getEmail().equals(email1))
			   {

				   if(check.getUserPasscode().equals(checkpassword))
				      return "success";
				   else 
				   {
					 return "fail";
				   }
			   }
		   }
	   }
       return "fail";
   }

   public String execute() throws Exception { 
	   
	   Resource res =new FileSystemResource("/Users/haoyuanji/Workspaces2/MyEclipse 10/ShopSystem/src/applicationContext.xml");
	   BeanFactory factory = new XmlBeanFactory(res); 
	   UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
	   String result = checklogin(userDAO);
	   
	   if (result.equals("fail"))
		   this.addFieldError("login", "Wrong email or passcode!!"); 
	   
	   return result;
	   
   }  
     

}

