/**
 *
 */
package cn.edu.seu.gwweb.controller;

import cn.edu.seu.whitemirror.api.client.ArticleClient;
import cn.edu.seu.whitemirror.api.client.CategoryClient;
import cn.edu.seu.whitemirror.api.client.SectionClient;
import cn.edu.seu.whitemirror.api.dto.ArticleBriefDTO;
import cn.edu.seu.whitemirror.api.dto.CategoryDTO;
import cn.edu.seu.whitemirror.api.dto.SectionDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author snow
 */
@Controller
public class MainController {

    private Logger logger = LoggerFactory.getLogger(MainController.class);

    private static final Integer PAGE_SIZE = 10;
    private static final boolean ORDER_BY_DATE = true;
    private static final Long INDEX_CATEGORY_ID = Long.valueOf(1);
    private static final Long STUDENT_WORK = Long.valueOf(8);
    private static final Long COURSE_INTRO_CATEGORY = Long.valueOf(9);
    private static final Long COURSE_INTRO_SECTION = Long.valueOf(34);
    private static final Long NOTICE = Long.valueOf(56);

    @Autowired
    private SectionClient sectionClient;

    @Autowired
    private ArticleClient articleClient;

    @Autowired
    private CategoryClient categoryClient;

    @RequestMapping(value = "/index")
    public String index(ModelMap modelMap) {
        try {
            navibar(modelMap);
            /*首页中5个section获取*/
            List<SectionDTO> indexSections = sectionClient.getSectionsByCategoryId(INDEX_CATEGORY_ID, true);
            /*通告公告（学生工作category）10篇文章获取*///没获取到文章
            SectionDTO studentWork = sectionClient.findSectionBySectionId(NOTICE);

            for (SectionDTO section : indexSections) {
                modelMap.put(section.getTitle(), section);
            }
            modelMap.put("notice", studentWork);

            return "/index.ftl";
        } catch (Exception ex) {
            logger.error("Exception in MainController.index, ex: ", ex);
            return "/index.ftl";
        }
    }

    @RequestMapping(value = "/cat/{catId}/")
    public String categoryPage(@PathVariable Long catId, ModelMap modelMap, @RequestParam(required = false) Integer pageIndex) {
        if (catId == null) {
            catId = Long.valueOf(0);
        }
        if (pageIndex == null || pageIndex <= 0) {
            pageIndex = 1;
        }
        return section(catId, pageIndex, modelMap);
    }

    @RequestMapping(value = "/cat/{catId}/section/{sectionId}/")
    public String sectionPage(@PathVariable Long catId, @PathVariable Long sectionId, ModelMap modelMap, @RequestParam(required = false) Integer pageIndex) {
        if (catId == null) {
            catId = Long.valueOf(0);
        }
        if (pageIndex == null || pageIndex <= 0) {
            pageIndex = 1;
        }
        if (sectionId == null || sectionId < 0) {
            sectionId = Long.valueOf(0);
        }
        return section(catId, pageIndex, sectionId, modelMap);
    }

    private String section(long catId, int pageIndex, ModelMap modelMap) {
        navibar(modelMap);
        List<SectionDTO> sections = sectionClient.getSectionsByCategoryId(catId, false);
        if (sections != null && sections.size() > 0) {
            SectionDTO currentSection = sections.get(0);
            if (pageIndex <= 0) {
                pageIndex = 1;
            }
            currentSection.setArticleList(articleClient.paginateArticleBriefBySectionId(currentSection.getId(), pageIndex, PAGE_SIZE, true));
            modelMap.put("currentSection", currentSection);
            modelMap.put("articleListCount", articleClient.countArticleBySectionId(currentSection.getId()));
            modelMap.put("pageSize", PAGE_SIZE);
            modelMap.put("pageIndex", pageIndex);
        }
        modelMap.put("category", categoryClient.findCategoryByCategoryId(catId));
        modelMap.put("sectionList", sections);
        return "/section.ftl";
    }

