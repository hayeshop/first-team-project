package kr.co.mall.vo;

public class OrderVo {
	private int id,bae_id,su,pay,pro_juk,state,pprice,bank,card,gigan,gibonpay,use_juk;
	private String userid,pcode,ordercode,writeday,su2,cprice2,juk2;
	public int getBank() {
		return bank;
	}
	public void setBank(int bank) {
		this.bank = bank;
	}
	public int getCard() {
		return card;
	}
	public void setCard(int card) {
		this.card = card;
	}
	public int getGigan() {
		return gigan;
	}
	public void setGigan(int gigan) {
		this.gigan = gigan;
	}
	public int getGibonpay() {
		return gibonpay;
	}
	public void setGibonpay(int gibonpay) {
		this.gibonpay = gibonpay;
	}
	public String getJuk2() {
		return juk2;
	}
	public void setJuk2(String juk2) {
		this.juk2 = juk2;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getCprice2() {
		return cprice2;
	}
	public void setCprice2(String cprice2) {
		this.cprice2 = cprice2;
	}
	public String getSu2() {
		return su2;
	}
	public void setSu2(String su2) {
		this.su2 = su2;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBae_id() {
		return bae_id;
	}
	public void setBae_id(int bae_id) {
		this.bae_id = bae_id;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getPro_juk() {
		return pro_juk;
	}
	public void setPro_juk(int pro_juk) {
		this.pro_juk = pro_juk;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
}
