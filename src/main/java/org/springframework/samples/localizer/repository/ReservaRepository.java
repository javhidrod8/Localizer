package org.springframework.samples.localizer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.samples.localizer.model.Reserva;

public interface ReservaRepository extends JpaRepository<Reserva, Integer>{

}
