package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductCRUD;
import DTO.Product;

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
		
		
		//DB intraction call 
		
		// Data Process Steps
		List<Product> products = (List<Product>) new ProductCRUD().select(null);
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
}
