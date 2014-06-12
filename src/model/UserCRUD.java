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
	public boolean checkAuthentication(DBComponent dbComponent)
	{
		ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        NewUser userDto = (NewUser) dbComponent;
        String query = "SELECT EmailId FROM user WHERE EmailId = ? AND Password = ?";
        try
        {
            ps = connection.prepareStatement(query);
            ps.setString(1, userDto.getEmail());
            ps.setString(2, userDto.getPassword());
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

	public NewUser getUser(DBComponent dbComponent) {
		ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        NewUser userDto = (NewUser) dbComponent;
        NewUser userDto2 = new NewUser();
        String query = "SELECT EmailId, FirstName, Mobile, Password FROM user WHERE EmailId = ? ";
        try
        {
            ps = connection.prepareStatement(query);
            ps.setString(1, userDto.getEmail());
           
            rs = ps.executeQuery();
          
            while(rs.next())
            {
            	userDto2.setEmail(rs.getString("EmailId"));
            	userDto2.setName(rs.getString("FirstName"));
            	userDto2.setPhone(rs.getString("Mobile"));
            
            }
            return userDto2;
           
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return userDto2;
        }        
        finally
        {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
	}

	public void setTempPassword(DBComponent dbComponent) {
		NewUser userDto = (NewUser) dbComponent;

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = 
                "UPDATE User SET TemporaryPassword = ? WHERE EmailId = ? ";
                
        try
        {        
            ps = connection.prepareStatement(query);
            ps.setString(1, userDto.getTempPassword());
            ps.setString(2, userDto.getEmail());
           
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

}
