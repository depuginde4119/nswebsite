package com.nrgsavers.dto;

public class NewsDto extends DBComponent{
private String Title;
private String Description;
private String Url;
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
	// TODO Auto-generated method stub
	return null;
}

}
