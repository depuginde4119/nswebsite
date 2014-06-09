package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.DBComponent;
import DTO.Product;

public class ProductCRUD implements CRUD {

	@Override
	public DBComponent update(DBComponent dbComponent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object select(DBComponent dbComponent) 
	{

		 ConnectionPool pool = ConnectionPool.getInstance();
	        Connection connection = pool.getConnection();
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        
	        String query = "SELECT p.id, Name, ProductTypeId, Description, Image, Price,Specifications,pt.TypeName,pt.TypeDescription FROM product p join producttype pt on (p.ProductTypeId= pt.id);";
	        try
	        {
	            ps = connection.prepareStatement(query);
	          
	            rs = ps.executeQuery();
	            Product product = null;
	            List<Product> products= new ArrayList<Product>();
	            while (rs.next())
	            {
	               product = new Product();
	               product.setId(rs.getInt("id"));
	               product.setName(rs.getString("Name"));
	               product.setDescription(rs.getString("Description"));
	               product.setImage(rs.getString("Image"));
	               product.setPrice(rs.getDouble("Price"));
	               product.setSpecification(rs.getString("Specifications"));
	               product.setTypeName(rs.getString("TypeName"));
	               product.setTypeDescription(rs.getString("TypeDescription"));
	               product.setTypeId(rs.getInt("ProductTypeId"));
	               products.add(product);
	            }
	            return products;
	        }
	        catch (SQLException e)
	        {
	            e.printStackTrace();
	            return null;
	        }        
	        finally
	        {
	            DBUtil.closeResultSet(rs);
	            DBUtil.closePreparedStatement(ps);
	            pool.freeConnection(connection);
	        }
	}

	@Override
	public void delete(DBComponent dbComponent) {
		// TODO Auto-generated method stub

	}

	@Override
	public void create(DBComponent dbComponent) {

//		Product product = (Product) dbComponent;
//
//        ConnectionPool pool = ConnectionPool.getInstance();
//        Connection connection = pool.getConnection();
//        PreparedStatement ps = null;
//
//        String query = 
//                "INSERT INTO User (FirstName, LastName, EmailAddress) " +
//                "VALUES (?, ?, ?)";
//        try
//        {        
//            ps = connection.prepareStatement(query);
//            ps.setString(1, product.getFirstName());
//            ps.setString(2, product.getLastName());
//            ps.setString(3, product.getEmailAddress());
//            return ps.executeUpdate();
//        }
//        catch(SQLException e)
//        {
//            e.printStackTrace();
//            return 0;
//        }
//        finally
//        {
//            DBUtil.closePreparedStatement(ps);
//            pool.freeConnection(connection);
//        }

	}

}
