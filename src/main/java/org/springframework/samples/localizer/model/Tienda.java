package org.springframework.samples.localizer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "tiendas")
public class Tienda extends BaseEntity{
	
	@Column(name = "nombre")
	@NotBlank
	private String nombre;
	
	@Column(name = "descripcion")
	@NotBlank
	private String descripcion;
	
	@Column(name = "calle")
	@NotBlank
	private String calle;
	
	@Column(name = "provincia")
	@NotBlank
	private String provincia;
  
	@Column(name = "codigo_postal")
	@NotBlank
//	@Pattern(regexp="^(?:0[1-9]|[1-4]\\d|5[0-2])\\d{3}$")
	private String codigoPostal;
	
	@Column(name = "telefono")
	@NotBlank
	@Pattern(regexp="^(?:(?:\\+?[0-9]{2,4})?[ ]?[6789][0-9 ]{8,13})$")
	private String telefono;
	
	@Column(name = "imagen")
	@NotBlank
	private String imagen;
	
	@Column(name = "horario")
	@NotBlank
	private String horario;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tienda", fetch = FetchType.EAGER)
	private Set<Producto> productos;
	
	@OneToOne(optional=true)
	private User user;


	public Tienda() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Tienda [nombre=" + nombre + ", descripcion=" + descripcion + ", calle=" + calle + ", provincia="
				+ provincia + ", codigoPostal=" + codigoPostal + ", telefono=" + telefono + ", imagen=" + imagen
				+ ", horario=" + horario + ", productos=" + productos + "]";
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Set<Producto> getProductos() {
		return productos;
	}

	public void setProductos(Set<Producto> productos) {
		this.productos = productos;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	
	
	

}
