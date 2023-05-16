package com.devpro.javaweb22.dto;

import java.math.BigDecimal;

/**
 * Biểu thị cho 1 sản phẩm trong giỏ hàng.
 * @author daing
 *
 */
public class CartItem {
	// mã sản phẩm 
	private int productId;
	
	// tên sản phẩme
	private String productName;
	
	// số lương sản phẩm
	private int quality;

	private String image;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	// đơn giá sản phẩm
	private BigDecimal priceUnit;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}



	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}
}
