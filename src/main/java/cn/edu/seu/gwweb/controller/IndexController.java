/**
 * 
 */
package cn.edu.seu.gwweb.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.seu.gwweb.biz.ArticleBiz;
import cn.edu.seu.gwweb.biz.SectionBiz;
import cn.edu.seu.gwweb.dto.ArticleBriefDTO;
import cn.edu.seu.gwweb.dto.SectionDTO;

/**
 * @author snow
 *
 */
@Controller
public class IndexController {
	
	private static Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private SectionBiz sectionBiz;
	
	@Autowired
	private ArticleBiz articleBiz;
	
	@RequestMapping(value = "/index")
	public String index(ModelMap map) {
		try {
			List<SectionDTO> sectionDTOList = sectionBiz.getIndexSections();
			map.put("sectionDTOList", sectionDTOList);
			List<ArticleBriefDTO> articleBriefList = articleBiz.getRecentlyArticles();
			map.put("recentlyArticleList", articleBriefList);
		} catch (Exception ex) {
			logger.error("Exception in IndexController.index(), ex: ", ex);
		}
		return "/index.ftl";
	}
}
