package org.springframework.samples.petclinic.model;

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
@Getter
@Setter
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
	@NotEmpty
	private Integer codigo_postal;
	
	@Column(name = "telefono")
	@NotEmpty
	private Integer telefono;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "tienda", fetch = FetchType.EAGER)
	private Set<Producto> productos;

	@Override
	public String toString() {
		return "Tienda [nombre=" + nombre + ", descripcion=" + descripcion + ", calle=" + calle + ", provincia="
				+ provincia + ", codigo_postal=" + codigo_postal + ", telefono=" + telefono + ", productos=" + productos
				+ "]";
	}
	
	

}
