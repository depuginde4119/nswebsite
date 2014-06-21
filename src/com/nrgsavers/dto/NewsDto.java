package com.nrgsavers.dto;

public class NewsDto extends DBComponent{
	private String id;
private String Title;
private String Description;
private String Url;
private String Status;
public String getTitle() {
	return Title;
}
public void setTitle(String title) {
	Title = title;
}
public String getDescription() {
	return Description;
}
public void setDescription(String description) {
	Description = description;
}
public String getUrl() {
	return Url;
}
public void setUrl(String url) {
	Url = url;
}
@Override
public String toString() {
	  return "{\"id\":\"" + id + "\", \"title\":\"" + Title + "\", \"description\":\""
	            + Description + "\", \"url\":\"" + Url + "\", \"status\":\"" + Status + "\"}";
}
public String getStatus() {
	return Status;
}
public void setStatus(String status) {
	Status = status;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}


}
