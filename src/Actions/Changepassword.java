package Actions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import Data.User;
import Data.UserDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Changepassword extends ActionSupport{
	public User getCurrentuser() {
		return currentuser;
	}
	public void setCurrentuser(User currentuser) {
		this.currentuser = currentuser;
	}
	public String getCurrent_password() {
		return current_password;
	}
	public void setCurrent_password(String current_password) {
		this.current_password = current_password;
	}
	public String getNew_password() {
		return new_password;
	}
	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}
	public String getRetry_password() {
		return retry_password;
	}
	public void setRetry_password(String retry_password) {
		this.retry_password = retry_password;
	}
	private String current_password;
	private String new_password;
	private String retry_password;
	private User currentuser = (User)ActionContext.getContext().getSession().get("currentuser");
	
	public  String MD5helper(String current_pwd) throws NoSuchAlgorithmException{
		
		//use MD5 to change current_pwd.It becomes a 16 bytes "1" or "0".
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		byte[] srcBytes = current_pwd.getBytes();
		md5.update(srcBytes);
		byte[] resultBytes = md5.digest();
		// to store the hexadecimal result.
		StringBuffer show = new StringBuffer();
		
		// transfer the 16 bytes binary code to hexadecimal （16 scale）.
		for(int i = 0; i<resultBytes.length; i++)
		{
			int v = resultBytes[i] & 0xff;
			if(v<16)
			{
				show.append(0);
			}
			else
			{
				show.append(Integer.toHexString(v));
			}
				
		}
		
		String compare_pwd = show.toString();
		return compare_pwd;
	}
	
	public String changepassword() throws NoSuchAlgorithmException{
		
		String current_pwd = this.getCurrent_password().trim();
		String new_pwd = this.getNew_password().trim();
		String new_retry_pwd = this.getRetry_password().trim();
		String right_pwd = this.getCurrentuser().getUserPasscode();
		
		
		String md5_compare_pwd = MD5helper(current_pwd);
		String md5_new_pwd = MD5helper(new_pwd);
		System.out.println("new pwd after MD5: " +md5_new_pwd);

		if(null == new_pwd || "".equals(current_pwd) 
				|| null == new_pwd || "".equals(new_pwd) 
				|| null == new_retry_pwd|| "".equals(new_retry_pwd))
		{
			this.addFieldError("empty_pwd", "Password can't be empty");
		}
		else if(!md5_compare_pwd.equals(right_pwd))
		{
			this.addFieldError("wrong_old_pwd", "Type wrong current password!");
		}
		else if(!new_pwd.equals(new_retry_pwd))
		{
			this.addFieldError("wrong_new_pwd", "It should be same with new password!");
		}
		else
		{
			
			
			Resource res = new FileSystemResource("/Users/haoyuanji/Workspaces2/MyEclipse 10/ShopSystem/src/applicationContext.xml");
			BeanFactory factory = new XmlBeanFactory(res);
			UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
			
			User userchangepwd = new User();
			userchangepwd = userDAO.findById(this.getCurrentuser().getUserId());
			userchangepwd.setUserPasscode(md5_new_pwd);
			userDAO.update(userchangepwd);	
			this.addFieldError("success_change", "Save your new password successfully!");
			return "success";
		}

			return "fail";
		
	}
	public String execute() throws Exception{
		
		//the session is expired, you should login again.
		if (!ActionContext.getContext().getSession().containsKey("currentuser"))
			return INPUT;   
		
		String result  = changepassword();
		
		if(result.equals("fail")){
			this.addFieldError("retry_password","Retry password is wrong!");
		}
		return result;
	}
	
}
