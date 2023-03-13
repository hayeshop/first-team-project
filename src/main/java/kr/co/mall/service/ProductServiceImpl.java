package kr.co.mall.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mall.mapper.ProductMapper;
import kr.co.mall.vo.ProductVo;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;

	@Override
	public String pro_home(Model model, HttpServletRequest request) {
		String pcode=request.getParameter("pcode");
		model.addAttribute("pcode",pcode);
		
		int page;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int index=(page-1)*20;
		
		ArrayList<ProductVo> plist=mapper.getPro(pcode,index);
		model.addAttribute("plist",plist);
		
		int pstart=page/10;
		if(page%10==0)
			pstart--;
		pstart=pstart*10+1;
		int pend=pstart+9;
		
		int chong=mapper.getChong(pcode);
		
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("page",page);
		
		return "/product/pro_home";
	}

	@Override
	public String pcontent(Model model, HttpServletRequest request) {
		String pcode=request.getParameter("pcode");
		ProductVo pvo=mapper.pcontent(pcode);
		model.addAttribute("pvo",pvo);
		
		return "/product/pcontent";
	}
}
