/**
 * 
 */
package model;

import java.util.List;

import DTO.DBComponent;

/**
 * @author HKS
 *
 */
public interface CRUD 
{
	
	public DBComponent update(DBComponent dbComponent);
	public Object select(DBComponent dbComponent);
	public void delete(DBComponent dbComponent);
	public void create(DBComponent dbComponent);
}
