 <%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="s" uri="/struts-tags" %> 
  <div class="grid_6">
      <h3>Register</h3>
      
      
             <div class="contact_form">
              <h4>If you are new to our system, please register here.</h4>
                <div class="form_subtitle">Register your account</div>
                 <form name="register" action="UserRegistration">          
                    <div class="form_row">
                    <label class="contact"><strong>Username:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>Password:</strong></label>
                    <input type="text" class="contact_input" />
                    <s:fielderror cssStyle="color: red">
                        <s:param>password</s:param>
                    </s:fielderror>
                    </div>                     
	
					<div class="form_row">
                    <label class="contact"><strong>E-mail:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>  
                    
                    <div class="form_row">
                    <input type="submit" class="register" value="Register" />
                    </div>    
                    
                  </form>     
                    
                </div>  
    
     
    </div>

