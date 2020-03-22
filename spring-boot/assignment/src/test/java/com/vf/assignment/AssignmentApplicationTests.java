package com.vf.assignment;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.Assert;



@SpringBootTest
public class AssignmentApplicationTests {

	@Test
	void contextLoads() {
	}

	@Autowired
	private TestRestTemplate restTemplate;
	@LocalServerPort
	private int port=5000;
	
	private String getRootUrl() {
		return "http://localhost:" + port;
	}
	@Test
	public void testGetAllTimeStamps() {
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<String>(null, headers);
		ResponseEntity<String> response = restTemplate.exchange(getRootUrl() + "/app/getALLTimeStamps",
		HttpMethod.GET, entity, String.class);
		Assert.isNull(response.getBody());
	}

}
