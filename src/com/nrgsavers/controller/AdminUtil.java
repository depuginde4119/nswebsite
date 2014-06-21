package com.nrgsavers.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nrg.common.Constants;
import com.nrg.common.JQGridData;
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
		System.out.println("testing");
		System.out.println(":::::::::::::"+temp_uri);
		int p = temp_uri.lastIndexOf("/");
		System.out.println(p);
		try{
			String uri=temp_uri.substring(p+1);
			if(uri.equals(Constants.ADD_NEWS))
			{
				System.out.println("1");
				NewsDto newsdto = new NewsDto();
				newsdto.setTitle(req.getParameter("news_title"));
				newsdto.setDescription(req.getParameter("news_desc"));
				newsdto.setUrl(req.getParameter("news_url"));
				newsdto.setStatus("Y");
				System.out.println("2");
				new AdminCRUD().create(newsdto);
			}
			if(uri.equals(Constants.VIEW_ALL_NEWS))
			{
				int totalNumberOfPages = 1;
			     int currentPageNumber = 1;
			     int totalNumberOfRecords = 8; // All in there are 8 records in our dummy data object
			     List<NewsDto> newsList = new AdminCRUD().getAllNews();
			     JQGridData<NewsDto> gridData = new JQGridData<NewsDto>(totalNumberOfPages, currentPageNumber, totalNumberOfRecords, newsList);
			     System.out.println("Grid Data: " + gridData.getJsonString());
			     resp.getWriter().write(gridData.getJsonString());
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}
