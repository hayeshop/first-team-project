package kr.co.mall.mapper;

import java.util.ArrayList;

import kr.co.mall.vo.ProductVo;

public interface ProductMapper {

	public ArrayList<ProductVo> getPro(String pcode, int index);

	public int getChong(String pcode);

	public ProductVo pcontent(String pcode);

}
