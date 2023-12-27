package com.test.controller;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.model.commDTO;
import com.test.model.memberDTO;
import com.test.service.commService;

@Controller
public class commController {

	@Autowired
	private commService cs;
	
	@RequestMapping("commform")
	public String commform() {
		return "commform";
	}
	
	
	
	  @RequestMapping(value = "/commInsert", method = RequestMethod.POST) 
	  public String commInsert(@RequestParam("fileupload") MultipartFile mf,
			  					commDTO comm,
			  					HttpServletRequest request,
			  					HttpSession session,
			  					Model model) throws Exception{
	  
	  session.setAttribute("nick", comm.getNick());
	  
	  String filename = mf.getOriginalFilename(); 
	  int size = (int) mf.getSize();
	  System.out.println("filename:"+filename);
	  String path = request.getRealPath("upload"); 
	  System.out.println("path:"+path);
	  int result = 0;
	  
	  String newfilename = "";
	  
	  
	  if(size > 0) {
		  
		 String extension = filename.substring(filename.lastIndexOf("."),filename.length()); System.out.println("extension:" + extension);
				  
		 UUID uuid = UUID.randomUUID();
				  
		 newfilename = uuid.toString() + extension; 
		 System.out.println("newfilename:" + newfilename);
				  
		 	if(size > 100000) {
		 		result = 1;
		 		model.addAttribute("result", result);
		
		 		return "uploadresult";
				  
			}else if (!extension.equals(".jpg")&&
					  !extension.equals(".jpeg")&&
					  !extension.equals(".gif")&& 
					  !extension.equals(".png")) {
				  
				  result = 2; model.addAttribute("result", result);
				  
				  return "uploadresult"; 
			}
		} 
	  		if(size > 0 ) {
				  
				  mf.transferTo(new File(path + "/" + newfilename)); 
				    		
	  		}	  
				  
	  		comm.setCommunity_file(newfilename);
			cs.commInsert(comm);	  
				  
	  		
	  		return "redirect:commlist";
				  
		  
	  }
	  
	  
	  
	  
	  
	 
	 

	/*
	 * @RequestMapping("commInsert") public String commInsert(@ModelAttribute
	 * commDTO comm, Model model) {
	 * 
	 * int result = cs.commInsert(comm);
	 * 
	 * model.addAttribute("result", result);
	 * 
	 * return "redirect:commlist"; }
	 */
	
	@RequestMapping("commcontent")
	public String commcontent(@RequestParam("no") int no,
							  @RequestParam("page") String page,
							  HttpSession session,
							  Model model) {
		
		cs.commUpdateCount(no);
		
		commDTO comm = cs.getCommunity(no);
		
		model.addAttribute("comm", comm);
		model.addAttribute("page", page);
		
		return "commcontent";
	}

	@RequestMapping("commlist")
	public String commlist(@RequestParam(value = "page", defaultValue = "1") int page,
						   Model model) {
	
		int listCount = cs.getCommCount();
		
		int limit = 10;
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		
		List<memberDTO> commList = cs.getCommList(page);
		
		int pageCount = listCount/limit+((listCount%10 == 0)?0:1);
		
		int startPage = ((page-1)/10) * limit + 1;
		int endPage = startPage + 10 - 1;
		
		if(endPage > pageCount)
			endPage = pageCount;
		
		model.addAttribute("page", page);
		model.addAttribute("listCount", listCount);
		model.addAttribute("commList", commList);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "commlist";
	}
	
	
	
	
	
	
	
}