    private String section(long catId, int pageIndex, long sectionId, ModelMap modelMap) {
        navibar(modelMap);
        List<SectionDTO> sections = sectionClient.getSectionsByCategoryId(catId, false);
        if (sections != null && sections.size() > 0) {
            SectionDTO currentSection = null;
            for (SectionDTO section : sections) {
                if (section.getId() == sectionId) {
                    currentSection = section;
                    break;
                }
            }
            if (pageIndex <= 0) {
                pageIndex = 1;
            }
            currentSection.setArticleList(articleClient.paginateArticleBriefBySectionId(currentSection.getId(), pageIndex, PAGE_SIZE, true));
            modelMap.put("currentSection", currentSection);
            modelMap.put("articleListCount", articleClient.countArticleBySectionId(currentSection.getId()));
            modelMap.put("pageSize", PAGE_SIZE);
            modelMap.put("pageIndex", pageIndex);
        }
        modelMap.put("category", categoryClient.findCategoryByCategoryId(catId));
        modelMap.put("sectionList", sections);
        return "/section.ftl";
    }

    private void navibar(ModelMap modelMap) {
        /*第一个section：courseIntro文章获取*/
        SectionDTO courseIntro = sectionClient.findSectionBySectionId(COURSE_INTRO_SECTION);
        courseIntro.setArticleList(articleClient.paginateArticleBriefBySectionId(COURSE_INTRO_SECTION, 1, PAGE_SIZE, false));
        modelMap.put("courseIntro", courseIntro);

        /*目录7个category获取*/
        List<CategoryDTO> categories = categoryClient.getCategories();
        ArrayList<Long> idList = new ArrayList<Long>();
        ArrayList<String> ids = new ArrayList<String>();
        for (int i = 0; i < categories.size(); i++) {
            CategoryDTO categoryDTO = categories.get(i);
            if (categoryDTO.getId() == INDEX_CATEGORY_ID ||
                    categoryDTO.getId() == STUDENT_WORK ||
                    categoryDTO.getId() == COURSE_INTRO_CATEGORY) {
                categories.remove(i--);
            } else {
                idList.add(categoryDTO.getId());
                ids.add(categoryDTO.getId().toString());
            }
        }
        modelMap.put("categories", categories);

        Map<Long, List<SectionDTO>> sectionssss = sectionClient.batchSectionsByCategoryIdList(idList, true);
        Map<String, List<SectionDTO>> sections = new HashMap<String, List<SectionDTO>>();
        for (Map.Entry<Long, List<SectionDTO>> entry : sectionssss.entrySet()) {
            sections.put(entry.getKey().toString(), entry.getValue());
        }
        modelMap.put("idList", ids);
        modelMap.put("categorySections", sections);
    }

    @RequestMapping(value = "/courseIntro/{articleId}")
    public String courseIntro(@PathVariable Long articleId, ModelMap modelMap) {
        navibar(modelMap);
        modelMap.put("currentSection", sectionClient.findSectionBySectionId(COURSE_INTRO_SECTION));
        modelMap.put("currentArticle", articleClient.findArticleBySectionIdAndArticleId(COURSE_INTRO_SECTION, articleId));
        return "course_intro.ftl";
    }

    @RequestMapping(value = "/courseIntro/")
    public String courseIntro(ModelMap modelMap) {
        navibar(modelMap);
        SectionDTO currentSection = sectionClient.findSectionBySectionId(COURSE_INTRO_SECTION);
        modelMap.put("currentSection", currentSection);
        modelMap.put("currentArticle", articleClient.findArticleBySectionIdAndArticleId(COURSE_INTRO_SECTION, currentSection.getArticleList().get(0).getId()));
        return "course_intro.ftl";
    }

