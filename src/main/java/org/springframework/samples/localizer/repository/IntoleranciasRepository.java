package org.springframework.samples.localizer.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.samples.localizer.model.Intolerancias;

public interface IntoleranciasRepository extends JpaRepository<Intolerancias, Integer> {

	@Query("select i from Intolerancias i")
	public Collection<Intolerancias> findAllIntolerancias();

	@Query("select i from Intolerancias i where i.nombre=?1")
	public Intolerancias findIntoleranciaByName(String nombre);

}