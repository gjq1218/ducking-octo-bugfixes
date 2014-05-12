package Actions;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


import Data.User;
import Data.UserDAO;



public class AdminViewUserCancellation extends ActionSupport{

	public User getReturnuser() {
		return returnuser;
	}

	public void setReturnuser(User returnuser) {
		this.returnuser = returnuser;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String getAdminviewuserid() {
		return adminviewuserid;
	}

	public void setAdminviewuserid(String adminviewuserid) {
		this.adminviewuserid = adminviewuserid;
	}

	private String adminviewuserid;
	private User returnuser;
	
	
	public String execute() throws Exception{
	
		if (!ActionContext.getContext().getSession().containsKey("currentshopadmin"))
			return INPUT;
		
		Resource tmp = new FileSystemResource("/Users/Gina/Programming/workspace_MyEclipse/ShopSystem/src/applicationContext.xml");
		BeanFactory factory = new XmlBeanFactory(tmp);
		UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
		
		String adminviewuserid1 = this.adminviewuserid.trim();

		returnuser = userDAO.findById(adminviewuserid1);
		
		
			System.out.println(returnuser.getUserId());
			System.out.println(returnuser.getEmail());
			
	

		return SUCCESS;
		
	}
}
