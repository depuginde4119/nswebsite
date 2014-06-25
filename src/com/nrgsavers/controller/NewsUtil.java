package com.nrgsavers.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nrgsavers.dto.NewsDto;
import com.nrgsavers.model.UserCRUD;

public class NewsUtil extends HttpServlet{
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
		 List<NewsDto> newsList = new UserCRUD().getActiveNews();
		  
			// Put data into Request Object
				req.setAttribute("newsList", newsList);
				
				// Redirect to view jsp.
				RequestDispatcher rd=req.getRequestDispatcher("/newsView");
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
