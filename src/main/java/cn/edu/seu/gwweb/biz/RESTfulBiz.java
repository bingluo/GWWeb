/**
 * 
 */
package cn.edu.seu.gwweb.biz;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import cn.edu.seu.whitemirror.api.dto.ArticleBriefDTO;
import cn.edu.seu.whitemirror.api.dto.ArticleDTO;
import cn.edu.seu.whitemirror.api.dto.SectionDTO;

/**
 * @author snow
 *
 */
@Service
public class RESTfulBiz {
	
	private static Logger logger = LoggerFactory.getLogger(RESTfulBiz.class);
	
	private @Value("#{appProp.restUrl}") String restUrl;
	private @Value("#{appProp.apiKey}") String apiKey;
	
	private static final String SECTION_LIST_URL = "sections?needArticleList=true";
	private static final String ARTICLEBRIEF_LIST_URL = "sections/%s/articles?pageIndex=%s&pageSize=%s&orderByCreateDate=%s";
	private static final String COUNT_ARTICLEBRIEF_URL = "sections/%s/articles/count";
	private static final String ARTICLE_URL = "sections/%s/articles/%s";
	private static final String RECENTLY_ARTICLE_URL = "recentlyArticles";
	
	@Autowired
	private RestTemplate restTemplate;
	
	public List<SectionDTO> getSectionList() {
		String sectionListUrl = restUrl + SECTION_LIST_URL;
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(new MediaType("application", "json"));
		requestHeaders.add("API-Key", apiKey);
		HttpEntity<?> requestEntity = new HttpEntity<Object>(requestHeaders);
		try {
			ResponseEntity<SectionDTO[]> responseEntity = restTemplate.exchange(sectionListUrl, HttpMethod.GET, requestEntity, SectionDTO[].class);
			SectionDTO[] sectionDTOs = responseEntity.getBody();
			return Arrays.asList(sectionDTOs);
		} catch (Exception ex) {
			logger.error("Exception in RESTfulBiz.getSectionList, ex: ", ex);
			return null;
		}
	}
	
	public List<ArticleBriefDTO> getArticleBriefList(Long sectionId, Integer pageIndex, Integer pageSize, Boolean orderByCreateDate) {
		String articlebriefListUrl = restUrl + String.format(ARTICLEBRIEF_LIST_URL, sectionId, pageIndex, pageSize, orderByCreateDate);
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(new MediaType("application", "json"));
		requestHeaders.add("API-Key", apiKey);
		HttpEntity<?> requestEntity = new HttpEntity<Object>(requestHeaders);
		try {
			ResponseEntity<ArticleBriefDTO[]> responseEntity = restTemplate.exchange(articlebriefListUrl, HttpMethod.GET, requestEntity, ArticleBriefDTO[].class);
			ArticleBriefDTO[] articleBriefDTOs = responseEntity.getBody();
			return Arrays.asList(articleBriefDTOs);
		} catch (Exception ex) {
			logger.error("Exception in RESTfulBiz.getArticleBriefList, ex: ", ex);
			return null;
		}
	}
	
	public Long countArticleBrief(Long sectionId) {
		String countArticleBriefUrl = restUrl + String.format(COUNT_ARTICLEBRIEF_URL, sectionId);
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(new MediaType("application", "json"));
		requestHeaders.add("API-Key", apiKey);
		HttpEntity<?> requestEntity = new HttpEntity<Object>(requestHeaders);
		try {
			ResponseEntity<Long> responseEntity = restTemplate.exchange(countArticleBriefUrl, HttpMethod.GET, requestEntity, Long.class);
			return responseEntity.getBody();
		} catch (Exception ex) {
			logger.error("Exception in RESTfulBiz,countArticleBrief, ex: ", ex);
			return null;
		}
	}
	
	public ArticleDTO getArticle(Long sectionId, Long articleId) {
		String articleUrl = restUrl + String.format(ARTICLE_URL, sectionId, articleId);
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(new MediaType("application", "json"));
		requestHeaders.add("API-Key", apiKey);
		HttpEntity<?> requestEntity = new HttpEntity<Object>(requestHeaders);
		try {
			ResponseEntity<ArticleDTO> responseEntity = restTemplate.exchange(articleUrl, HttpMethod.GET, requestEntity, ArticleDTO.class);
			return responseEntity.getBody();
		} catch (Exception ex) {
			logger.error("Exception in RESTfulBiz.getArticle, ex: ", ex);
			return null;
		}
	}
	
	public List<ArticleBriefDTO> getRecentlyArticleList() {
		String recentlyArticleUrl = restUrl + RECENTLY_ARTICLE_URL;
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(new MediaType("application", "json"));
		requestHeaders.add("API-Key", apiKey);
		HttpEntity<?> requestEntity = new HttpEntity<Object>(requestHeaders);
		try {
			ResponseEntity<ArticleBriefDTO[]> responseEntity = restTemplate.exchange(recentlyArticleUrl, HttpMethod.GET, requestEntity, ArticleBriefDTO[].class);
			ArticleBriefDTO[] articleBriefDTOs =  responseEntity.getBody();
			return Arrays.asList(articleBriefDTOs);
		} catch (Exception ex) {
			logger.error("Exception in RESTfulBiz.getRecentlyArticleList, ex: ", ex);
			return null;
		}
	}
}
