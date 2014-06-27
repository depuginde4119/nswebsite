package com.nrgsavers.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nrgsavers.dto.NewsDto;
import com.nrgsavers.dto.Product;
import com.nrgsavers.model.ConnectionPool;
import com.nrgsavers.model.DBUtil;
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


	public static ArrayList<NewsDto> searchNews(String keyword) {
	
		ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        NewsDto news = null;
        ArrayList<NewsDto> newss= null;
        boolean ifFirst=true;
        String query = "SELECT id, Heading, Description, Status, CreatedDate, Url FROM news where Status='active' and Lower(Heading) like Lower('%"+keyword+"%') or Lower(Description) like Lower('%"+keyword+"%')  ";
        try
        {
            ps = connection.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next())
            {
            	
            	if(ifFirst)
            	{
            		newss= new ArrayList<NewsDto>();
            		ifFirst=false;
            	}
            	news= new NewsDto();
            	news.setDescription(rs.getString("Description"));
            	news.setTitle(rs.getString("Heading"));
            	news.setUrl(rs.getString("Url"));
            	news.setStatus(rs.getString("Status"));
            	news.setCreatedDate(rs.getString("createdDate"));
            	
            	newss.add(news);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
          
        }        
        finally
        {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
		
		
		return newss;
	
	}
}
