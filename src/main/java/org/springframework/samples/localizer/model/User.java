package org.springframework.samples.localizer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;



@Entity
@Table(name = "users")
public class User{
	@Id
	@NotBlank
	String username;
	
	@NotBlank
	String password;
	
	@NotNull
	boolean enabled;
	
	@NotNull
	boolean pagado = false;
	
	

	public boolean isPagado() {
		return pagado;
	}

	public void setPagado(boolean pagado) {
		this.pagado = pagado;
	}

	@Column(name = "first_name")
	@NotBlank
	protected String firstName;

	@Column(name = "last_name")
	@NotBlank
	protected String lastName;
	
	@OneToOne(optional=true)
	private Tienda tienda;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
	private Set<Authorities> authorities;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Authorities> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<Authorities> authorities) {
		this.authorities = authorities;
	}
	
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public Tienda getTienda() {
		return tienda;
	}

	public void setTienda(Tienda tienda) {
		this.tienda = tienda;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", enabled=" + enabled + ", pagado=" + pagado
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", tienda=" + tienda + ", authorities="
				+ authorities + "]";
	}
	
}
