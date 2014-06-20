package com.nrgsavers.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = 
                "INSERT INTO news (Heading, Description) " +
                "VALUES (?, ?)";
        try
        {        
            ps = connection.prepareStatement(query);
            ps.setString(1, newsDto.getTitle());
            ps.setString(2, newsDto.getDescription());
          
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

}
