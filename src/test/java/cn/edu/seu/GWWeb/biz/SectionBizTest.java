/**
 * 
 */
package cn.edu.seu.GWWeb.biz;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import cn.edu.seu.whitemirror.dto.SectionDTO;

/**
 * @author snow
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml",
								 "classpath:springMVC-servlet.xml"})
public class SectionBizTest {

	@Autowired
	private SectionBiz sectionBiz;
	/**
	 * Test method for {@link cn.edu.seu.GWWeb.biz.SectionBiz#getIndexSections()}.
	 */
	@Test
	public void testGetIndexSections() {
		List<SectionDTO> sectionDTOList = sectionBiz.getIndexSections();
		if (!CollectionUtils.isEmpty(sectionDTOList)) {
			for (SectionDTO sectionDTO : sectionDTOList) {
				System.out.println(String.format("%d,%s,%s", sectionDTO.getId(), sectionDTO.getTitle(), sectionDTO.getArticleList()));
			}
		}
		Assert.notEmpty(sectionDTOList);
	}

}
