package org.springframework.samples.localizer.model;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "reservas")
public class Reserva extends BaseEntity{
	
	@OneToOne
	@NotNull
	private Tienda tienda;
	
	@OneToOne
	@NotNull
	private Producto producto;
	
	@NotNull
	private Integer cantidad;
	
	@OneToOne
	@NotNull
	private User user;
	
	private String comentario;
	
	//Cantidad
	//Precio final
	//Usuario

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
	
	
	
	
	

}
