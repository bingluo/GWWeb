/**
 * 
 */
package cn.edu.seu.gwweb.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.seu.gwweb.biz.RESTfulBiz;
import cn.edu.seu.gwweb.dto.ArticleBriefDTO;
import cn.edu.seu.gwweb.dto.ArticleDTO;
import cn.edu.seu.gwweb.dto.SectionDTO;
import cn.edu.seu.gwweb.util.ArticleBriefComparator;

/**
 * @author snow
 *
 */
@Controller
public class MainController {
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	
	private @Value("#{appProp.aboutCollegeId}") Long aboutCollegeId;
	private @Value("#{appProp.teachingWorkId}") Long teachingWorkId;
	private @Value("#{appProp.teachingTeamId}") Long teachingTeamId;
	private @Value("#{appProp.researchId}") Long researchId;
	private @Value("#{appProp.personalTrainingId}") Long personalTrainingId;
	private @Value("#{appProp.partyWorkId}") Long partyWorkId;
	private @Value("#{appProp.unionWorkId}") Long unionWorkId;
	
	private @Value("#{appProp.collegeNoticeId}") Long collegeNoticeId;
	private @Value("#{appProp.teachingAffairsId}") Long teachingAffairsId;
	private @Value("#{appProp.collegeNewsId}") Long collegeNewsId;
	private @Value("#{appProp.studentWorkNewIds}") Long studentWorkNewIds;
	
	@Autowired
	private RESTfulBiz resTfulBiz;
	
	@RequestMapping(value = "/index")
	public String index(ModelMap modelMap) {
		List<String> menuList = new ArrayList<String>();
		menuList.add(aboutCollegeId.toString());
		menuList.add(teachingWorkId.toString());
		menuList.add(teachingTeamId.toString());
		menuList.add(researchId.toString());
		menuList.add(personalTrainingId.toString());
		menuList.add(partyWorkId.toString());
		menuList.add(unionWorkId.toString());
		modelMap.put("menuList", menuList);
		
		Map<String, SectionDTO> menuSectionMap = new HashMap<String, SectionDTO>();
		try {
			List<SectionDTO> sectionList = resTfulBiz.getSectionList();
			if (sectionList != null) {
				for (SectionDTO sectionDTO : sectionList) {
					if (menuList.contains(sectionDTO.getId().toString())) {
						Collections.sort(sectionDTO.getArticleList(), new ArticleBriefComparator());
						menuSectionMap.put(sectionDTO.getId().toString(), sectionDTO);
					} else if (sectionDTO.getId() == collegeNoticeId) {
						modelMap.put("collegeNotice", sectionDTO.getArticleList());
					} else if (sectionDTO.getId() == teachingAffairsId) {
						modelMap.put("teachingAffairs", sectionDTO.getArticleList());
					} else if (sectionDTO.getId() == collegeNewsId) {
						modelMap.put("collegeNews", sectionDTO.getArticleList());
					} else if (sectionDTO.getId() == studentWorkNewIds) {
						modelMap.put("studentWorkNew", sectionDTO.getArticleList());
					}
				}
			}
			modelMap.put("menuSectionMap", menuSectionMap);
			List<ArticleBriefDTO> recentlyArticleList = resTfulBiz.getRecentlyArticleList();
			modelMap.put("recentlyArticleList", recentlyArticleList);
			return "/index.ftl";
		} catch (Exception ex) {
			logger.error("Exception in MainController.index, ex: ", ex);
			return "/index.ftl";
		}
	}
	
	@RequestMapping(value = "/pages/{pageId}/articles/{articleId}")
	public String articlePage(@PathVariable Long pageId, @PathVariable Long articleId, ModelMap modelMap) {
		List<String> menuList = new ArrayList<String>();
		menuList.add(aboutCollegeId.toString());
		menuList.add(teachingWorkId.toString());
		menuList.add(teachingTeamId.toString());
		menuList.add(researchId.toString());
		menuList.add(personalTrainingId.toString());
		menuList.add(partyWorkId.toString());
		menuList.add(unionWorkId.toString());
		modelMap.put("menuList", menuList);
		
		Map<String, SectionDTO> menuSectionMap = new HashMap<String, SectionDTO>();
		SectionDTO currentSection = null;
		ArticleDTO article = null;
		try {
			List<SectionDTO> sectionList = resTfulBiz.getSectionList();
			if (sectionList != null) {
			
				for (SectionDTO sectionDTO : sectionList) {
					if (menuList.contains(sectionDTO.getId().toString())) {
						Collections.sort(sectionDTO.getArticleList(), new ArticleBriefComparator());
						menuSectionMap.put(sectionDTO.getId().toString(), sectionDTO);
					}
					if (sectionDTO.getId() == pageId) {
						currentSection = sectionDTO;
					}
				}	
			}
			if (currentSection != null) {
				article = resTfulBiz.getArticle(currentSection.getId(), articleId);
			}
			modelMap.put("menuSectionMap", menuSectionMap);
			modelMap.put("currentSection", currentSection);
			modelMap.put("article", article);
			return "/article_page.ftl";
		} catch (Exception ex) {
			logger.error("Exception in MainController.articlePage, ex: ", ex);
			return "/article_page.ftl";
		}
	}
}
