package com.vf.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vf.entities.AppTimeStamp;
import com.vf.repositories.AppTimeStampRepository;
import com.vf.services.AppTimeStampService;

/**
 * This is the implementation class to get the details about timestamps
 */

@Service("appTimeStampService")
public class AppTimeStampServiceImpl implements AppTimeStampService {

	@Autowired
	private AppTimeStampRepository atsRepository;

	// method to get all the records in API_TIMESTAMP table
	@Override
	public List<AppTimeStamp> findAll() {
		return atsRepository.findAll();
	}

	// method to save the timestamp record in API_TIMESTAMP table
	@Override
	public AppTimeStamp save(AppTimeStamp dts) {
		return atsRepository.save(dts);
	}

	// method to get a particular record with the given ID in API_TIMESTAMP table
	@Override
	public Optional<AppTimeStamp> findById(Long id) {
		return atsRepository.findById(id);

	}

	// method to delete a particular record with the given ID in API_TIMESTAMP table
	@Override
	public void deleteById(Long id) {
		atsRepository.deleteById(id);

	}

}
