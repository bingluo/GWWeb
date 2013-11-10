/**
 *
 */
package cn.edu.seu.gwweb.controller;

import cn.edu.seu.gwweb.util.PositionComparator;
import cn.edu.seu.whitemirror.api.client.ArticleClient;
import cn.edu.seu.whitemirror.api.client.CategoryClient;
import cn.edu.seu.whitemirror.api.client.SectionClient;
import cn.edu.seu.whitemirror.api.dto.ArticleDTO;
import cn.edu.seu.whitemirror.api.dto.CategoryDTO;
import cn.edu.seu.whitemirror.api.dto.SectionDTO;
import cn.edu.seu.whitemirror.api.enums.SectionTypeEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

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
	private static final Long GRADUATED_STUDENT_PY_CATEGORY = Long.valueOf(10);
	private static final Long POSTGRADUATED_STUDENT_PY_CATEGORY = Long.valueOf(11);
	private static final Long PARTY_WORK_CATEGORY = Long.valueOf(12);
	private static final Long UNION_WORK_CATEGORY = Long.valueOf(13);
	private static final Long COURSE_INTRO_CATEGORY = Long.valueOf(9);
	private static final Long COURSE_INTRO_SECTION = Long.valueOf(34);
	private static final Long NOTICE = Long.valueOf(56);
	private static final Long TEACHER_TEAM = Long.valueOf(3);
	private static final Long TEACHER_INTRO_SECTION = Long.valueOf(41);
	private static final Long TEACHER_INTRO_CATEGORY = Long.valueOf(14);

	@Autowired
	private SectionClient sectionClient;

	@Autowired
	private ArticleClient articleClient;

	@Autowired
	private CategoryClient categoryClient;

    @RequestMapping(value = "/")
    public String root() {
        return "redirect:/index";
    }

	@RequestMapping(value = "/index")
	public String index(ModelMap modelMap) {
		try {
			navibar(modelMap);
			/*首页中5个section获取*/
			List<SectionDTO> indexSections = sectionClient.getSectionsByCategoryId(INDEX_CATEGORY_ID, true);
            /*通告公告（学生工作category）10篇文章获取*/
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
		if (sectionId == TEACHER_INTRO_SECTION)
			return teacherIntro(modelMap);
		else
			return section(catId, pageIndex, sectionId, modelMap);
	}

	private String teacherIntro(ModelMap modelMap) {
		navibar(modelMap);
		List<SectionDTO> sections = sectionClient.getSectionsByCategoryId(TEACHER_TEAM, false);
		SectionDTO sectionDTO = new SectionDTO();
		sectionDTO.setTitle("教职工介绍");
		sectionDTO.setCategoryId(TEACHER_TEAM);
		sectionDTO.setId(TEACHER_INTRO_SECTION);
		sections.add(sectionDTO);
		List<SectionDTO> positions = sectionClient.getSectionsByCategoryId(TEACHER_INTRO_CATEGORY,true);
        Collections.sort(positions, new PositionComparator());
		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO.setId(Long.valueOf(3));
		categoryDTO.setTitle("师资队伍");
		modelMap.put("leftSections", sections);
		modelMap.put("currentSection",sectionDTO);
		modelMap.put("positions",positions);
		modelMap.put("category",categoryDTO);
		return "teacher_intro.ftl";
	}

	private String section(long catId, int pageIndex, ModelMap modelMap) {
		navibar(modelMap);
		List<SectionDTO> sections = sectionClient.getSectionsByCategoryId(catId, false);
		if (catId == TEACHER_TEAM) {
			SectionDTO sectionDTO = new SectionDTO();
			sectionDTO.setTitle("教职工介绍");
			sectionDTO.setCategoryId(TEACHER_TEAM);
			sectionDTO.setId(TEACHER_INTRO_SECTION);
			sections.add(sectionDTO);
		}
		if (sections != null && sections.size() > 0) {
			SectionDTO currentSection = sections.get(0);
			if (pageIndex <= 0) {
				pageIndex = 1;
			}
			currentSection.setArticleList(articleClient.paginateArticleBriefBySectionId(currentSection.getId(), pageIndex, PAGE_SIZE, true));
			if (currentSection.getType()== SectionTypeEnum.valueOf(2)){
				if (currentSection.getArticleList()!=null&&currentSection.getArticleList().size()>0){
					Long articleId = currentSection.getArticleList().get(0).getId();
					ArticleDTO currentArticle = articleClient.findArticleBySectionIdAndArticleId(currentSection.getId(),articleId);
					modelMap.put("currentArticle",currentArticle);
				}
			}
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
		if (catId == TEACHER_TEAM) {
			SectionDTO sectionDTO = new SectionDTO();
			sectionDTO.setTitle("教职工介绍");
			sectionDTO.setCategoryId(TEACHER_TEAM);
			sectionDTO.setId(TEACHER_INTRO_SECTION);
			sections.add(sectionDTO);
		}
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
			if (currentSection.getType()== SectionTypeEnum.valueOf(2)){
				if (currentSection.getArticleList()!=null&&currentSection.getArticleList().size()>0){
					Long articleId = currentSection.getArticleList().get(0).getId();
					ArticleDTO currentArticle = articleClient.findArticleBySectionIdAndArticleId(currentSection.getId(),articleId);
					modelMap.put("currentArticle",currentArticle);
				}
			}
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
					categoryDTO.getId() == COURSE_INTRO_CATEGORY ||
					categoryDTO.getId() == GRADUATED_STUDENT_PY_CATEGORY ||
					categoryDTO.getId() == POSTGRADUATED_STUDENT_PY_CATEGORY ||
					categoryDTO.getId() == PARTY_WORK_CATEGORY ||
					categoryDTO.getId() == UNION_WORK_CATEGORY ||
					categoryDTO.getId() == TEACHER_INTRO_CATEGORY) {
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
			if (entry.getKey() == TEACHER_TEAM) {
				SectionDTO sectionDTO = new SectionDTO();
				sectionDTO.setTitle("教职工介绍");
				sectionDTO.setCategoryId(TEACHER_TEAM);
				sectionDTO.setId(TEACHER_INTRO_SECTION);
				entry.getValue().add(sectionDTO);
			}
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
	public String article(@PathVariable Long sectionId, @PathVariable Long articleId, ModelMap modelMap) {
		navibar(modelMap);
		if (articleId == null || articleId <= 0)
			articleId = Long.valueOf(1);
		if (sectionId == null || sectionId <= 0)
			sectionId = Long.valueOf(1);
		modelMap.put("currrentSection", sectionClient.findSectionBySectionId(sectionId));
		modelMap.put("article", articleClient.findArticleBySectionIdAndArticleId(sectionId, articleId));
		return "simple_article.ftl";
	}

	@RequestMapping(value = "/student_work")
	public String studentWork(ModelMap modelMap) {
		navibar(modelMap);
		List<SectionDTO> sections = sectionClient.getSectionsByCategoryId(STUDENT_WORK, true);
		for (SectionDTO section : sections) {
			section.setTitle(section.getTitle().replaceAll(" ", ""));
			modelMap.put(section.getTitle(), section);
		}
		return "student_work.ftl";
	}
}