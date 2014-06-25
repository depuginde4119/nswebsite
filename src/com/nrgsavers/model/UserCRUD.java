package com.nrgsavers.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nrgsavers.dto.DBComponent;
import com.nrgsavers.dto.NewUser;
import com.nrgsavers.dto.NewsDto;
import com.nrgsavers.dto.Product;

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
	public void editProfile(DBComponent dbComponent)
	{
		NewUser userDto = (NewUser) dbComponent;

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = 
                "UPDATE user SET FirstName = ?, Mobile = ?, Password = ? WHERE EmailId = ?";
        try
        {        
            ps = connection.prepareStatement(query);
            ps.setString(1, userDto.getName());
         
            ps.setString(2, userDto.getPhone());
            ps.setString(3, userDto.getPassword());
            ps.setString(4, userDto.getEmail());
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
            	query = "SELECT EmailId FROM user WHERE EmailId = ? AND TemporaryPassword = ?";
            	  ps = connection.prepareStatement(query);
                  ps.setString(1, userDto.getEmail());
                  ps.setString(2, userDto.getPassword());
                  rs = ps.executeQuery();
                  if(rs.next())
                  {
                	  //update password with temp password and remove temp password here
                	  query = "UPDATE user SET TemporaryPassword = ?, Password = ? WHERE EmailId = ?";
                	  ps = connection.prepareStatement(query);
                      ps.setString(1, "");
                      ps.setString(2, userDto.getPassword());
                      ps.setString(3, userDto.getEmail());
                      ps.executeUpdate();
                	  return true;
                  }
                  else{
            	return false;
                  }
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
        String query = "SELECT id, EmailId, FirstName, Mobile, Password, Role FROM user WHERE EmailId = ? ";
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
            	userDto2.setRole(rs.getString("Role"));
            	userDto2.setId(rs.getString("id"));
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
public NewUser getUserById(String userId)
{
	ConnectionPool pool = ConnectionPool.getInstance();
    Connection connection = pool.getConnection();
    PreparedStatement ps = null;
    ResultSet rs = null;
   
    NewUser userDto2 = new NewUser();
    String query = "SELECT id, EmailId, FirstName, Mobile, Password, Role FROM user WHERE id = ? ";
    try
    {
        ps = connection.prepareStatement(query);
        ps.setString(1, userId);
       
        rs = ps.executeQuery();
      
        while(rs.next())
        {
        	userDto2.setEmail(rs.getString("EmailId"));
        	userDto2.setName(rs.getString("FirstName"));
        	userDto2.setPhone(rs.getString("Mobile"));
        	userDto2.setRole(rs.getString("Role"));
        	userDto2.setId(rs.getString("id"));
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
	public List<NewsDto> getActiveNews()
	{
		List<NewsDto> newsList = new ArrayList<NewsDto>();

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		NewsDto newsdto ;
		String query = "SELECT id, Heading, Description, Status, DATE_FORMAT(CreatedDate, '%d/%m/%Y') AS createddate, Url FROM news WHERE Status='Y' LIMIT 10";
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
				newsdto.setCreatedDate(rs.getString("createddate"));
				newsdto.setUrl(rs.getString("Url"));
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
