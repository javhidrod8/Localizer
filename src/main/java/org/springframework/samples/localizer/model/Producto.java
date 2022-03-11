package org.springframework.samples.localizer.model;

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
@Table(name = "productos")
public class Producto extends BaseEntity{
	
	private String nombre;
	
	@Positive
	private Double precio;
	
	private String marca;
	
	private String descripcion;
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Boolean getVerificado() {
		return verificado;
	}

	public void setVerificado(Boolean verificado) {
		this.verificado = verificado;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public Set<Intolerancias> getIntolerancia() {
		return intolerancia;
	}

	public void setIntolerancia(Set<Intolerancias> intolerancia) {
		this.intolerancia = intolerancia;
	}

	public Preferencias getPreferencia() {
		return preferencia;
	}

	public void setPreferencia(Preferencias preferencia) {
		this.preferencia = preferencia;
	}

	public Tienda getTienda() {
		return tienda;
	}

	public void setTienda(Tienda tienda) {
		this.tienda = tienda;
	}

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
