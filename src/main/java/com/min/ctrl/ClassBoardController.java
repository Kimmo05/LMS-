package com.min.ctrl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.min.service.IClassBoardService;
import com.min.vo.ClassBoardVo;

@Controller
public class ClassBoardController {

	@Autowired
	private IClassBoardService service;
	
	@RequestMapping(value = "/classBoardSelectedAll.do", method = RequestMethod.GET)
	public String classBoardSelectedAll(Model model , @SessionAttribute("cla_num") String cla_num, @RequestParam(required = false) String cbo_cate) {
		ClassBoardVo vo = new ClassBoardVo();
		if(cbo_cate == null) {
			vo.setCbo_cate("동영상");
			System.out.println("동영상");
		}else {
			vo.setCbo_cate(cbo_cate);
		}
		vo.setCbo_cla_num(cla_num);
		List<ClassBoardVo> lists = service.classBoardSelectedAll(vo);
		model.addAttribute("lists", lists);
		model.addAttribute("cbo_cate", cbo_cate);
		return "admin/admin_classBoardSelectAll";
	}
	
	
	@RequestMapping(value = "/classBoardSelectDetail.do", method = RequestMethod.GET)
	public String classBoardSelectDetail(HttpSession session, Model model, @RequestParam int cbo_seq) {
		ClassBoardVo result = service.classBoardSelectDetail(cbo_seq);
		model.addAttribute("result", result);
		String doc_originname = service.findFile(cbo_seq);
		model.addAttribute("doc_originname", doc_originname);
		return "admin/admin_classBoardSelectDetail";
	}
	
	@RequestMapping(value = "/classVideoInsertForm.do", method = RequestMethod.GET)
	public String classBoardInsertForm(@SessionAttribute("cla_num") String cla_num) {
		return "admin/admin_classVideoInsertForm";
	}
	
	@RequestMapping(value = "/classVideoInsert.do", method = RequestMethod.POST)
	public String classVideoInsert() {
		File file = new File("C:/upload/tmp");
		// 디렉토리 생성
		boolean directoryCreated = file.mkdirs();
		// 결과 출력
		System.err.println(directoryCreated);
		return "redirect:/classBoardSelectedAll.do";
	}
	
	
	
	@RequestMapping(value = "/classDocumentInsertForm.do", method = RequestMethod.GET)
	public String classDocumentInsertForm(@SessionAttribute("cla_num") String cla_num) {
		File file = new File("C:/upload/tmp");
		// 디렉토리 생성
		boolean directoryCreated = file.mkdirs();
		// 결과 출력
		System.err.println(directoryCreated);
		return "admin/admin_classDocumentInsertForm";
	}
	
	
	@RequestMapping(value = "/classDocumentInsert.do", method = RequestMethod.POST)
	public String classDocumentInsert(MultipartFile[] uploadFile, @RequestParam Map<String, Object> map,
			@RequestParam List<MultipartFile> filename, @SessionAttribute("cla_num") String cla_num) throws IOException {
		String uploadFolder = "C:/upload/tmp";
		
		for (MultipartFile multipartFile : uploadFile) {
			System.out.println("--------------------------------------");
			System.out.println("Upload File Name : " + multipartFile.getOriginalFilename());
			System.out.println("Upload File Size : " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + multipartFile.getOriginalFilename().substring(0, multipartFile.getOriginalFilename().indexOf("."));
			map.put("cbo_cla_num", cla_num);
			map.put("cbo_cate", "자료");
			map.put("cbo_ins_id", "thdwndrlrkdtk123");
			map.put("doc_originname", multipartFile.getOriginalFilename());
			map.put("doc_savename", storedFileName);
			map.put("doc_path", uploadFolder);
			map.put("doc_extention", multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().indexOf(".")));
		}
		service.classDocInsert(map);
		return "redirect:/classBoardSelectedAll.do";
	}
	
	@RequestMapping(value = "/test.do",method = RequestMethod.GET)
	public String test(@RequestParam int seq) {
		String result = service.findFile(seq);
		System.out.println(result);
		return null;
	}
	
	@RequestMapping(value = "/documentDownload.do", method = RequestMethod.GET)
	public String documentDownload(HttpServletRequest request, HttpServletResponse response, @RequestParam String doc_originname, Model model) {
		try {
			String filePath = "C:/upload/tmp/";
			System.out.println(doc_originname);
			File dFile = new File(filePath, doc_originname);
			System.out.println(dFile);
			int fSize = (int) dFile.length();

			if (fSize > 0) {
				String encodedFileName = "attatchment; filename=" + "''" + URLEncoder.encode(doc_originname, "UTF-8");
				response.setContentType("application/octet-stream; charset=UTF-8");
				response.setHeader("Content-Disposition", encodedFileName);
				response.setContentLength(fSize);

				BufferedInputStream in = null;
				BufferedOutputStream out = null;

				in = new BufferedInputStream(new FileInputStream(dFile));

				out = new BufferedOutputStream(response.getOutputStream());

				try {
					byte[] buffer = new byte[4096];
					int bytesRead = 0;

					while ((bytesRead = in.read(buffer)) != -1) {
						out.write(buffer, 0, bytesRead);
					}

					out.flush();

				} finally {
					in.close();
					out.close();
				}
			} else {
				throw new FileNotFoundException("파일이 존재하지 않습니다");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
