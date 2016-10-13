package com.fushionbaby.sku.model;

import java.util.Date;

/**
 * @description 标签和分类的配置
 * @author 索亮
 * @date 2015年7月27日下午5:06:13
 */
public class SkuLabelCategoryRelation {
	/** 标签分类配置id */
	private Long id;
	/** 标签编码 */
	private String labelCode;
	/** 分类code */
	private String categoryCode;
	/** 创建时间 */
	private Date createTime;
	/** 创建时间 */
	private Date updateTime;
	/** 排序 */
	private int sortOrder;
	/** 是否禁用 */
	private String disable;
	/** 后台创建id */
	private Long createId;
	/** 后台修改id */
	private Long updateId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLabelCode() {
		return labelCode;
	}

	public void setLabelCode(String labelCode) {
		this.labelCode = labelCode;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public int getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

	public String getDisable() {
		return disable;
	}

	public void setDisable(String disable) {
		this.disable = disable;
	}

	public Long getCreateId() {
		return createId;
	}

	public void setCreateId(Long createId) {
		this.createId = createId;
	}

	public Long getUpdateId() {
		return updateId;
	}

	public void setUpdateId(Long updateId) {
		this.updateId = updateId;
	}

}