package org.springframework.samples.localizer.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.repository.IntoleranciasRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IntoleranciasService {

	private IntoleranciasRepository intoleranciasRepository;

	@Autowired
	public IntoleranciasService(IntoleranciasRepository intoleranciasRepository) {
		this.intoleranciasRepository = intoleranciasRepository;
	}

	@Transactional(readOnly = true)
	public Collection<Intolerancias> findAllIntolerancias() throws DataAccessException {
		return intoleranciasRepository.findAllIntolerancias();
	}
}