package kr.co.mall.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mall.mapper.CustomMapper;
import kr.co.mall.vo.FaqVo;
import kr.co.mall.vo.GongjiVo;

@Service
@Qualifier("cs")
public class CustomServiceImpl implements CustomService {

	@Autowired
	private CustomMapper mapper;

	@Override
	public String custom(Model model) {
		ArrayList<FaqVo> flist=mapper.getFaq();
		model.addAttribute("flist",flist);
		
		ArrayList<GongjiVo> glist=mapper.getGongji();
		model.addAttribute("glist",glist);
		
		return "/customer/custom";
	}
}
