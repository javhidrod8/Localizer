package org.springframework.samples.localizer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "intolerancias")
public class Intolerancias extends BaseEntity{
	    
        @Column(name = "nombre")
        private String nombre;
        
        @ManyToMany(fetch = FetchType.LAZY,
        	      cascade = {
        	              CascadeType.PERSIST,
        	              CascadeType.MERGE
        	          },mappedBy = "intolerancia")
    	private Set<Producto> productos;

		public String getNombre() {
			return nombre;
		}

		public void setNombre(String nombre) {
			this.nombre = nombre;
		}

		@Override
		public String toString() {
			return nombre+ " ";
		}

        
}