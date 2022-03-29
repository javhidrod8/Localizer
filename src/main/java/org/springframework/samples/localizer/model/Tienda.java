package org.springframework.samples.localizer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "tiendas")
public class Tienda extends BaseEntity{
	
	@Column(name = "nombre")
	@NotEmpty
	private String nombre;
	
	@Column(name = "descripcion")
	@NotEmpty
	private String descripcion;
	
	@Column(name = "calle")
	@NotEmpty
	private String calle;
	
	@Column(name = "provincia")
	@NotEmpty
	private String provincia;
  
	@Column(name = "codigo_postal")
	private Integer codigoPostal;
	
	@Column(name = "telefono")
	private Integer telefono;
	
	@Column(name = "imagen")
	@NotEmpty
	private String imagen;
	
	@Column(name = "horario")
	@NotEmpty
	private String horario;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tienda", fetch = FetchType.EAGER)
	private Set<Producto> productos;
	
	@OneToOne(optional=true)
	private User user;

	public Tienda(Tienda tienda) {
		this.calle=tienda.getCalle();
		this.codigoPostal=tienda.getCodigoPostal();
		this.descripcion=tienda.getDescripcion();
		this.horario=tienda.getHorario();
		this.imagen=tienda.getImagen();
		this.nombre=tienda.getNombre();
		this.provincia=tienda.getProvincia();
		this.telefono=tienda.getTelefono();
	}

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

	public Integer getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(Integer codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public Integer getTelefono() {
		return telefono;
	}

	public void setTelefono(Integer telefono) {
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
