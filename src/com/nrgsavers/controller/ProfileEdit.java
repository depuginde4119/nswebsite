package com.nrgsavers.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nrgsavers.dto.NewUser;
import com.nrgsavers.model.UserCRUD;

public class ProfileEdit extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		httpRequestHandler( req,  resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		httpRequestHandler( req,  resp);
	}




	private void httpRequestHandler(HttpServletRequest req,
			HttpServletResponse resp) {
	String userId =	req.getParameter("id");
	NewUser dto = new UserCRUD().getUserById(userId);
	req.setAttribute("userDetails", dto);
	
	// Redirect to view jsp.
	RequestDispatcher rd=req.getRequestDispatcher("/profileEditView");
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
