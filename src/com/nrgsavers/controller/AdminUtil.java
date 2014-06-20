package com.nrgsavers.controller;

import java.io.IOException;

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
import com.nrgsavers.dto.NewsDto;
import com.nrgsavers.model.AdminCRUD;
import com.nrgsavers.model.UserCRUD;

public class AdminUtil extends HttpServlet{
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
			if(uri.equals(Constants.ADD_NEWS))
			{
				NewsDto newsdto = new NewsDto();
				newsdto.setTitle(req.getParameter("news_title"));
				newsdto.setDescription(req.getParameter("news_desc"));
				newsdto.setUrl(req.getParameter("news_url"));
				
				new AdminCRUD().create(newsdto);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}
