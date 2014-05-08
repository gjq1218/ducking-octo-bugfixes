package Actions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;


import Data.User;
import Data.UserDAO;

import com.opensymphony.xwork2.ActionSupport;

public class UserRegistration extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5939257435216160087L;

	private String regisusername;  
    private String regispassword;  
    private String regisemail;
    
   
    public String getRegisusername() {
		return regisusername;
	}

	public void setRegisusername(String regisusername) {
		this.regisusername = regisusername;
	}

	public String getRegispassword() {
		return regispassword;
	}

	public void setRegispassword(String regispassword) {
		this.regispassword = regispassword;
	}

	public String getRegisemail() {
		return regisemail;
	}

	public void setRegisemail(String regisemail) {
		this.regisemail = regisemail;
	}

    public byte[] eccrypt(String info) throws NoSuchAlgorithmException{   
        MessageDigest md5 = MessageDigest.getInstance("MD5");  
        byte[] srcBytes = info.getBytes();   
        md5.update(srcBytes);    
        byte[] resultBytes = md5.digest();  
        return resultBytes;  
    }  
    
	public String checkregister() throws NoSuchAlgorithmException
   {
	    String email1 = this.getRegisemail().trim();
	    
        if(null == this.getRegisusername() || "".equals(this.getRegisusername().trim()))
        {
            this.addFieldError("regisusername", "Username is required!");
            return INPUT;
        }
        if(null == this.getRegispassword() || "".equals(this.getRegispassword().trim()))
        {
            this.addFieldError("regispassword", "Password is required!");
            return INPUT;
        }

       if(null == this.getRegisemail() || "".equals(this.getRegisemail().trim()))
        {
            this.addFieldError("regisemail", "Email is required!");
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
        	   this.addFieldError("regisemail", "This is not an legal email address!");
        	   return INPUT;
           }
        }
       
        String checkpossible = checkpossible();
        if (checkpossible.equals("fail"))
        	this.addFieldError("regisemail", "This email has been registered!");
	    return checkpossible;
   }
   
   private String checkpossible() throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
	   Resource res =new FileSystemResource("/Users/haoyuanji/Workspaces2/MyEclipse 10/ShopSystem/src/applicationContext.xml");
	   BeanFactory factory = new XmlBeanFactory(res); 
	   UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
	   String email1 = this.getRegisemail().trim();
	   String username1 = this.getRegisusername().trim();
	   String password1 = this.getRegispassword().trim();
	   
	   List<User> finding = userDAO.findByEmail(email1);
	   
	   if (finding.isEmpty())
	   {
		   Random randomgenerator = new Random();
		   boolean isPossible = false;
		   String possibleid = null;
		   while(!isPossible)
		   {
		       possibleid = String.valueOf(Math.abs(randomgenerator.nextInt()));
		       if(userDAO.findById(possibleid) == null)
		    	   isPossible = true;
		   }
		   byte[] resultBytes = this.eccrypt(password1);
		   StringBuffer show = new StringBuffer();
		   
		   for(Byte by:resultBytes)
	        	show.append(by.toString());
		   User newuser = new User(possibleid,show.toString(), email1,username1);		   
		   userDAO.save(newuser);		   
		   return "success";
	   }
       return "fail";
	}

public String execute() throws Exception { 
	   String result = checkregister();
	   return result;

   }  
     

}

