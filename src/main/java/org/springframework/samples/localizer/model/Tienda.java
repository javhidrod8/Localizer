package org.springframework.samples.localizer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

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
	
	@Column(name = "codigoPostal")
	@NotEmpty
	private Integer codigoPostal;
	
	@Column(name = "telefono")
	@NotEmpty
	private Integer telefono;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tienda", fetch = FetchType.EAGER)
	private Set<Producto> productos;

	@Override
	public String toString() {
		return "Tienda [nombre=" + nombre + ", descripcion=" + descripcion + ", calle=" + calle + ", provincia="
				+ provincia + ", codigoPostal=" + codigoPostal + ", telefono=" + telefono + ", productos=" + productos
				+ "]";
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
	
	

}