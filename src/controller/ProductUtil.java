package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nrg.common.Constants;

import model.ProductCRUD;
import DTO.Product;
import DTO.ProductType;

public class ProductUtil extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	 httpRequestHandler( req,  resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		httpRequestHandler( req,  resp);
	}
	
	
	
	
	private void httpRequestHandler(HttpServletRequest req,
			HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		String temp_uri = req.getRequestURI();
//		System.out.println(":::::::::::::"+temp_uri);
		int p = temp_uri.lastIndexOf("/");
		String uri=temp_uri.substring(p+1);
		System.out.println(":::::::::::::"+uri);	
		if(isNumeric(uri))
		{
			String addedtocart="";
//			Get Current from cookie
			if(req.getSession().getAttribute("loggedUser")!=null)
			{
			Cookie[] cookies= req.getCookies();
			String username=(String) req.getSession().getAttribute("loggedUser");
			username=username.replaceAll(" ", "_");
			username="cart_"+username;
			for(Cookie cookie: cookies)
			{
				if(username.equals(cookie.getName()))
				{
					addedtocart=cookie.getValue();
					
				}
				
			}
			
			}
			
			

			// Data Process Steps
			List<Product> products = (List<Product>) new ProductCRUD().getProducts(uri);
			if(!"".equals(addedtocart))
			{
				markAddedToCart(products,addedtocart);
				
			}
			// Put data into Request Object
			req.setAttribute("products", products);
			
			// Redirect to view jsp.
			RequestDispatcher rd=req.getRequestDispatcher("/productview");
			try {
				rd.forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(uri.equals(Constants.MC_PRODUCT_PRODUCTTPE))
		{
			ProductCRUD productCRUD= new ProductCRUD();
			List<ProductType> productTypes= productCRUD.getAllProductType();
			String HTMLFormate=req.getParameter("format");
			String HTML =generateHTML(HTMLFormate,productTypes);
			
			try {
				resp.getWriter().print(HTML);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(uri.equals(Constants.MC_PRODUCT_PRODUCTS))
		{
			String HTMLFormate=req.getParameter("format");
			String ProductType=req.getParameter("pt");
			ProductCRUD productCRUD= new ProductCRUD();
			List<Product> products= productCRUD.getProducts(ProductType);
			String HTML= generateProductHTML(HTMLFormate,products);
			
			try {
				resp.getWriter().print(HTML);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	private void markAddedToCart(List<Product> products, String addedtocart) {
		
		String[] allIds=addedtocart.split("_");
	 for(Product product : products)
		{
			
			String id= String.valueOf(product.getId());
			for(String string:allIds)
			{
				if(string.equals(id))
				{
					product.setAddedToCart(true);
				}
			}
			
		}
		
	}


	private String generateHTML(String hTMLFormate,
			List<ProductType> productTypes) {
		StringBuffer buffer= new StringBuffer("");
		if(hTMLFormate!=null && productTypes!=null)
		{
			if(hTMLFormate.equals(Constants.FORAMTE_PRODUCTTYPE_OPTIONS))
			{
				boolean isFirst=true;
				for(ProductType productType :productTypes)
				{
					if(isFirst)
					{
						buffer.append("<option value='"+productType.getProdutTypeID()+"' selected='selected'>"+productType.getName()+"</option>");
					}
					else
					{
						buffer.append("<option value='"+productType.getProdutTypeID()+"'>"+productType.getName()+"</option>");	
					}
					isFirst=false;
				}
			}
		}
		return buffer.toString();
	}
	
	private String generateProductHTML(String hTMLFormate,
			List<Product> products) {
		StringBuffer buffer= new StringBuffer("");
		if(hTMLFormate!=null && products!=null)
		{
			if(hTMLFormate.equals(Constants.FORAMTE_PRODUCTTYPE_OPTIONS))
			{
				boolean isFirst=true;
				for(Product product :products)
				{
					if(isFirst)
					{
						buffer.append("<option value='"+product.getId()+"' selected='selected'>"+product.getName()+"</option>");
					}
					else
					{
						buffer.append("<option value='"+product.getId()+"'>"+product.getName()+"</option>");	
					}
					isFirst=false;
				}
			}
		}
		return buffer.toString();
	}
	
	public static boolean isNumeric(String str)  
	{  
	  try  
	  {  
	    double d = Integer.parseInt(str);  
	  }  
	  catch(NumberFormatException nfe)  
	  {  
	    return false;  
	  }  
	  return true;  
	}
}
