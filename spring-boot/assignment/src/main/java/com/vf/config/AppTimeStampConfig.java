package com.vf.config;

import java.util.Optional;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
/**
 * Spring Config Class
 */
@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorProvider")
public class AppTimeStampConfig {
	@Bean
	public AuditorAware<String> auditorProvider() {
		return () -> Optional.ofNullable("assignment");
	}
}
