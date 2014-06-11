package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nrg.common.Constants;

import model.ProductCRUD;
import model.UserCRUD;
import DTO.NewUser;
import DTO.Product;

public class UserUtil extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	 httpRequestHandler( req,  resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		httpRequestHandler( req,  resp);
	}
	
	
	
	
	private void httpRequestHandler(HttpServletRequest req,
			HttpServletResponse resp) {
		String temp_uri = req.getRequestURI();
		System.out.println(":::::::::::::"+temp_uri);
		int p = temp_uri.lastIndexOf("/");
				
		String uri=temp_uri.substring(p+1);
		if(uri.equals(Constants.NEW_USER_PATH))
		{
			NewUser userDto = new NewUser();
			userDto.setName(req.getParameter("name"));
			userDto.setEmail(req.getParameter("email"));
			userDto.setPhone(req.getParameter("phone"));
			userDto.setPassword(req.getParameter("password"));
			new UserCRUD().create(userDto);
		}
	if(uri.equals(Constants.EMAIL_AVAILABILITY_PATH))
	{
		NewUser userDto = new NewUser();
		
		userDto.setEmail(req.getParameter("email"));
		
	boolean emailAvailability =	new UserCRUD().checkEmailAvailability(userDto);
	String response ;
	if(emailAvailability)
	{
		response = "Y";
	}
	else
	{
		response = "N";
	}
	try {
		resp.getWriter().print(response);
	} catch (IOException e) {
		e.printStackTrace();
	}
	}
		
	}
}
