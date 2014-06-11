package model;

import DTO.DBComponent;
import DTO.NewUser;
import DTO.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserCRUD implements CRUD{

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
		NewUser userDto = (NewUser) dbComponent;

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = 
                "INSERT INTO User (FirstName, EmailId, Mobile, Password) " +
                "VALUES (?, ?, ?, ?)";
        try
        {        
            ps = connection.prepareStatement(query);
            ps.setString(1, userDto.getName());
            ps.setString(2, userDto.getEmail());
            ps.setString(3, userDto.getPhone());
            ps.setString(4, userDto.getPassword());
            ps.executeUpdate();
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
	public boolean checkEmailAvailability(DBComponent dbComponent)
	{
		ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        NewUser userDto = (NewUser) dbComponent;
        String query = "SELECT EmailId FROM user WHERE EmailId = ?";
        try
        {
            ps = connection.prepareStatement(query);
            ps.setString(1, userDto.getEmail());
            rs = ps.executeQuery();
          
            if(rs.next())
            {
              return true;
            }
            else
            {
            	return false;
            }
           
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return false;
        }        
        finally
        {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
	}

}
