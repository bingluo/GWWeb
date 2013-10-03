/**
 * 
 */
package cn.edu.seu.gwweb.util;

import java.util.Comparator;

import cn.edu.seu.gwweb.dto.ArticleBriefDTO;

/**
 * @author snow
 *
 */
public class ArticleBriefComparator implements Comparator<ArticleBriefDTO> {

	@Override
	public int compare(ArticleBriefDTO arg0, ArticleBriefDTO arg1) {
		return arg0.getId().compareTo(arg1.getId());
	}
}
