package org.springframework.samples.localizer.model;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "reservas")
public class Reserva extends BaseEntity{
	
	@OneToOne
	private Tienda tienda;
	
	@OneToOne
	private Producto producto;
	
	@NotNull
	private Integer cantidad;
	
	@OneToOne
	private User user;
	
	private String comentario;
	
	@NotNull
	private Double precio_total;
	
	@NotNull
	private Estado estado;

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Tienda getTienda() {
		return tienda;
	}

	public void setTienda(Tienda tienda) {
		this.tienda = tienda;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public Reserva(Tienda tienda, Producto producto) {
		super();
		this.tienda = tienda;
		this.producto = producto;
	}
	
	public Reserva() {
		super();
	}

	@Override
	public String toString() {
		return "Reserva [tienda=" + tienda + ", producto=" + producto + "]";
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Double getPrecio_total() {
		return precio_total;
	}

	public void setPrecio_total(Double precio_total) {
		this.precio_total = precio_total;
	}
	
	
	
	
	
	
	

}
