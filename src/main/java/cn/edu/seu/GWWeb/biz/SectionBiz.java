/**
 * 
 */
package cn.edu.seu.GWWeb.biz;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import cn.edu.seu.GWWeb.constant.Constants;
import cn.edu.seu.whitemirror.dto.SectionDTO;

/**
 * @author snow
 *
 */
@Service
public class SectionBiz {
	
	private static Logger logger = LoggerFactory.getLogger(SectionBiz.class);
	
	@Autowired
	private RestTemplate restTemplate;
	
	public List<SectionDTO> getIndexSections() {
		try {
			String url = "http://localhost:8080/whitemirror/apps/gw/sections";
			HttpHeaders requestHeaders = new HttpHeaders();
			requestHeaders.setContentType(new MediaType("application", "json"));
			requestHeaders.add("API-Key", Constants.API_KEY);
			HttpEntity<?> requestEntity = new HttpEntity<Object>(requestHeaders);
			ResponseEntity<SectionDTO[]> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, SectionDTO[].class);
			if (responseEntity.getStatusCode() != HttpStatus.OK) {
				return null;
			}
			return Arrays.asList(responseEntity.getBody());
		} catch (Exception ex) {
			logger.error("Exception in SectionBiz.getIndexSections, ex: ", ex);
			return null;
		}
	}
}
