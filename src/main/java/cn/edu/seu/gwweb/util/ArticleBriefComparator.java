/**
 * 
 */
package cn.edu.seu.gwweb.util;

import cn.edu.seu.whitemirror.api.dto.ArticleBriefDTO;

import java.util.Comparator;

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