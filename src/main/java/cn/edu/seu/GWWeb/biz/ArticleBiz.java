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
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import cn.edu.seu.GWWeb.constant.Constants;
import cn.edu.seu.whitemirror.dto.ArticleBriefDTO;

/**
 * @author snow
 *
 */
@Service
public class ArticleBiz {
	
	private static Logger logger = LoggerFactory.getLogger(ArticleBiz.class);
	
	@Autowired
	private RestTemplate restTemplate;
	
	public List<ArticleBriefDTO> getRecentlyArticles() {
		String url = Constants.WHITE_MIRROR_URL + Constants.APP_URL + "/recentlyArticles";
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(new MediaType("application", "json"));
		requestHeaders.add("API-Key", Constants.API_KEY);
		HttpEntity<?> requestEntity = new HttpEntity<Object>(requestHeaders);
		try {
			ResponseEntity<ArticleBriefDTO[]> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, ArticleBriefDTO[].class);
			return Arrays.asList(responseEntity.getBody());
		} catch (Exception ex) {
			logger.error("Exception in ArticleBiz.getRecentlyArticles, ex: ", ex);
			return null;
		}
	}
}
