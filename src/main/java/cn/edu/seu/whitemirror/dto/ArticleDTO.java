/**
 * 
 */
package cn.edu.seu.whitemirror.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author snow
 *
 */
public class ArticleDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private long id;
	private String title;
	private String author;
	private String context;
	private List<String> attachmentList;
	private Date createDate;
	
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
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * @return the context
	 */
	public String getContext() {
		return context;
	}
	/**
	 * @param context the context to set
	 */
	public void setContext(String context) {
		this.context = context;
	}
	/**
	 * @return the attachmentList
	 */
	public List<String> getAttachmentList() {
		return attachmentList;
	}
	/**
	 * @param attachmentList the attachmentList to set
	 */
	public void setAttachmentList(List<String> attachmentList) {
		this.attachmentList = attachmentList;
	}
	/**
	 * @return the createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
