package com.nrgsavers.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nrg.common.Constants;
import com.nrg.common.MailTemplate;
import com.nrg.common.SendMail;
import com.nrgsavers.controller.ProductUtil;
import com.nrgsavers.dto.MailDto;
import com.nrgsavers.dto.Product;
import com.nrgsavers.dto.ProductType;
import com.nrgsavers.model.ProductCRUD;


public class ProductAdmin extends HttpServlet{
	
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

		String uri=req.getParameter("mc");
		System.out.println(":::::::::::::"+uri);	
		
		if(isNumeric(uri))
		{
			ProductCRUD productCRUD= new ProductCRUD();

			// Data Process Steps
			Product product = (Product) productCRUD.getProduct(uri);
			
			// Put data into Request Object
			req.setAttribute("product", product);
						
			List<ProductType> productTypes= productCRUD.getAllProductType();
			req.setAttribute("productTypes", productTypes);
			
			
			// Redirect to view jsp.
			RequestDispatcher rd=req.getRequestDispatcher("/editProduct");
			try {
				rd.forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e){
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(uri.equals(Constants.MC_ADMIN_ALLPRODUCT))
		{
			ProductCRUD productCRUD= new ProductCRUD();
			List<Product> products= productCRUD.getAllProduct();
			
			// Redirect to view jsp.
			RequestDispatcher rd=req.getRequestDispatcher("/adminProducts");
			try {
				rd.forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e){
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(uri.equals(Constants.MC_ADMIN_UPDATEPRODUCT))
		{
			Product product = new Product();
			int id= req.getParameter("pid")!=null?Integer.parseInt(req.getParameter("pid")):0;
			
			product.setId(id);
			product.setName(req.getParameter("pname").toString());
			product.setDescription(req.getParameter("pdesc").toString());
			product.setPrice(Double.parseDouble(req.getParameter("pprice")));
			product.setSpecification(req.getParameter("pspec").toString());
			product.setImage(req.getParameter("pimage").toString());
			
			ProductCRUD productCRUD = new ProductCRUD();
			if(product.getId()==0)
			{
				productCRUD.create(product);	
			}else
			{
				productCRUD.update(product);
			}
			
		}
		else if(uri.equals(Constants.MC_ADMIN_DELETEPRODUCT))
		{

			String ProductId= req.getParameter("pid");
			ProductCRUD productCRUD= new ProductCRUD();
			productCRUD.delete(ProductId);
			
			List<Product> products= productCRUD.getAllProduct();
			
			// Put data into Request Object
			req.setAttribute("product", products);
												
			// Redirect to view jsp.
			RequestDispatcher rd=req.getRequestDispatcher("/listProducts");
			try {
				rd.forward(req, resp);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e){
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	   }
	
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
