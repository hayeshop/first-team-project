package kr.co.mall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mall.mapper.ProductMapper;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;

	@Override
	public String pro_home(Model model) {
		model.addAttribute("plist",mapper.getPro());
		return "/product/pro_home";
	}
}
