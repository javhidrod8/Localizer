package org.springframework.samples.localizer.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.localizer.model.Intolerancias;
import org.springframework.samples.localizer.repository.IntoleranciasRepository;

@Service
public class IntoleranciasService {

	private IntoleranciasRepository IntoleranciasRepository;
	
	@Autowired
	public IntoleranciasService(IntoleranciasRepository IntoleranciasRepository) {
		this.IntoleranciasRepository = IntoleranciasRepository;
	}
	
	@Transactional(readOnly = true)
	public Intolerancias findIntoleranciasById(int id) throws DataAccessException {
		return IntoleranciasRepository.findIntoleranciasById(id);
	}

	
	@Transactional(readOnly = true)
	public Collection<Intolerancias> findAllIntolerancias() throws DataAccessException{
		return IntoleranciasRepository.findAll();
	}
	
	@Transactional
	public void saveIntolerancias(Intolerancias intolerancias) throws DataAccessException{
		IntoleranciasRepository.save(intolerancias);
	}
}
