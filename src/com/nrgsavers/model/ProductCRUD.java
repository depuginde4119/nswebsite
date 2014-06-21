package com.nrgsavers.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nrgsavers.dto.DBComponent;
import com.nrgsavers.dto.Product;
import com.nrgsavers.dto.ProductType;


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

		Product product = (Product) dbComponent;

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = 
                "INSERT INTO Product ( Name, Description,  ProductTypeId, , Image, Price,Specifications) " +
                "VALUES (?,?, ?, ?,?,?)";
        try
        {        
            ps = connection.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setInt(3, product.getTypeId());
            ps.setString(6, product.getImage());
            ps.setDouble(5, product.getPrice());
            ps.setString(4, product.getSpecification());
         
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

	public List<ProductType> getAllProductType() {
		
		 ConnectionPool pool = ConnectionPool.getInstance();
	        Connection connection = pool.getConnection();
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        
	        String query = "SELECT id, TypeName,TypeDescription FROM producttype; ";
	        List<ProductType> productTypes= new ArrayList<ProductType>();
            try { 
	        ps = connection.prepareStatement(query);
	     
				rs = ps.executeQuery();
			
            ProductType producttype = null;
            
            while (rs.next())
            {
            	producttype = new ProductType();
            	producttype.setProdutTypeID(rs.getInt("id"));
            	producttype.setName(rs.getString("TypeName"));
            	producttype.setDescription(rs.getString("TypeDescription"));
            	
            	productTypes.add(producttype);
	               
            
            }
            
            } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        

		return productTypes;
	}

	public List<Product> getProducts(String productType) {

		 ConnectionPool pool = ConnectionPool.getInstance();
	        Connection connection = pool.getConnection();
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        
	        String query = "SELECT p.id, Name, ProductTypeId, Description, Image, Price,Specifications,pt.TypeName,pt.TypeDescription FROM product p join producttype pt on (p.ProductTypeId= pt.id) where pt.id= ?";
	        try
	        {
	            ps = connection.prepareStatement(query);
	            ps.setString(1, productType);
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

	public Product getProduct(String productID) {
		ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "SELECT p.id, Name, ProductTypeId, Description, Image, Price,Specifications,pt.TypeName,pt.TypeDescription FROM product p join producttype pt on (p.ProductTypeId= pt.id) where p.id= ?";
        try
        {
            ps = connection.prepareStatement(query);
            ps.setString(1, productID);
            rs = ps.executeQuery();
            Product product = null;

            if (rs.next())
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

            }
            return product;
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

	public List<Product> getAllProduct() {
		ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "SELECT p.id, Name, ProductTypeId, Description, Image, Price,Specifications,pt.TypeName,pt.TypeDescription FROM product p join producttype pt on (p.ProductTypeId= pt.id)";
        try
        {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            Product product = null;
            List<Product> products= null;
            boolean ifFirst=true;
            while (rs.next())
            {
            	if(ifFirst)
            	{
            		products= new ArrayList<Product>();
            		ifFirst=false;
            	}
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

	public void delete(String productId) {
		ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "DELETE FROM PRODUCT p WHERE p.id=?";
        try
        {
            ps = connection.prepareStatement(query);
            ps.setString(1, productId);
            ps.executeUpdate();
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
		
	}

	public ArrayList<Product> searchProduct(String keyword) {
		
		ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        Product product = null;
        ArrayList<Product> products= null;
        boolean ifFirst=true;
        String query = "SELECT p.id, Name, ProductTypeId, Description, Image, Price,Specifications,pt.TypeName,pt.TypeDescription FROM product p join producttype pt on (p.ProductTypeId= pt.id) where Lower(Name) like Lower('%"+keyword+"%') or Lower(Description) like Lower('%"+keyword+"%');";
        try
        {
            ps = connection.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next())
            {
            	
            	if(ifFirst)
            	{
            		products= new ArrayList<Product>();
            		ifFirst=false;
            	}
               product = new Product();
               product.setName(rs.getString("Name"));
               product.setDescription(rs.getString("Description"));
               product.setImage(rs.getString("Image"));
               product.setPrice(rs.getDouble("Price"));
               product.setTypeName(rs.getString("TypeName"));
               product.setSpecification(rs.getString("Specifications"));
               product.setTypeDescription(rs.getString("TypeDescription"));
               product.setTypeId(rs.getInt("ProductTypeId"));
               products.add(product);
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
		
		
		return products;
	}

}
