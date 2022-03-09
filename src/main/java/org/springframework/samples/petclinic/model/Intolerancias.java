package org.springframework.samples.petclinic.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "intolerancias")
public class Intolerancias extends BaseEntity{
        @Id
        @GeneratedValue
        @Column(name = "id")
        private Integer id = null;

        @Column(name = "nombre")
        private String nombre;


}