/**
 * 
 */
package cn.edu.seu.whitemirror.dto;

import java.io.Serializable;
import java.util.List;

/**
 * @author snow
 *
 */
public class SectionDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private long id;
	private String title;
	private List<ArticleBriefDTO> articleList;
	
	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the articleList
	 */
	public List<ArticleBriefDTO> getArticleList() {
		return articleList;
	}
	/**
	 * @param articleList the articleList to set
	 */
	public void setArticleList(List<ArticleBriefDTO> articleList) {
		this.articleList = articleList;
	}
}
