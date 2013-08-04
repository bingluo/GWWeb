/**
 * 
 */
package cn.edu.seu.GWWeb.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.seu.GWWeb.biz.SectionBiz;
import cn.edu.seu.whitemirror.dto.SectionDTO;

/**
 * @author snow
 *
 */
@Controller
public class IndexController {
	
	private static Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private SectionBiz sectionBiz;
	
	@RequestMapping(value = "/index")
	public String index(ModelMap map) {
		try {
			List<SectionDTO> sectionDTOList = sectionBiz.getIndexSections();
			map.put("sectionDTOList", sectionDTOList);
		} catch (Exception ex) {
			logger.error("Exception in IndexController.index(), ex: ", ex);
		}
		return "/index.ftl";
	}
}
