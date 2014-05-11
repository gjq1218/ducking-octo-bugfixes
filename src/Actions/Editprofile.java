package Actions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;


import Data.User;
import Data.UserDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Editprofile extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5939257435216160087L;

	private String editusername;  
    private String editphone;
    private User currentuser =  (User)ActionContext.getContext().getSession().get("currentuser");
    private String useremail = currentuser.getEmail();
    private String editaddress;
    

    public String getEditusername() {
		return editusername;
	}

	public void setEditusername(String editusername) {
		this.editusername = editusername;
	}

	public String getEditphone() {
		return editphone;
	}

	public void setEditphone(String editphone) {
		this.editphone = editphone;
	}


	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getEditaddress() {
		return editaddress;
	}

	public void setEditaddress(String editaddress) {
		this.editaddress = editaddress;
	}

	public byte[] eccrypt(String info) throws NoSuchAlgorithmException{   
        MessageDigest md5 = MessageDigest.getInstance("MD5");  
        byte[] srcBytes = info.getBytes();   
        md5.update(srcBytes);    
        byte[] resultBytes = md5.digest();  
        return resultBytes;  
    }  
    
	public String editregister() throws NoSuchAlgorithmException
   {
	    String phone1 = this.getEditphone().trim();
	    String username1 = this.getEditusername().trim();
	    String address1 = this.getEditaddress().trim();
	    String email1 = this.getUseremail().trim();
	    
	    
        if(null == this.getEditusername() || "".equals(this.getEditusername().trim()))
        {
            this.addFieldError("editusername", "Username is required!");
            return INPUT;
        }
     
        if(null != this.getEditphone() && !("".equals(this.getEditphone().trim())))
        {
           String check = "[0-9]+";  
           Pattern regex = Pattern.compile(check);  
           Matcher matcher = regex.matcher(phone1);  
           boolean isMatched = matcher.matches(); 
           if(!isMatched || phone1.length() < 10)
           {
     	      this.addFieldError("editphone", "This is not an legal phone number!");
     	      return INPUT;
           }
        }
        
       Resource res =new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
 	   BeanFactory factory = new XmlBeanFactory(res); 
 	   UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
 	   
 	   
 	  List<User> finding = userDAO.findByEmail(email1);
	   
	   if (!finding.isEmpty())
	   {
		   for (User check:finding)
		   {
			   if (check.getEmail().equals(email1))
			   {
			       check.setUserAddress(address1);
			       check.setPhone(phone1);
			       check.setUserName(username1);
			       userDAO.update(check);
			       ActionContext.getContext().getSession().put("currentuser", check);
			       return "success";
			   }
		   }
	   } 	   
	   return "fail";
   }
   
  
public String execute() throws Exception { 
	//the session is expired, you should login again.
	if (!ActionContext.getContext().getSession().containsKey("currentuser"))
		return INPUT;   
	
	String result = editregister();
	   
	   
	   if(result.equals("fail"))
		   this.addFieldError("edit", "Cannot updata databases!");
	   return result;

   }  
     

}

