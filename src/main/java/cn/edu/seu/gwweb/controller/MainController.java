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
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.seu.gwweb.biz.RESTfulBiz;
import cn.edu.seu.whitemirror.api.dto.ArticleBriefDTO;
import cn.edu.seu.whitemirror.api.dto.ArticleDTO;
import cn.edu.seu.whitemirror.api.dto.SectionDTO;
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
	private @Value("#{appProp.studentWorkNewIds}") Long studentWorkNewsId;

    private @Value("#{appProp.studentWorkActivitiesId}") Long studentWorkActivitiesId;
    private @Value("#{appProp.studentWorkManagementId}") Long studentWorkManagementId;
    private @Value("#{appProp.studentWorkGraduateId}") Long studentWorkGraduateId;
    private @Value("#{appProp.studentWorkPartyId}") Long studentWorkPartyId;
    private @Value("#{appProp.studentWorkMasterId}") Long studentWorkMasterId;
	
	private static final Integer PAGE_SIZE = 10;
	private static final boolean ORDER_BY_DATE = true;
	
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
						modelMap.put("collegeNotice", sectionDTO);
					} else if (sectionDTO.getId() == teachingAffairsId) {
						modelMap.put("teachingAffairs", sectionDTO);
					} else if (sectionDTO.getId() == collegeNewsId) {
						modelMap.put("collegeNews", sectionDTO);
					} else if (sectionDTO.getId() == studentWorkNewsId) {
						modelMap.put("studentWorkNew", sectionDTO);
					}
				}
			}
			modelMap.put("menuSectionMap", menuSectionMap);
//			List<ArticleBriefDTO> recentlyArticleList = resTfulBiz.getRecentlyArticleList();
//			modelMap.put("recentlyArticleList", recentlyArticleList);
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
	
	@RequestMapping(value = "/student_work")
	public String studentWork(ModelMap modelMap) {
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
                    } else if (sectionDTO.getId() == studentWorkNewsId) {
                        modelMap.put("studentWorkNews", sectionDTO);
                    } else if (sectionDTO.getId() == studentWorkActivitiesId) {
                        modelMap.put("studentActivities", sectionDTO);
                    } else if (sectionDTO.getId() == studentWorkManagementId) {
                        modelMap.put("studentManagement", sectionDTO);
                    } else if (sectionDTO.getId() == studentWorkGraduateId) {
                        modelMap.put("studentWorkGraduate", sectionDTO);
                    } else if (sectionDTO.getId() == studentWorkPartyId) {
                        modelMap.put("studentWorkParty", sectionDTO);
                    } else if (sectionDTO.getId() == studentWorkMasterId) {
                        modelMap.put("studentWorkMaster", sectionDTO);
                    }
                }
            }
            modelMap.put("menuSectionMap", menuSectionMap);
            return  "/student_work.ftl";
        } catch (Exception ex) {
            logger.error("Exception in MainController.simpleArticlePage, ex: ", ex);
            return "/student_work.ftl";
        }
	}
	
	@RequestMapping(value = "/sections/{sectionId}/articles/{articleId}")
	public String simpleArticlePage(ModelMap modelMap, @PathVariable Long sectionId, @PathVariable Long articleId) {
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
        ArticleDTO article = null;
        try {
            List<SectionDTO> sectionList = resTfulBiz.getSectionList();
            if (sectionList != null) {
                for (SectionDTO sectionDTO : sectionList) {
                    if (menuList.contains(sectionDTO.getId().toString())) {
                        Collections.sort(sectionDTO.getArticleList(), new ArticleBriefComparator());
                        menuSectionMap.put(sectionDTO.getId().toString(), sectionDTO);
                    }
                }
            }
            article = resTfulBiz.getArticle(sectionId, articleId);
            modelMap.put("menuSectionMap", menuSectionMap);
            modelMap.put("article", article);
            return  "/simple_article.ftl";
        } catch (Exception ex) {
            logger.error("Exception in MainController.simpleArticlePage, ex: ", ex);
            return "/simple_article.ftl";
        }
	}
	
	@RequestMapping(value = "/sections/{sectionId}")
	public String articleListPage(ModelMap modelMap, @PathVariable Long sectionId, @RequestParam(required = false) Integer pageIndex) {
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
		List<ArticleBriefDTO> articleList = null;
		Long articleListCount = null;
		try {
			List<SectionDTO> sectionList = resTfulBiz.getSectionList();
			if (sectionList != null) {
				for (SectionDTO sectionDTO : sectionList) {
					if (menuList.contains(sectionDTO.getId().toString())) {
						Collections.sort(sectionDTO.getArticleList(), new ArticleBriefComparator());
						menuSectionMap.put(sectionDTO.getId().toString(), sectionDTO);
					}
					if (sectionDTO.getId() == sectionId) {
						currentSection = sectionDTO;
					}
				}
				if (currentSection != null) {
					if (pageIndex == null) {
						pageIndex = 1;
					}
					articleList = resTfulBiz.getArticleBriefList(currentSection.getId(), pageIndex, PAGE_SIZE, ORDER_BY_DATE);
					articleListCount = resTfulBiz.countArticleBrief(currentSection.getId());
				}
			}
			modelMap.put("sectionId", sectionId);
			modelMap.put("menuSectionMap", menuSectionMap);
			modelMap.put("currentSection", currentSection);
			modelMap.put("articleList", articleList);
			modelMap.put("articleListCount", articleListCount);
			modelMap.put("pageIndex", pageIndex);
			modelMap.put("pageSize", PAGE_SIZE);
			return "/article_list.ftl";
		} catch (Exception ex) {
			logger.error("Exception in MainController.articleListPage, ex: ", ex);
			return "/article_list.ftl";
		}
	}
	
}
