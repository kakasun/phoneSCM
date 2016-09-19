package cn.itcast.scm.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class ReturnOrderDetail implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -4564395398343017960L;

	private String rodId;

    private String goodsId;

    private String goodsUnit;

    private String goodsName;

    private String goodsType;

    private String goodsColor;

    private Integer rodAmount;

    private BigDecimal rodReturnPrice;

    private BigDecimal rodTotalPrice;

    private String roId;

    private String rodImeiList;

    public String getRodId() {
        return rodId;
    }

    public void setRodId(String rodId) {
        this.rodId = rodId == null ? null : rodId.trim();
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getGoodsUnit() {
        return goodsUnit;
    }

    public void setGoodsUnit(String goodsUnit) {
        this.goodsUnit = goodsUnit == null ? null : goodsUnit.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType == null ? null : goodsType.trim();
    }

    public String getGoodsColor() {
        return goodsColor;
    }

    public void setGoodsColor(String goodsColor) {
        this.goodsColor = goodsColor == null ? null : goodsColor.trim();
    }

    public Integer getRodAmount() {
        return rodAmount;
    }

    public void setRodAmount(Integer rodAmount) {
        this.rodAmount = rodAmount;
    }

    public BigDecimal getRodReturnPrice() {
        return rodReturnPrice;
    }

    public void setRodReturnPrice(BigDecimal rodReturnPrice) {
        this.rodReturnPrice = rodReturnPrice;
    }

    public BigDecimal getRodTotalPrice() {
        return rodTotalPrice;
    }

    public void setRodTotalPrice(BigDecimal rodTotalPrice) {
        this.rodTotalPrice = rodTotalPrice;
    }

    public String getRoId() {
        return roId;
    }

    public void setRoId(String roId) {
        this.roId = roId == null ? null : roId.trim();
    }

    public String getRodImeiList() {
        return rodImeiList;
    }

    public void setRodImeiList(String rodImeiList) {
        this.rodImeiList = rodImeiList == null ? null : rodImeiList.trim();
    }

	@Override
	public String toString() {
		return "ReturnOrderDetail [rodId=" + rodId + ", goodsId=" + goodsId
				+ ", goodsUnit=" + goodsUnit + ", goodsName=" + goodsName
				+ ", goodsType=" + goodsType + ", goodsColor=" + goodsColor
				+ ", rodAmount=" + rodAmount + ", rodReturnPrice="
				+ rodReturnPrice + ", rodTotalPrice=" + rodTotalPrice
				+ ", roId=" + roId + ", rodImeiList=" + rodImeiList + "]";
	}
    
}