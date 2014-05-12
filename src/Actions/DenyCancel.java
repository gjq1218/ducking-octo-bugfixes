package Actions;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import Data.Order;
import Data.OrderDAO;
import Data.OrderMenuDAO;
import Data.UserOrderDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DenyCancel extends ActionSupport{
	public String getDenyorderid() {
		return denyorderid;
	}

	public void setDenyorderid(String denyorderid) {
		this.denyorderid = denyorderid;
	}

	private String  denyorderid;
	
	public String execute() throws Exception { 
		if (!ActionContext.getContext().getSession().containsKey("currentshopadmin"))
			return INPUT;
		ApplicationContext factory=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	    
	    OrderDAO orderDAO = (OrderDAO) factory.getBean("OrderDAO");
	   
	    Order changetype = orderDAO.findById(denyorderid);
	    
	    changetype.setType("active");
	    
	    orderDAO.update(changetype);
	    
	    return SUCCESS;
    
	}
	

}
