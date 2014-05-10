package Actions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import Data.ShopAdmin;
import Data.ShopAdminDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;




public class AdminLogin extends ActionSupport{
		

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpassword() {
		return adminpassword;
	}

	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}

	private static final long serialVersionUID = 4807407173937196873L;
	
	private String adminid;
	private String adminpassword;

	
	
	public byte[] eccrypt(String info) throws NoSuchAlgorithmException{
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		byte[] srcBytes = info.getBytes();
		md5.update(srcBytes);
		byte[] resultBytes = md5.digest();
		return resultBytes;
	}
	
	public String checkadminlogin(ShopAdminDAO shopAdminDAO) throws NoSuchAlgorithmException{
		String adminid1 = this.getAdminid().trim();
		String adminpassword1 = this.getAdminpassword().trim();
		
		// check if AdminID is Empty
		if(null == this.getAdminid() || "".equals(this.getAdminid().trim())){
			this.addFieldError("adminid", "Your ID is required!");
			return INPUT;
		}
		
		if( null == this.getAdminpassword() || "".equals(this.getAdminpassword().trim())){
			this.addFieldError("adminpassword", "Password is requird!");
			return INPUT;
		}
		
		ShopAdmin finding = shopAdminDAO.findById(adminid1);
		if(finding!=null)
		{
			
			byte[] resultBytes = this.eccrypt(adminpassword1);
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
			   System.out.println(checkpassword);
			   
			if(!finding.getShopadminPwd().equals(checkpassword))
			{
				return "fail";
			}
			else
			{
				ActionContext.getContext().getSession().put("currentuser",finding);
				return "success";
			}			
		}
		return "fail";	
	}



public String execute() throws Exception{
	Resource tmp = new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
	BeanFactory factory = new XmlBeanFactory(tmp);
	ShopAdminDAO shopAdminDAO = (ShopAdminDAO) factory.getBean("ShopAdminDAO");
	String result = checkadminlogin(shopAdminDAO);
	
	if(result.equals("fail"))
		this.addFieldError("admin_login","Wrong ID or Password!");
    return result;

	}

}


