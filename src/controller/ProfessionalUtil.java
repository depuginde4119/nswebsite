package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductCRUD;
import DTO.MailDto;
import DTO.NewUser;
import DTO.Product;

import com.nrg.common.Constants;
import com.nrg.common.MailTemplate;
import com.nrg.common.SendMail;

public class ProfessionalUtil extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		handleRequest(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		handleRequest(req,resp);
	}

	private void handleRequest(HttpServletRequest req, HttpServletResponse resp) 
	{
		String temp_uri = req.getRequestURI();
		System.out.println(":::::::::::::"+temp_uri);
		int p = temp_uri.lastIndexOf("/");
		String uri=temp_uri.substring(p+1);
		if(uri.equals(Constants.MC_PROFESSIONAL_QUOTE))
		{
			double quote=1;
			
			String service=(String) req.getParameter("service");
			if(service!=null)
			{
			
			switch(service)
			{
				case  "1":
					String productID=(String) req.getParameter("product");
					int units=Integer.parseInt(req.getParameter("units_1"));
					ProductCRUD productCRUD= new ProductCRUD();
					Product product=productCRUD.getProduct(productID);
					quote=quote+product.getPrice();
					quote=quote*units;
					
					if(quote!=0)
					{
						quote=quote+Constants.GENERAL_INSTALLATION;
						
					}
					
//					Product product=productCRUD.getProducts(productID);
					break;
				case  "2":
					int area=Integer.parseInt(req.getParameter("area_2"));
					int underground=Integer.parseInt(req.getParameter("underGroundWater"));
					
					quote=quote+(underground*Constants.WWR_UNDERGROUND_CHARGES);
					quote=quote+(area*Constants.WWR_INSTALLATION_PER_SQFEET);
					
					break;
				case  "3":
					int capacity=Integer.parseInt(req.getParameter("capacity_3"));
					int pumptype=Integer.parseInt(req.getParameter("pumpType_3"));
					quote=quote+(pumptype*Constants.HP_PUMPTYPE_CHARGES);
					quote=quote+(capacity*Constants.HP_PERCAPACITY_CHARGES);
							
	
					break;
				case  "4":
					
					int area_4=Integer.parseInt(req.getParameter("area_4"));
					int greenHouse=Integer.parseInt(req.getParameter("greenHouse_4"));
					int drip=Integer.parseInt(req.getParameter("dripSystem_4"));
					quote=quote+(area_4*Constants.GD_PERAREA_CHARGES);
					quote=quote+(greenHouse*Constants.GD_GREENHOUSE_CHARGES);
					quote=quote+(drip*Constants.GD_DRIP_CHARGES*area_4);
	
					break;
				case  "5":
					int area_5=Integer.parseInt(req.getParameter("area_5"));
					int variant_5=Integer.parseInt(req.getParameter("variant_5"));
					quote=quote+(area_5*Constants.AC_PERAREA_CHARGES);
					quote=quote+(variant_5*Constants.AC_VARIANT_CHARGES);
					break;
					
				default:
					break;
			}
			
			
			String jsonstring ="{\"isException\":\"false\",\"quote\":\""+quote+"\", \"service\":\""+service+"\"}";
			
			try {
				resp.getWriter().print(jsonstring);
			} 
			catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
						
		}
		else if(uri.equals(Constants.MC_PROFESSIONAL_ACCEPTQUOTE))
		{
			
//			data:"quote="+quotation+"&service="+serviceName+"&name="+username+"&email"+email+"&contact="+contact,\
			Map<String ,String> details= new HashMap<String,String>();
			details.put("user", req.getParameter("name").toString());
			details.put("email", req.getParameter("email").toString());
			details.put("contact", req.getParameter("contact").toString());
			details.put("contact", req.getParameter("contact").toString());
			details.put("quote", req.getParameter("quote").toString());
			details.put("service", req.getParameter("service").toString());
			
			MailDto maildto=MailTemplate.quoteEmail(details);

			SendMail.send(maildto);
						
			
		}
	}

}
