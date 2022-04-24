package org.springframework.samples.localizer.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;


@Entity
@Table(name = "productosAPI")
public class ProductoAPI extends BaseEntity {

	@NotBlank
	private String barCode;

	@Positive
	private Double precio;

//	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
//	@JoinTable(name = "producto_intolerancias", joinColumns = @JoinColumn(name = "producto_id"), inverseJoinColumns = @JoinColumn(name = "intolerancias_id"))
//	

//	@ManyToOne
//	@JoinColumn(name = "tienda_id")
//	@NotNull
//	private Tienda tienda;

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

	
	public ProductoAPI() {
		super();
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

//	public Tienda getTienda() {
//		return tienda;
//	}
//
//	public void setTienda(Tienda tienda) {
//		this.tienda = tienda;
//	}
	

    public String getBarCode() {
		return barCode;
	}

	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}

	@Override
	public String toString() {
		return "ProductoAPI [barCode=" + barCode + ", precio=" + precio + "]";
	}

	

}
