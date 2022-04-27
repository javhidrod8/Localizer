package org.springframework.samples.localizer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;


@Entity
@Table(name = "productos")
public class Producto extends BaseEntity {

	@NotBlank
	private String nombre;

	@Positive
	private Double precio;

	@NotBlank
	private String marca;

	private String descripcion;

	@NotNull
	private Estado estado;

	@NotNull
	private Boolean promocionado;

	@NotBlank
	@Pattern(regexp = "(https:\\/\\/.+\\.(?:png|jpg|jpeg|gif|png|svg))")
	private String imagen;
	
	private String motivo;

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "producto_intolerancias", joinColumns = @JoinColumn(name = "producto_id"), inverseJoinColumns = @JoinColumn(name = "intolerancias_id"))
	private Set<Intolerancias> intolerancia;

	private Preferencias preferencia;

	@ManyToOne
	@JoinColumn(name = "tienda_id")
	@NotNull
	private Tienda tienda;

//	public Producto(Producto producto) {
//		this.descripcion = producto.getDescripcion();
//		this.imagen = producto.getImagen();
//		this.marca = producto.getMarca();
//		this.nombre = producto.getNombre();
//		this.precio = producto.getPrecio();
//		this.preferencia = producto.getPreferencia();
//		this.intolerancia = producto.getIntolerancia();
//		this.promocionado = producto.getPromocionado();
//		this.estado = producto.getEstado();
//	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public Producto() {
		super();
	}

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

	public Boolean getPromocionado() {
		return promocionado;
	}

	public void setPromocionado(Boolean promocionado) {
		this.promocionado = promocionado;
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

	@Override
	public String toString() {
		return "Producto [nombre=" + nombre + ", precio=" + precio + ", marca=" + marca + ", descripcion=" + descripcion
				+ ", promocionado=" + promocionado + ", imagen=" + imagen + ", intolerancia=" + intolerancia
				+ ", preferencia=" + preferencia + ", estado=" + estado + "]";
	}

}
