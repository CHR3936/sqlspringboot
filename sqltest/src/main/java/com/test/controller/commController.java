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
		return "comm/commform";
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
		
		 		return "comm/uploadresult";
				  
			}else if (!extension.equals(".jpg")&&
					  !extension.equals(".jpeg")&&
					  !extension.equals(".gif")&& 
					  !extension.equals(".png")) {
				  
				  result = 2; 
				  model.addAttribute("result", result);
				  
				  return "comm/uploadresult"; 
			}
		} 
	  		if(size > 0 ) {
				  
				  mf.transferTo(new File(path + "/" + newfilename)); 
				    		
	  		}	  
				  
	  		comm.setCommunity_file(newfilename);
			cs.commInsert(comm);	  
				  
	  		model.addAttribute("filename", filename);
	  		
	  		return "redirect:commlist";
				  
		  
	  }
	  
	  
	  
	  
	@RequestMapping("commcontent")
	public String commcontent(@RequestParam("no") int no,
							  @RequestParam("page") String page,
							  memberDTO member,
 							  HttpSession session,
							  Model model) {

		cs.commUpdateCount(no);
		
		commDTO comm = cs.getCommunity(no);
		
		model.addAttribute("comm", comm);
		model.addAttribute("page", page);
		return "comm/commcontent";
	}

	@RequestMapping("commlist")
	public String commlist(@RequestParam(value = "page", defaultValue = "1") int page,
						   HttpSession session, memberDTO member ,Model model) {
	
		
		
		int listCount = cs.getCommCount();		
		
		
		int seq = 0;
		int start = (page - 1) * 10;
		int limit = 10;
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		
		List<memberDTO> commList = cs.getCommList(start);
		
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
		
		return "comm/commlist";
	}
	
	@RequestMapping("commupdateform")
	public String commupdateform(@RequestParam("no") int no,
								 @RequestParam("page") String page,
								 Model model) {
		
		
		commDTO comm = cs.getCommunity(no);
		
		model.addAttribute("comm", comm);
		model.addAttribute("page", page);
		
		return "comm/commupdateform";
	}
	
	
	@RequestMapping(value = "/commupdate", method = RequestMethod.POST) 
	  public String commupdate(@RequestParam("fileupload") MultipartFile mf,
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
		
		 		return "comm/uploadresult";
				  
			}else if (!extension.equals(".jpg")&&
					  !extension.equals(".jpeg")&&
					  !extension.equals(".gif")&& 
					  !extension.equals(".png")) {
				  
				  result = 2; 
				  model.addAttribute("result", result);
				  
				  return "comm/uploadresult"; 
			}
		} 
	  		if(size > 0 ) {
				  
				  mf.transferTo(new File(path + "/" + newfilename)); 
				    		
	  		}	  
				  
	  		comm.setCommunity_file(newfilename);
			cs.commUpdate(comm);	  
				  
	  		model.addAttribute("filename", filename);
	  		
	  		return "redirect:commlist";
				  
		  
	  }
		
	 @RequestMapping("commdelete")
	 public String commdelete(@ModelAttribute commDTO comm,
			 				  @RequestParam("page") String page,
			 				  Model model) {
		 
		 int result = cs.commDelete(comm.getNo());
		 
		 model.addAttribute("result", result);
		 model.addAttribute("page", page);
				 
		return "redirect:commlist"; 
	 }
		

	
}
