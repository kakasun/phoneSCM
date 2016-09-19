package cn.itcast.scm.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class ReturnOrder implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 2922074916083673377L;

	private String roId;

    private Integer supId;

    private String shId;

    private Date roDate;

    private BigDecimal roPayable;

    private BigDecimal roPaid;

    private String roRemark;

    private String roAttn;

    private Integer roOperator;
    
    private List<ReturnOrderDetail> returnOrderDetails;

    public String getRoId() {
        return roId;
    }

    public void setRoId(String roId) {
        this.roId = roId == null ? null : roId.trim();
    }

    public Integer getSupId() {
        return supId;
    }

    public void setSupId(Integer supId) {
        this.supId = supId;
    }

    public String getShId() {
        return shId;
    }

    public void setShId(String shId) {
        this.shId = shId == null ? null : shId.trim();
    }

    public Date getRoDate() {
        return roDate;
    }

    public void setRoDate(Date roDate) {
        this.roDate = roDate;
    }

    public BigDecimal getRoPayable() {
        return roPayable;
    }

    public void setRoPayable(BigDecimal roPayable) {
        this.roPayable = roPayable;
    }

    public BigDecimal getRoPaid() {
        return roPaid;
    }

    public void setRoPaid(BigDecimal roPaid) {
        this.roPaid = roPaid;
    }

    public String getRoRemark() {
        return roRemark;
    }

    public void setRoRemark(String roRemark) {
        this.roRemark = roRemark == null ? null : roRemark.trim();
    }

    public String getRoAttn() {
        return roAttn;
    }

    public void setRoAttn(String roAttn) {
        this.roAttn = roAttn == null ? null : roAttn.trim();
    }

    public Integer getRoOperator() {
        return roOperator;
    }

    public void setRoOperator(Integer roOperator) {
        this.roOperator = roOperator;
    }

	@Override
	public String toString() {
		return "ReturnOrder [roId=" + roId + ", supId=" + supId + ", shId="
				+ shId + ", roDate=" + roDate + ", roPayable=" + roPayable
				+ ", roPaid=" + roPaid + ", roRemark=" + roRemark + ", roAttn="
				+ roAttn + ", roOperator=" + roOperator
				+ ", returnOrderDetails=" + returnOrderDetails + "]";
	}

	public List<ReturnOrderDetail> getReturnOrderDetails() {
		return returnOrderDetails;
	}

	public void setReturnOrderDetails(List<ReturnOrderDetail> returnOrderDetails) {
		this.returnOrderDetails = returnOrderDetails;
	}

    
}