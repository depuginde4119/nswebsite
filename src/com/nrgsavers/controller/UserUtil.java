package com.nrgsavers.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nrg.common.Constants;
import com.nrg.common.MailTemplate;
import com.nrg.common.RandomStringGenerator;
import com.nrg.common.SendMail;
import com.nrgsavers.dto.MailDto;
import com.nrgsavers.dto.NewUser;
import com.nrgsavers.dto.Product;
import com.nrgsavers.model.ProductCRUD;
import com.nrgsavers.model.UserCRUD;


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
		try{
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

				resp.getWriter().print(response);

			}
			if(uri.equals(Constants.LOGIN_PATH))
			{
				NewUser userDto = new NewUser();

				userDto.setEmail(req.getParameter("username"));

				userDto.setPassword(req.getParameter("password"));
				boolean result = new UserCRUD().checkAuthentication(userDto);

				if(result)
				{
					NewUser dto = new UserCRUD().getUser(userDto);
					req.getSession().setAttribute("loggedUser",dto.getName());
					req.getSession().setAttribute("userRole",dto.getRole());
					resp.getWriter().print("Success");
				}
				else
				{
					resp.getWriter().print("Failed");
				}


			}
			if(uri.equals(Constants.LOGOUT_PATH))
			{
				req.getSession().removeAttribute("loggedUser");
				resp.sendRedirect(req.getContextPath());
				//RequestDispatcher rd=req.getRequestDispatcher("/home");

				//rd.forward(req, resp);
			}
			if(uri.equals(Constants.FORGOT_PASSWORD_PATH))
			{
				NewUser userDto = new NewUser();

				userDto.setEmail(req.getParameter("username"));

			
				boolean emailAvailability =	new UserCRUD().checkEmailAvailability(userDto);
				String response ;
				if(emailAvailability)
				{
					response = "Y";
					//create temporary password and send email
					String tempPassword = RandomStringGenerator.generateRandomString();
					System.out.println(tempPassword);
					userDto.setTempPassword(tempPassword);
					new UserCRUD().setTempPassword(userDto);
					MailDto maildto = MailTemplate.tempPasswordTemplate(userDto);
					
					SendMail.send(maildto);
					
				}
				else
				{
					response = "N";
				}

				resp.getWriter().print(response);


			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}
