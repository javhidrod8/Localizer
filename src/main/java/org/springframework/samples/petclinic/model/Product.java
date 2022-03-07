package org.springframework.samples.petclinic.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Positive;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "products")
public class Product extends BaseEntity{
	
	private String nombre;
	
	@Positive
	private Double precio;
	
	private String marca;
	
	private String descripcion;
	
	private Boolean verificado;
	
	private String imagen;
	
	private Intolerancias intolerancia;
	
	private Preferencias preferencia;
	
	//@OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.EAGER)
	//private Set<Tienda> tiendas;

	@Override
	public String toString() {
		return "Product [nombre=" + nombre + ", precio=" + precio + ", marca=" + marca + ", descripcion=" + descripcion
				+ ", verificado=" + verificado + ", imagen=" + imagen + ", intolerancia=" + intolerancia
				+ ", preferencia=" + preferencia + "]";
	}
	

}
