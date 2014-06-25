package com.nrgsavers.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.nrgsavers.dto.DBComponent;
import com.nrgsavers.dto.NewUser;
import com.nrgsavers.dto.NewsDto;

public class AdminCRUD implements CRUD{

	@Override
	public DBComponent update(DBComponent dbComponent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object select(DBComponent dbComponent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(DBComponent dbComponent) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(DBComponent dbComponent) {
		NewsDto newsDto = (NewsDto) dbComponent;
		Calendar cal = Calendar.getInstance();
		
		
		System.out.println("am in admin news create db method");
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;

		String query = 
				"INSERT INTO news (Heading, Description, Status, CreatedDate, Url) " +
						"VALUES (?, ?, ?, ?, ?)";
		try
		{        
			ps = connection.prepareStatement(query);
			ps.setString(1, newsDto.getTitle());
			ps.setString(2, newsDto.getDescription());
			ps.setString(3, newsDto.getStatus());
			ps.setDate(4, new java.sql.Date(cal.getTimeInMillis()));
			ps.setString(5, newsDto.getUrl());
			System.out.println(ps.executeUpdate());
		}
		catch(SQLException e)
		{
			e.printStackTrace();

		}
		finally
		{
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}
	public List<NewsDto> getAllNews()
	{
		List<NewsDto> newsList = new ArrayList<NewsDto>();

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		NewsDto newsdto ;
		String query = "SELECT id, Heading, Description, Status FROM news";
		try
		{
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();        
			while(rs.next())
			{
				newsdto = new NewsDto();
				newsdto.setId(rs.getString("id"));
				newsdto.setTitle(rs.getString("Heading"));
				newsdto.setDescription(rs.getString("Description"));
				newsdto.setStatus(rs.getString("Status"));
				newsList.add(newsdto);
			}

			return newsList;

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
		return newsList;
	}

}
