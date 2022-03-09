package org.springframework.samples.petclinic.model;

import java.util.Set;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Positive;

import org.hibernate.annotations.Cascade;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "productos")
public class Producto extends BaseEntity{
	
	private String nombre;
	
	@Positive
	private Double precio;
	
	private String marca;
	
	private String descripcion;
	
	private Boolean verificado;
	
	private String imagen;
	
	@ManyToMany(cascade = javax.persistence.CascadeType.ALL)
    @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE})
    @JoinTable(name = "producto_intolerancias", 
    joinColumns = @JoinColumn(name = "producto_id"),
    inverseJoinColumns = @JoinColumn(name = "intolerancias_id"))
    @ElementCollection(targetClass = Intolerancias.class)
	private Set<Intolerancias> intolerancia;
	
	private Preferencias preferencia;
	
	@ManyToOne
	@JoinColumn(name="tienda_id")
	private Tienda tienda;

	@Override
	public String toString() {
		return "Producto [nombre=" + nombre + ", precio=" + precio + ", marca=" + marca + ", descripcion=" + descripcion
				+ ", verificado=" + verificado + ", imagen=" + imagen + ", intolerancia=" + intolerancia
				+ ", preferencia=" + preferencia + "]";
	}
	

}
