package com.vf.services;

import java.util.List;
import java.util.Optional;

import com.vf.entities.AppTimeStamp;

/**
 * This is the Service class to get the details about timestamps
 */
public interface AppTimeStampService {

	public List<AppTimeStamp> findAll();

	public Optional<AppTimeStamp> findById(Long id);

	public AppTimeStamp save(AppTimeStamp ats);

	public void deleteById(Long id);

}
