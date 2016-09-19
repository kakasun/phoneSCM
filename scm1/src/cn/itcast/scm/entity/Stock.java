package cn.itcast.scm.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Stock implements Serializable{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 2935211134596286788L;

	private String stockId;

    private String shId;

    private String goodsId;

    private Date stockFirstdate;

    private Date stockLastdate;

    private Integer stockAmount;

    private BigDecimal stockPrice;

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId == null ? null : stockId.trim();
    }

    public String getShId() {
        return shId;
    }

    public void setShId(String shId) {
        this.shId = shId == null ? null : shId.trim();
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public Date getStockFirstdate() {
        return stockFirstdate;
    }

    public void setStockFirstdate(Date stockFirstdate) {
        this.stockFirstdate = stockFirstdate;
    }

    public Date getStockLastdate() {
        return stockLastdate;
    }

    public void setStockLastdate(Date stockLastdate) {
        this.stockLastdate = stockLastdate;
    }

    public Integer getStockAmount() {
        return stockAmount;
    }

    public void setStockAmount(Integer stockAmount) {
        this.stockAmount = stockAmount;
    }

    public BigDecimal getStockPrice() {
        return stockPrice;
    }

    public void setStockPrice(BigDecimal stockPrice) {
        this.stockPrice = stockPrice;
    }

	@Override
	public String toString() {
		return "Stock [stockId=" + stockId + ", shId=" + shId + ", goodsId="
				+ goodsId + ", stockFirstdate=" + stockFirstdate
				+ ", stockLastdate=" + stockLastdate + ", stockAmount="
				+ stockAmount + ", stockPrice=" + stockPrice + "]";
	}
    
    
}