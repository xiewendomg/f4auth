package com.keduox.entity.base;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;

import com.keduox.util.StatusUtil;
/**
 * 
* @ClassName: BaseEntity
* @Description: 项目所有主类的entity类的父类
* @author 余东山
* @date 2015年7月1日 上午9:43:37
*
 */
@MappedSuperclass	
public class  BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;
	/**
	 * 创建时间
	 */
	@Column(name="createDatetime",length=20,nullable=false)
	private String createDatetime;
	/**
	 * 最后修改时间
	 */
	@Column(name="lastUpdatetime",length=20)
	private String lastUpdatetime;
	
	@Column(name="status",length=1,nullable=false)
	private Integer status;	//状态
	
	public String getCreateDatetime() {
		return createDatetime;
	}
	public void setCreateDatetime(String createDatetime) {
		this.createDatetime = createDatetime;
	}
	public String getLastUpdatetime() {
		return lastUpdatetime;
	}
	public void setLastUpdatetime(String lastUpdatetime) {
		this.lastUpdatetime = lastUpdatetime;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}

	
	
	
	
	
}