    @RequestMapping(value = "/article/{sectionId}-{articleId}.html")
    public String article(@PathVariable Long sectionId,@PathVariable Long articleId, ModelMap modelMap) {
        navibar(modelMap);
        if (articleId == null || articleId <= 0)
            articleId = Long.valueOf(1);
        if (sectionId == null || sectionId <= 0)
            sectionId = Long.valueOf(1);
        modelMap.put("currrentSection",sectionClient.findSectionBySectionId(sectionId));
        modelMap.put("article", articleClient.findArticleBySectionIdAndArticleId(sectionId, articleId));
        return "simple_article.ftl";
    }

//	@RequestMapping(value = "/pages/{pageId}/articles/{articleId}")
//	public String articlePage(@PathVariable Long pageId, @PathVariable Long articleId, ModelMap modelMap) {
//		List<String> menuList = new ArrayList<String>();
//		menuList.add(aboutCollegeId.toString());
//		menuList.add(teachingWorkId.toString());
//		menuList.add(teachingTeamId.toString());
//		menuList.add(researchId.toString());
//		menuList.add(personalTrainingId.toString());
//		menuList.add(partyWorkId.toString());
//		menuList.add(unionWorkId.toString());
//		modelMap.put("menuList", menuList);
//
//		Map<String, SectionDTO> menuSectionMap = new HashMap<String, SectionDTO>();
//		SectionDTO currentSection = null;
//		ArticleDTO article = null;
//		try {
//			List<SectionDTO> sectionList = resTfulBiz.getSectionList();
//			if (sectionList != null) {
//				for (SectionDTO sectionDTO : sectionList) {
//					if (menuList.contains(sectionDTO.getId().toString())) {
//						Collections.sort(sectionDTO.getArticleList(), new ArticleBriefComparator());
//						menuSectionMap.put(sectionDTO.getId().toString(), sectionDTO);
//					}
//					if (sectionDTO.getId() == pageId) {
//						currentSection = sectionDTO;
//					}
//				}
//			}
//			if (currentSection != null) {
//				article = resTfulBiz.getArticle(currentSection.getId(), articleId);
//			}
//			modelMap.put("menuSectionMap", menuSectionMap);
//			modelMap.put("currentSection", currentSection);
//			modelMap.put("article", article);
//			return "/section.ftl";
//		} catch (Exception ex) {
//			logger.error("Exception in MainController.articlePage, ex: ", ex);
//			return "/section.ftl";
//		}
//	}
//
//	@RequestMapping(value = "/student_work")
//	public String studentWork(ModelMap modelMap) {
//        List<String> menuList = new ArrayList<String>();
//        menuList.add(aboutCollegeId.toString());
//        menuList.add(teachingWorkId.toString());
//        menuList.add(teachingTeamId.toString());
//        menuList.add(researchId.toString());
//        menuList.add(personalTrainingId.toString());
//        menuList.add(partyWorkId.toString());
//        menuList.add(unionWorkId.toString());
//        modelMap.put("menuList", menuList);
//
//        Map<String, SectionDTO> menuSectionMap = new HashMap<String, SectionDTO>();
//        try {
//            List<SectionDTO> sectionList = resTfulBiz.getSectionList();
//            if (sectionList != null) {
//                for (SectionDTO sectionDTO : sectionList) {
//                    if (menuList.contains(sectionDTO.getId().toString())) {
//                        Collections.sort(sectionDTO.getArticleList(), new ArticleBriefComparator());
//                        menuSectionMap.put(sectionDTO.getId().toString(), sectionDTO);
//                    } else if (sectionDTO.getId() == studentWorkNewsId) {
//                        modelMap.put("studentWorkNews", sectionDTO);
//                    } else if (sectionDTO.getId() == studentWorkActivitiesId) {
//                        modelMap.put("studentActivities", sectionDTO);
//                    } else if (sectionDTO.getId() == studentWorkManagementId) {
//                        modelMap.put("studentManagement", sectionDTO);
//                    } else if (sectionDTO.getId() == studentWorkGraduateId) {
//                        modelMap.put("studentWorkGraduate", sectionDTO);
//                    } else if (sectionDTO.getId() == studentWorkPartyId) {
//                        modelMap.put("studentWorkParty", sectionDTO);
//                    } else if (sectionDTO.getId() == studentWorkMasterId) {
//                        modelMap.put("studentWorkMaster", sectionDTO);
//                    }
//                }
//            }
//            modelMap.put("menuSectionMap", menuSectionMap);
//            return  "/student_work.ftl";
//        } catch (Exception ex) {
//            logger.error("Exception in MainController.simpleArticlePage, ex: ", ex);
//            return "/student_work.ftl";
//        }
//	}
//
//	@RequestMapping(value = "/sections/{sectionId}/articles/{articleId}")
//	public String simpleArticlePage(ModelMap modelMap, @PathVariable Long sectionId, @PathVariable Long articleId) {
//        List<String> menuList = new ArrayList<String>();
//        menuList.add(aboutCollegeId.toString());
//        menuList.add(teachingWorkId.toString());
//        menuList.add(teachingTeamId.toString());
//        menuList.add(researchId.toString());
//        menuList.add(personalTrainingId.toString());
//        menuList.add(partyWorkId.toString());
//        menuList.add(unionWorkId.toString());
//        modelMap.put("menuList", menuList);
//
//        Map<String, SectionDTO> menuSectionMap = new HashMap<String, SectionDTO>();
//        ArticleDTO article = null;
//        try {
//            List<SectionDTO> sectionList = resTfulBiz.getSectionList();
//            if (sectionList != null) {
//                for (SectionDTO sectionDTO : sectionList) {
//                    if (menuList.contains(sectionDTO.getId().toString())) {
//                        Collections.sort(sectionDTO.getArticleList(), new ArticleBriefComparator());
//                        menuSectionMap.put(sectionDTO.getId().toString(), sectionDTO);
//                    }
//                }
//            }
//            article = resTfulBiz.getArticle(sectionId, articleId);
//            modelMap.put("menuSectionMap", menuSectionMap);
//            modelMap.put("article", article);
//            return  "/simple_article.ftl";
//        } catch (Exception ex) {
//            logger.error("Exception in MainController.simpleArticlePage, ex: ", ex);
//            return "/simple_article.ftl";
//        }
//	}
//
//	@RequestMapping(value = "/sections/{sectionId}")
//	public String articleListPage(ModelMap modelMap, @PathVariable Long sectionId, @RequestParam(required = false) Integer pageIndex) {
//		List<String> menuList = new ArrayList<String>();
//		menuList.add(aboutCollegeId.toString());
//		menuList.add(teachingWorkId.toString());
//		menuList.add(teachingTeamId.toString());
//		menuList.add(researchId.toString());
//		menuList.add(personalTrainingId.toString());
//		menuList.add(partyWorkId.toString());
//		menuList.add(unionWorkId.toString());
//		modelMap.put("menuList", menuList);
//
//		Map<String, SectionDTO> menuSectionMap = new HashMap<String, SectionDTO>();
//		SectionDTO currentSection = null;
//		List<ArticleBriefDTO> articleList = null;
//		Long articleListCount = null;
//		try {
//			List<SectionDTO> sectionList = resTfulBiz.getSectionList();
//			if (sectionList != null) {
//				for (SectionDTO sectionDTO : sectionList) {
//					if (menuList.contains(sectionDTO.getId().toString())) {
//						Collections.sort(sectionDTO.getArticleList(), new ArticleBriefComparator());
//						menuSectionMap.put(sectionDTO.getId().toString(), sectionDTO);
//					}
//					if (sectionDTO.getId() == sectionId) {
//						currentSection = sectionDTO;
//					}
//				}
//				if (currentSection != null) {
//					if (pageIndex == null) {
//						pageIndex = 1;
//					}
//					articleList = resTfulBiz.getArticleBriefList(currentSection.getId(), pageIndex, PAGE_SIZE, ORDER_BY_DATE);
//					articleListCount = resTfulBiz.countArticleBrief(currentSection.getId());
//				}
//			}
//			modelMap.put("sectionId", sectionId);
//			modelMap.put("menuSectionMap", menuSectionMap);
//			modelMap.put("currentSection", currentSection);
//			modelMap.put("articleList", articleList);
//			modelMap.put("articleListCount", articleListCount);
//			modelMap.put("pageIndex", pageIndex);
//			modelMap.put("pageSize", PAGE_SIZE);
//			return "/article_list.ftl";
//		} catch (Exception ex) {
//			logger.error("Exception in MainController.articleListPage, ex: ", ex);
//			return "/article_list.ftl";
//		}
//	}

}
