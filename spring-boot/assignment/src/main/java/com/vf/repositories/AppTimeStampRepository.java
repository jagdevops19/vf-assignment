package com.vf.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vf.entities.AppTimeStamp;

/**
 * This is the Repository class to which maps to timestamps
 */
@Repository("appTimeStampRepository")
public interface AppTimeStampRepository extends JpaRepository<AppTimeStamp, Long> {

}
