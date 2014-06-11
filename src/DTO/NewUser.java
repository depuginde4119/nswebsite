package DTO;

public class NewUser extends DBComponent{
	private String Name;
	private String Phone;
	private String Email;
	private String Password;
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

}
